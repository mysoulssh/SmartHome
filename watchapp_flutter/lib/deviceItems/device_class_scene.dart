import 'package:flutter/material.dart';
import 'cells/scene_device_cell.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';
import 'package:watchapp_flutter/deviceItems/models/house_device_info_model.dart';
import 'package:watchapp_flutter/deviceItems/models/device_detail_info_model.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceStatusGet/DeviceStatusGet.pb.dart';
import 'package:watchapp_flutter/deviceItems/models/status_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';


class DeviceClassScene extends StatefulWidget{

  DeviceClassScene(this.classList,this.isCenter);

  List<HouseDeviceInfoModel> classList;
  bool isCenter;

  _DeviceClassSceneState sceneState = new _DeviceClassSceneState();

  @override
  _DeviceClassSceneState createState() => sceneState;
}

class _DeviceClassSceneState extends State<DeviceClassScene>{

  List<DeviceSceneCell> _cell = <DeviceSceneCell>[];

  @override
  void initState(){
    super.initState();
    List<QueryInfo> queryInfoList = <QueryInfo>[];

    for (var v in widget.classList){
      queryInfoList.add(new QueryInfo()
          ..deviceId=v.deviceId
          ..subDeviceId = v.subDeviceId
      );
    }

    if (queryInfoList.length > 0){
      httpManage.deviceStatusGet(UserAccessModel.accessModel.accessToken, queryInfoList, (Map map){
        List<StatusInfoModel> statusInfos = map['models'];

        for (var i=0; i<statusInfos.length; i++){
          StatusInfoModel statusInfoModel = statusInfos[i];

          DeviceDetailInfoModel deviceDetailInfoModel = new DeviceDetailInfoModel();
          deviceDetailInfoModel.deviceId = statusInfoModel.subDeviceId==''?statusInfoModel.deviceId:statusInfoModel.subDeviceId;

          bool isTurnOn = false;
          if (statusInfoModel.argInt32.length > 0){
            isTurnOn = statusInfoModel.argInt32.first == 1;
          }

          String image;
          if (statusInfoModel.subDeviceId != ''){
            image = TypeJudgment.judgmentDeviceImage(statusInfoModel.subDeviceId.substring(4,8));
          }else{
            image = TypeJudgment.judgmentDeviceImage(statusInfoModel.deviceId.substring(4,8));
          }

          _cell.add(new DeviceSceneCell(
            houseDeviceInfoModel: widget.classList[i],
            statusInfoModel: statusInfoModel,
            deviceDetailInfoModel: deviceDetailInfoModel,
            image: new Image(image: new AssetImage(widget.isCenter?'images/icon_centercontrol.png':image)),
            isTurnOn: isTurnOn,
            isNeedSwitch: !widget.isCenter,
            centerControlCallback: widget.isCenter?(){

            }:null,
          ));
        }

        setState((){});

      }, (String errorMsg){

      });
    }
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.white,
      child: new ListView.builder(
        itemBuilder: (_,int index) => _cell[index],
        itemCount: _cell.length,
      ),
    );
  }
}
