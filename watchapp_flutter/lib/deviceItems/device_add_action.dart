import 'package:flutter/material.dart';
import 'cells/scene_action_cell.dart';
import 'cells/action_scene_cell_model.dart';
import 'device_info_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/deviceItems/models/subdevice_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';

typedef SaveActionCallback(ActionSceneCellModel model, SubDeviceInfoModel subDeviceInfoModel);

class DeviceAddAction extends StatefulWidget{

  DeviceAddAction({this.callback,this.isRule,this.deviceId});

  final bool isRule;

  final SaveActionCallback callback;

  final String deviceId;

  @override
  _DeviceAddActionState createState() => new _DeviceAddActionState();
}

class _DeviceAddActionState extends State<DeviceAddAction>{

  List<ActionSceneCell> _cell = <ActionSceneCell>[];

  @override
  void initState(){
    super.initState();

    loadHubList();
  }

  void loadHubList(){
    httpManage.deviceHubDeviceList(UserAccessModel.accessModel.accessToken, widget.deviceId, (Map map){
      List<SubDeviceInfoModel> models = map['models'];
      print('$models');

      int j = 0;
      for (var v in models){
        String type = v.subDeviceId.substring(3,4);
        if (type == 'C'){
          _cell.add(new ActionSceneCell(tmpModel: new ActionSceneCellModel(
            image: new Image(image: new AssetImage(TypeJudgment.judgmentDeviceImage(type))),
            deviceName: TypeJudgment.judgmentType(v.subDeviceId.substring(4,8)),
            location: '控制器',
            deviceId: widget.deviceId,
            status: j,
            subDeviceInfoModel: v
          ),callback: (ActionSceneCellModel cellModel){
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
                          widget.callback(cellModel,v);
                          Navigator.of(contenxt).pop();
                        })
                      ],
                    );
                  }));
            }else{
              print('添加规则cell被点击');
              if (widget.callback != null)
                widget.callback(cellModel,v);
              Navigator.of(context).pop();
            }
          },));
          j++;
        }
      }
      setState((){});

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