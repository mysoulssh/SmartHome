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


class DeviceAreaScene extends StatefulWidget{

  DeviceAreaScene(this.title, this.houseGuid, this.areaGuid);

  final String title;
  final String houseGuid;
  final String areaGuid;

  _DeviceAreaSceneState sceneState = new _DeviceAreaSceneState();

  @override
  _DeviceAreaSceneState createState() => sceneState;
}

class _DeviceAreaSceneState extends State<DeviceAreaScene>{

  List<DeviceSceneCell> _cell = <DeviceSceneCell>[];

  @override
  void initState(){
    super.initState();

    loadAreaList();
  }

  void addAreaDevice(String deviceId, String subDeviceId){
    httpManage.houseAreaDeviceSet(
        UserAccessModel.accessModel.accessToken,
        widget.houseGuid,
        widget.areaGuid,
        deviceId,
        subDeviceId,
        (Map map){
          loadAreaList();
        }, (String errorMsg){
      ShowInfo.showInfo(context, content: errorMsg);
    });

  }

  void loadAreaList(){
    httpManage.houseDeviceList(UserAccessModel.accessModel.accessToken, widget.houseGuid, 1, 20, (Map map){

      print('houseDeviceList = $map');
      List<HouseDeviceInfoModel> infoModels = map['models'];
      List<String> deivceIds = <String>[];
      List<QueryInfo> queryInfos = <QueryInfo>[];

      if (infoModels.length > 0){

        for (var v in infoModels){
          deivceIds.add(v.deviceId);

          var info = new QueryInfo();
          info.deviceId = v.deviceId;
          info.subDeviceId = v.subDeviceId;

          queryInfos.add(info);
        }

        httpManage.deviceStatusGet(UserAccessModel.accessModel.accessToken, queryInfos, (Map map){
          List<StatusInfoModel> statusInfo = map['models'];

          _cell.removeRange(0, _cell.length);

          for(var i=0; i< infoModels.length; i++){

            HouseDeviceInfoModel deviceInfoModel  = infoModels[i];
            DeviceDetailInfoModel detailInfoModel = new DeviceDetailInfoModel()
            ..deviceId = deviceInfoModel.deviceId;
            StatusInfoModel statusInfoModel       = statusInfo[i];

            if (statusInfoModel.subDeviceId != null || statusInfoModel.subDeviceId != ''){
              deviceInfoModel.deviceName = TypeJudgment.judgmentType(deviceInfoModel.prodtType.first);
            }

            _cell.add(new DeviceSceneCell(
              houseDeviceInfoModel: deviceInfoModel,
              deviceDetailInfoModel: detailInfoModel,
              statusInfoModel: statusInfoModel,
              image: new Image(image: const AssetImage('images/testIcon.jpg')),
              isTurnOn: false,
              isNeedSwitch: true,
              callback: (String deviceId, String subId){
                delAreaDevice(deviceId,subId);
              },
//              controlCallback: (){
//                DeviceCenterControlScene controlScene = new DeviceCenterControlScene(deviceInfoModel.deviceId, (String devId, String subId){
//                  addAreaDevice(devId, subId);
//                },false);
//                Navigator.of(context).push(new MaterialPageRoute<Null>(builder: (BuildContext context) => new NavigationBar(
//                  controlScene,
//                  deviceInfoModel.deviceName,
//                ))).then((onValue){
//
//                });
//              },
            ));
          }

          setState((){});
        }, (String errorMsg){

        });


        /*
        httpManage.deviceInfoGet(deivceIds, UserAccessModel.accessModel.accessToken, (Map map){
          List<DeviceDetailInfoModel> detailInfo = map['models'];
          httpManage.deviceStatusGet(UserAccessModel.accessModel.accessToken, queryInfos, (Map map){
            List<StatusInfoModel> statusInfo = map['models'];

            _cell.removeRange(0, _cell.length);

            for(var i=0; i< infoModels.length; i++){

              HouseDeviceInfoModel deviceInfoModel  = infoModels[i];
              DeviceDetailInfoModel detailInfoModel = detailInfo[i];
              StatusInfoModel statusInfoModel       = statusInfo[i];

              _cell.add(new DeviceSceneCell(
                houseDeviceInfoModel: deviceInfoModel,
                deviceDetailInfoModel: detailInfoModel,
                statusInfoModel: statusInfoModel,
                image: new Image(image: const AssetImage('images/testIcon.jpg')),
                isTurnOn: false,
                isNeedSwitch: detailInfoModel.prodtCode.first != 'YHUB',
                callback: (String deviceId, String subId){
                  delAreaDevice(deviceId,subId);
                },
                controlCallback: (){
                  DeviceCenterControlScene controlScene = new DeviceCenterControlScene(deviceInfoModel.deviceId, (String devId, String subId){
                    addAreaDevice(devId, subId);
                  },false);
                  Navigator.of(context).push(new MaterialPageRoute<Null>(builder: (BuildContext context) => new NavigationBar(
                      controlScene,
                      deviceInfoModel.deviceName,
                  ))).then((onValue){

                  });
                },
              ));
            }

            setState((){});
          }, (String errorMsg){

          });
        }, (String errorMsg){

        });
        */

      }else{
        _cell.removeRange(0, _cell.length);
        setState((){});
      }

    }, (String errorMsg){
      ShowInfo.showInfo(context, content: errorMsg);
    },areaGuid: widget.areaGuid);
  }

  void delAreaDevice(String deviceId, String subId){
    httpManage.houseAreaDeviceDel(UserAccessModel.accessModel.accessToken, widget.houseGuid, widget.areaGuid, deviceId, subId, (Map map){
      loadAreaList();
    }, (String errorMsg){

    });
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
