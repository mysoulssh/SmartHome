import 'package:flutter/material.dart';
import 'device_add_action.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'cells/scene_cell.dart';
import 'cells/action_scene_cell_model.dart';
import 'device_add_centercontrol.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';
import 'package:watchapp_flutter/deviceItems/models/subdevice_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';
import 'package:watchapp_flutter/deviceItems/models/scene_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';


class DeviceAddScene extends StatefulWidget{
  DeviceAddScene(
      this.isEditScene,
      {
        this.sceneTitle,
        this.sceneId = '',
        this.cmd,
        this.sceneInfoModel
      });

  bool isEditScene;
  String sceneTitle;
  String sceneId;
  List<SIOTCMD> cmd;

  SceneInfoModel sceneInfoModel;

  _DeviceAddSceneState sceneState = new _DeviceAddSceneState();

  @override
  _DeviceAddSceneState createState() => sceneState;
}

class _DeviceAddSceneState extends State<DeviceAddScene>{
  final TextEditingController editController = new TextEditingController();

  List<SceneCell> _cell = <SceneCell>[];

  @override
  void initState(){
    super.initState();
    editController.text = widget.sceneTitle;
    if (widget.isEditScene) {
      for (var v in widget.sceneInfoModel.cmd.cmd){
        _cell.add(new SceneCell(model: new ActionSceneCellModel(
          image: new Image(image: new AssetImage(TypeJudgment.judgmentDeviceImage(v.subDeviceId.substring(4,8)))),
          deviceName: TypeJudgment.judgmentType(v.subDeviceId.substring(4,8)),
          location: '控制器',
          status: v.argInt32.first==1?0:1,
        ),
          switchBtnClickCallback: (bool isTurnOn){
            v.argInt32.removeAt(0);
            v.argInt32.insert(0, isTurnOn?1:0);
          },
        ));
      }
      editController.text = widget.sceneInfoModel.sceneName;
    }

    if (widget.cmd == null){
      widget.cmd = <SIOTCMD>[];
    }
  }

  @override
  void dispose(){
    editController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              children: <Widget>[
                new Expanded(child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text('场景名称',style: new TextStyle(fontSize: 16.0)),
                )),
                new Expanded(child: new Padding(padding: const EdgeInsets.only(right: 10.0),
                  child: new TextField(
                    controller: editController,
                    textAlign: TextAlign.end,
                    decoration: new InputDecoration(hintText: '请输入场景名称',hideDivider: true),
                    onChanged: (String text){
                      widget.sceneTitle = text;
                    },
                  ),
                )),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: new Color.fromRGBO(214, 214, 214, 1.0),
                child: new Text('触发场景模式后执行以下动作',textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: new Color.fromRGBO(126, 126, 126, 1.0),
                  ),
                ),
              ))
            ],
          ),
          new Expanded(child: new Container(
            color: Colors.white,
            child: new ListView.builder(
              itemBuilder: (_,int index) => _cell[index],
              itemCount: _cell.length,
          ),)),

          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new ActionBtn(text: '添加动作',callback: (){
              print('执行添加动作操作');

              if (widget.isEditScene){      //修改场景
                if (widget.sceneInfoModel.cmd.cmd.length > 0){
                  DeviceAddAction actionScene = new DeviceAddAction(deviceId: widget.sceneInfoModel.cmd.cmd.first.deviceId,callback: (ActionSceneCellModel model, SubDeviceInfoModel subDeviceInfoModel){
                    bool isSame = false;
                    for (SceneCell tmp in _cell){
                      if (tmp.cellModel.deviceName == model.deviceName){
                        isSame = true;
                        tmp.reloadCell(model);
                        break;
                      }
                    }
                    if (!isSame){
                      _cell.add(new SceneCell(model: model));
                    }
                  },);
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context){
                        return new NavigationBar(actionScene, '添加动作');
                      }
                  ));
                }else{
                  DeviceCenterControl centerScene = new DeviceCenterControl(callback: (ActionSceneCellModel model, SubDeviceInfoModel subDeviceInfoModel){
                    bool isSame = false;
                    for (SceneCell tmp in _cell){
                      if (tmp.cellModel.deviceName == model.deviceName){
                        isSame = true;
                        tmp.reloadCell(model);
                        break;
                      }
                    }
                    if (!isSame){
                      _cell.add(new SceneCell(model: model));

                      SIOTCMD cmd = new SIOTCMD()
                        ..deviceId    = model.deviceId
                        ..subDeviceId = model.subDeviceInfoModel.subDeviceId
                        ..cmdType     = 1
                        ..cmdid       = TypeJudgment.judgmentDeviceCmdType(model.subDeviceInfoModel.subDeviceId.substring(4,8))
                        ..argInt32.add(model.status == 1?0:1)
                      ;

                      widget.sceneInfoModel.cmd.cmd.add(cmd);
                    }
                  },);
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context){
                        return new NavigationBar(centerScene, '选择中控器');
                      }
                  ));
                }
              }else{                        //添加场景
                if (widget.cmd.length > 0){
                  DeviceAddAction actionScene = new DeviceAddAction(deviceId: widget.cmd.first.deviceId,callback: (ActionSceneCellModel model, SubDeviceInfoModel subDeviceInfoModel){
                    bool isSame = false;
                    for (SceneCell tmp in _cell){
                      if (tmp.cellModel.deviceName == model.deviceName){
                        isSame = true;
                        tmp.reloadCell(model);
                        break;
                      }
                    }
                    if (!isSame){
                      _cell.add(new SceneCell(model: model));
                    }
                  },);
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context){
                        return new NavigationBar(actionScene, '添加动作');
                      }
                  ));
                }else{
                  DeviceCenterControl centerScene = new DeviceCenterControl(callback: (ActionSceneCellModel model, SubDeviceInfoModel subDeviceInfoModel){
                    bool isSame = false;
                    for (SceneCell tmp in _cell){
                      if (tmp.cellModel.deviceName == model.deviceName){
                        isSame = true;
                        tmp.reloadCell(model);
                        break;
                      }
                    }
                    if (!isSame){
                      _cell.add(new SceneCell(model: model));

                      SIOTCMD cmd = new SIOTCMD()
                        ..deviceId    = model.deviceId
                        ..subDeviceId = model.subDeviceInfoModel.subDeviceId
                        ..cmdType     = 1
                        ..cmdid       = TypeJudgment.judgmentDeviceCmdType(model.subDeviceInfoModel.subDeviceId.substring(4,8))
                        ..argInt32.add(model.status == 1?0:1)
                      ;

                      widget.cmd.add(cmd);
                    }
                  },);
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context){
                        return new NavigationBar(centerScene, '选择中控器');
                      }
                  ));
                }
              }
            },),
          )
        ],
      ),
    );
  }
}