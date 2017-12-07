import 'package:flutter/material.dart';
import 'cells/scene_device_cell.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/deviceItems/models/device_info_model.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';
import 'package:watchapp_flutter/deviceItems/models/device_detail_info_model.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceStatusGet/DeviceStatusGet.pb.dart';
import 'package:watchapp_flutter/deviceItems/models/status_info_model.dart';
import 'package:watchapp_flutter/deviceItems/device_center_control_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';


enum EnterType{
  typeDevice,
  typeMe,
}

typedef addCallback(String id, String subId);

class DeviceScene extends StatefulWidget{

  DeviceScene(this.title, this.type, {this.callback});

  final String title;
  final EnterType type;
  final addCallback callback;

  _DeviceSceneState sceneState = new _DeviceSceneState();

  @override
  _DeviceSceneState createState() => sceneState;
}

class _DeviceSceneState extends State<DeviceScene>{

  List<DeviceSceneCell> _cell = <DeviceSceneCell>[];

  @override
  void initState(){
    super.initState();

    loadList();
  }

  void addDevice(String deviceName,String deviceId){
    httpManage.userDeviceAdd(UserAccessModel.accessModel.accessToken, deviceId, deviceName, (Map map){
      loadList();
    }, (String errorMsg){
      ShowInfo.showInfo(context, content: errorMsg);
    });
  }

  void loadList(){
    httpManage.userDeviceList(UserAccessModel.accessModel.accessToken, 1, 20, (Map map){
      _cell.removeRange(0, _cell.length);
      List<DeviceInfoModel> models = map['models'];

      if (models.length <= 0) return;

      List<String> modelsDeviceIds = <String>[];
      for (var v in models){
        modelsDeviceIds.add(v.deviceId);
      }

      if (modelsDeviceIds.length > 0){
        httpManage.deviceInfoGet(modelsDeviceIds, UserAccessModel.accessModel.accessToken, (Map map){
          List<DeviceDetailInfoModel> infoModels = map['models'];
          List<QueryInfo> querys = <QueryInfo>[];


          for (var v in modelsDeviceIds){
            QueryInfo info = new QueryInfo()
                ..subDeviceId = ''
                ..deviceId = v;
            querys.add(info);
          }
          httpManage.deviceStatusGet(UserAccessModel.accessModel.accessToken, querys, (Map map){
            List<StatusInfoModel> status = map['models'];
            print('$status');

            for (int i = 0; i<models.length; i++){

              DeviceInfoModel deviceInfo       = models[i];
              DeviceDetailInfoModel detailInfo = infoModels[i];
              StatusInfoModel statusInfo       = status[i];

              _cell.add(new DeviceSceneCell(
                deviceInfoModel: deviceInfo,
                deviceDetailInfoModel: detailInfo,
                statusInfoModel: statusInfo,
                image: new Image(image: const AssetImage('images/testIcon.jpg')),
                isTurnOn: false,
                isNeedSwitch: detailInfo.prodtCode.first != 'YHUB',
                deviceCallback: widget.type==EnterType.typeDevice?(String id){
                  widget.callback(id,'');
                  Navigator.of(context).pop();
                }:null,
                callback: (String deviceId, String subId){
                  delDevice(deviceId);
                },
                controlCallback: detailInfo.prodtCode.first == 'YHUB'?(){
                  DeviceCenterControlScene controlScene = new DeviceCenterControlScene(deviceInfo.deviceId, (String deviceId, String subId){
                    if (widget.type == EnterType.typeDevice){
                      widget.callback(deviceId,subId);
                      Navigator.of(context).pop();
                    }else{
                      addDevice(deviceId, subId);
                    }
                  },widget.type==EnterType.typeMe?true:false);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new NavigationBar(
                    controlScene,
                    deviceInfo.deviceName,
                  )));
                }:null,
              ));
            }

            setState((){});
          }, (String errorMsg){

          });

        }, (String errorMsg){
          ShowInfo.showInfo(context, content: errorMsg);
        });
      }else
      {
        return;
      }

    }, (String errorMsg){
      ShowInfo.showInfo(context, content: errorMsg);
    });
  }

  void delDevice(String deviceId){
    httpManage.userDeviceDel(UserAccessModel.accessModel.accessToken, deviceId, (Map map){
      print('删除成功');
      loadList();
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
