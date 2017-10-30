import 'package:flutter/material.dart';
import 'device_add_action.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'cells/scene_cell.dart';
import 'cells/action_scene_cell_model.dart';
import 'device_add_centercontrol.dart';

class DeviceAddScene extends StatefulWidget{
  DeviceAddScene(this.isEditScene,{this.sceneTitle});

  bool isEditScene;
  String sceneTitle;

  @override
  _DeviceAddSceneState createState() => new _DeviceAddSceneState();
}

class _DeviceAddSceneState extends State<DeviceAddScene>{
  final TextEditingController editController = new TextEditingController();


  List<SceneCell> _cell = <SceneCell>[];

  @override
  void initState(){
    super.initState();
    editController.text = widget.sceneTitle;
    if (widget.isEditScene) {
      _cell.add(new SceneCell(
        model: new ActionSceneCellModel(
          image: new Image(image: new AssetImage('images/testIcon.jpg')),
          deviceName: '小米冰箱',
          location: '客厅',
          status: 0,
        ),
      ));
      _cell.add(new SceneCell(
        model: new ActionSceneCellModel(
          image: new Image(image: new AssetImage('images/testIcon.jpg')),
          deviceName: '小米55寸智能电视',
          location: '卧室',
          status: 2,
        ),
      ));
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
                DeviceAddAction actionScene = new DeviceAddAction(callback: (ActionSceneCellModel model){
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
              }else{                        //添加场景
                DeviceCenterControl centerScene = new DeviceCenterControl(callback: (ActionSceneCellModel model){
                  widget.isEditScene = true;
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
                      return new NavigationBar(centerScene, '选择中控器');
                    }
                ));
              }
            },),
          )
        ],
      ),
    );
  }
}