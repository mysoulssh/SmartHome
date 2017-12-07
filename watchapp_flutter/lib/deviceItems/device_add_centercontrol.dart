import 'package:flutter/material.dart';
import 'cells/scene_action_cell.dart';
import 'cells/action_scene_cell_model.dart';
import 'device_add_action.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';
import 'package:watchapp_flutter/deviceItems/models/device_detail_info_model.dart';
import 'package:watchapp_flutter/deviceItems/models/device_info_model.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/deviceItems/models/subdevice_info_model.dart';

typedef void DeviceSelectCallback(ActionSceneCellModel model, SubDeviceInfoModel subDeviceInfoModel);

class DeviceCenterControl extends StatefulWidget{

  DeviceCenterControl({this.callback,this.isRule});

  final bool isRule;
  final DeviceSelectCallback callback;

  @override
  _DeviceCenterControlState createState() => new _DeviceCenterControlState();
}

class _DeviceCenterControlState extends State<DeviceCenterControl>{

  List<ActionSceneCell> _cell = <ActionSceneCell>[];

  @override
  void initState(){
    super.initState();
//    for (ActionSceneCellModel model in modelList){
//      _cell.add(new ActionSceneCell(tmpModel: model,callback: (ActionSceneCellModel cellModel){
//        DeviceAddAction actionScene = new DeviceAddAction(isRule: widget.isRule,callback: (ActionSceneCellModel model){
//          widget.callback(model);
//        },);
//        Navigator.of(context).push(new MaterialPageRoute(
//            builder: (BuildContext context){
//              return new NavigationBar(actionScene, '添加动作');
//            }
//        ));
//      },));
//    }

    loadCenterControl();
  }


  void loadCenterControl(){
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

          for (var i=0; i<infoModels.length; i++){
            DeviceInfoModel deviceInfoModel = models[i];
            DeviceDetailInfoModel deviceDetailInfoModel = infoModels[i];
            if (deviceDetailInfoModel.prodtCode.first == 'YHUB'){
              _cell.add(new ActionSceneCell(
                tmpModel: new ActionSceneCellModel(
                    image: new Image(image: new AssetImage('images/testIcon.jpg')),
                    deviceName: deviceInfoModel.deviceName,
                    location: '未知',
                    status: i,
                    deviceId: deviceInfoModel.deviceId
                ),
                callback: (ActionSceneCellModel cellModel){
                  DeviceAddAction actionScene = new DeviceAddAction(isRule: widget.isRule, deviceId: deviceInfoModel.deviceId,callback: (ActionSceneCellModel model, SubDeviceInfoModel subDeviceInfoModel){
                    widget.callback(model,subDeviceInfoModel);
                  },);
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context){
                        return new NavigationBar(actionScene, '添加动作');
                      }
                  ));
                },
              ));
            }
          }
          setState((){});
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