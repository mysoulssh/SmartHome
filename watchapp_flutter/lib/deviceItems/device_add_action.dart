import 'package:flutter/material.dart';
import 'cells/scene_action_cell.dart';
import 'cells/action_scene_cell_model.dart';
import 'device_info_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';

typedef SaveActionCallback(ActionSceneCellModel model);

class DeviceAddAction extends StatefulWidget{

  DeviceAddAction({this.callback,this.isRule});

  final bool isRule;

  final SaveActionCallback callback;

  @override
  _DeviceAddActionState createState() => new _DeviceAddActionState();
}

class _DeviceAddActionState extends State<DeviceAddAction>{

  List<ActionSceneCell> _cell = <ActionSceneCell>[];

  List<ActionSceneCellModel> modelList = <ActionSceneCellModel>[
    new ActionSceneCellModel(image: new Image(image: new AssetImage('images/testIcon.jpg')),deviceName: '小米冰箱', location: '客厅',status: 1),
    new ActionSceneCellModel(image: new Image(image: new AssetImage('images/testIcon.jpg')),deviceName: '小米55寸智能电视', location: '卧室',status: 0),
  ];

  @override
  void initState(){
    super.initState();

    for (ActionSceneCellModel model in modelList){
      _cell.add(new ActionSceneCell(tmpModel: model,callback: (ActionSceneCellModel cellModel){
        if(widget.isRule == null || widget.isRule == false) {
          int _tmpIndex;
          _tmpIndex = cellModel.status;
          DeviceInfoScene _infoScene = new DeviceInfoScene(
            cellModel, callback: (int index) {
            _tmpIndex = index;
          },);

          Navigator.of(context).push(
              new MaterialPageRoute(builder: (BuildContext contenxt) {
                return new NavigationBar(_infoScene, cellModel.deviceName,
                  actions: <Widget>[
                    new RightBtnItem('保存', (){
                      print('保存');
                      cellModel.status = _tmpIndex;
                      widget.callback(cellModel);
                      Navigator.of(contenxt).pop();
                    })
                  ],
                );
              }));
        }else{
          print('添加规则cell被点击');
          if (widget.callback != null)
            widget.callback(cellModel);
          Navigator.of(context).pop();
        }
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