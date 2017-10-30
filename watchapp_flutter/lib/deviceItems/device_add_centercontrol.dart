import 'package:flutter/material.dart';
import 'cells/scene_action_cell.dart';
import 'cells/action_scene_cell_model.dart';
import 'device_add_action.dart';
import 'package:watchapp_flutter/main_navbar.dart';

typedef void DeviceSelectCallback(ActionSceneCellModel model);

class DeviceCenterControl extends StatefulWidget{

  DeviceCenterControl({this.callback,this.isRule});

  final bool isRule;
  final DeviceSelectCallback callback;

  @override
  _DeviceCenterControlState createState() => new _DeviceCenterControlState();
}

class _DeviceCenterControlState extends State<DeviceCenterControl>{

  List<ActionSceneCell> _cell = <ActionSceneCell>[];

  List<ActionSceneCellModel> modelList = <ActionSceneCellModel>[
    new ActionSceneCellModel(image: new Image(image: new AssetImage('images/testIcon.jpg')),deviceName: '中控器1', location: '客厅',status: 1),
    new ActionSceneCellModel(image: new Image(image: new AssetImage('images/testIcon.jpg')),deviceName: '中控器2', location: '卧室',status: 2),
  ];

  @override
  void initState(){
    super.initState();
    for (ActionSceneCellModel model in modelList){
      _cell.add(new ActionSceneCell(tmpModel: model,callback: (ActionSceneCellModel cellModel){
        DeviceAddAction actionScene = new DeviceAddAction(isRule: widget.isRule,callback: (ActionSceneCellModel model){
          widget.callback(model);
        },);
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context){
              return new NavigationBar(actionScene, '添加动作');
            }
        ));
      },));
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