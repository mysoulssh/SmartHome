import 'package:flutter/material.dart';
import 'cells/scene_device_cell.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/deviceItems/models/house_device_info_model.dart';
import 'package:watchapp_flutter/deviceItems/models/device_detail_info_model.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceStatusGet/DeviceStatusGet.pb.dart';
import 'package:watchapp_flutter/deviceItems/models/status_info_model.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';
import 'dart:async';
import 'models/subdevice_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';

typedef DeviceCenterControlSceneCallback(String deviceId, String subId);

class DeviceCenterControlScene extends StatefulWidget{

  DeviceCenterControlScene(this.deviceId,this.callback,this.isMeInfo);

  final String deviceId;
  final DeviceCenterControlSceneCallback callback;
  final bool isMeInfo;

  _DeviceCenterControlSceneState sceneState = new _DeviceCenterControlSceneState();

  @override
  _DeviceCenterControlSceneState createState() => sceneState;
}

class _DeviceCenterControlSceneState extends State<DeviceCenterControlScene> with TickerProviderStateMixin{

  List<DeviceSceneCell> _cell = <DeviceSceneCell>[];

  Timer timer;
  String scanStr;
  bool isScanDevice;

  @override
  void initState(){
    super.initState();

    isScanDevice = true;
    scanStr = '扫描子设备';

    loadHubList();
  }

  @override
  void dispose(){
    super.dispose();
    if(timer != null){
      timer.cancel();
      timer = null;
    }
  }

  void loadHubList(){
    httpManage.deviceHubDeviceList(UserAccessModel.accessModel.accessToken, widget.deviceId, (Map map){
      print('deviceHubDeviceList = $map');

      List<SubDeviceInfoModel> infoModels = map['models'];
      List<String> deviceIds = <String>[];
      List<QueryInfo> querys = <QueryInfo>[];
      List<String> deviceType = <String>[];

      if (infoModels.length > 0){
        for (var v in infoModels){
          QueryInfo queryInfo   = new QueryInfo();
          queryInfo.deviceId    = widget.deviceId;
          queryInfo.subDeviceId = v.subDeviceId;

          querys.add(queryInfo);
          deviceIds.add(v.subDeviceId);

          String strType = v.subDeviceId.substring(4,8);
          deviceType.add(strType);
        }

        httpManage.deviceStatusGet(UserAccessModel.accessModel.accessToken, querys, (Map map){
          List<StatusInfoModel> models = map['models'];
          _cell.removeRange(0, _cell.length);

          for (int i=0; i<models.length; i++){

            StatusInfoModel statusInfoModel = models[i];

            HouseDeviceInfoModel houseDeviceInfoModel = new HouseDeviceInfoModel()
              ..deviceName = TypeJudgment.judgmentType(deviceType[i]);
            DeviceDetailInfoModel deviceDetailInfoModel = new DeviceDetailInfoModel()
              ..deviceId = deviceIds[i];

            _cell.add(new DeviceSceneCell(
              houseDeviceInfoModel: houseDeviceInfoModel,
              deviceDetailInfoModel: deviceDetailInfoModel,
              statusInfoModel: statusInfoModel,
              image: new Image(image: const AssetImage('images/testIcon.jpg')),
              isTurnOn: statusInfoModel.subDeviceId.substring(3,4)=='C'?TypeJudgment.judgmentSwitch(statusInfoModel, deviceType[i]):false,
              isNeedSwitch: statusInfoModel.subDeviceId.substring(3,4)=='C',
              deviceCallback: widget.isMeInfo?null:(String subId){
                if (widget.callback != null)
                  widget.callback(widget.deviceId,subId);
              },
            ));
          }
          setState((){});
        }, (String errorMsg){

        });

      }
    }, (String errorMsg){
      stopTimer();
    });
  }

  void startTimer(){
    loadHubList();
    timer = new Timer.periodic(new Duration(seconds: 10), (Timer timer){
      loadHubList();
    });
  }

  void stopTimer(){
    if(timer != null){
      timer.cancel();
      timer = null;
    }
  }

  void runIOTCmd(bool isScan){
    IOTCMD iotcmd = new IOTCMD();
    SIOTCMD cmd = new SIOTCMD();
    cmd.deviceId = widget.deviceId;
    cmd.subDeviceId = '';
    cmd.cmdid = 401;
    cmd.cmdType = 1;
    cmd.argInt32.add(isScan?1:0);

    iotcmd.cmd.add(cmd);

    httpManage.deviceRunTOTCmd(UserAccessModel.accessModel.accessToken, iotcmd, (Map map){
      isScan?startTimer():stopTimer();
    }, (String errorMsg){
      stopTimer();
    });
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Expanded(child: new ListView.builder(
            itemBuilder: (_,int index) => _cell[index],
            itemCount: _cell.length,
          )),
          new Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: new ActionBtn(text: scanStr,callback: (){
              if (isScanDevice == true){
                scanStr = '关闭扫描';
                runIOTCmd(true);
                isScanDevice = false;
              }else{
                scanStr = '扫描子设备';
                runIOTCmd(false);
                isScanDevice = true;
              }
              setState((){});
            },),
          )
        ],
      ),
    );
  }
}
