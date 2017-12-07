import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/deviceItems/models/house_device_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';
import 'package:watchapp_flutter/deviceItems/device_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';

class MeFamilyRoomInfoScene extends StatefulWidget{

  MeFamilyRoomInfoScene({this.roomName,this.houseGuid,this.areaGuid});

  String roomName;
  String houseGuid;
  String areaGuid;

  @override
  _MeFamilyRoomInfoScene createState() => new _MeFamilyRoomInfoScene();
}

class _MeFamilyRoomInfoScene extends State<MeFamilyRoomInfoScene>{
  
  final TextEditingController roomController = new TextEditingController();

  List<Widget> cells = <Widget>[];

  String addNum = '0';

  @override
  void initState(){
    super.initState();

    if(widget.roomName != null)
      roomController.text = widget.roomName;

    loadList();
  }

  void loadList(){
    cells.removeRange(0, cells.length);
    httpManage.houseDeviceList(UserAccessModel.accessModel.accessToken, widget.houseGuid, 1, 20, (Map map){
      List<HouseDeviceInfoModel> houseDeviceInfoModels = map['models'];
      for (var v in houseDeviceInfoModels){
        cells.add(createCells(TypeJudgment.judgmentType(v.prodtType.first)));
      }
      addNum = houseDeviceInfoModels.length.toString();
      setState((){});
    }, (String errorMsg){

    },areaGuid: widget.areaGuid);
  }


  Widget createCells(String deviceName){
    return new Container(
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(8.0),
            child: new SizedBox(
              width: 64.0,
              height: 64.0,
              child: new Image(image: new AssetImage('images/testIcon.jpg')),
            ),
          ),
          new Expanded(child: new Container(
            color: new Color.fromRGBO(214, 214, 214, 1.0),
            padding: const EdgeInsets.only(bottom: 1.0),
            child: new Container(
              color: Colors.white,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.fromLTRB(0.0,2.0,0.0,6.0),
                    child: new Text(deviceName, style: new TextStyle(fontSize: 15.0),),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(bottom: 7.0),
                    child: new Text('已添加',style: new TextStyle(color: Colors.grey),),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  void areaAddDevice(String deviceId, String subId){
    httpManage.houseAreaDeviceSet(
        UserAccessModel.accessModel.accessToken,
        widget.houseGuid,
        widget.areaGuid,
        deviceId,
        subId,
            (Map map){
          loadList();
        }, (String errorMsg){
      ShowInfo.showInfo(context, content: errorMsg);
    });
  }


  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            color: new Color.fromRGBO(214, 214, 214, 1.0),
            padding: const EdgeInsets.only(bottom: 1.0),
            child: new Container(
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text('房间名称',style: new TextStyle(fontSize: 16.0)),
                  ),
                  new Expanded(child: new Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new TextField(
                      controller: roomController,
                      textAlign: TextAlign.right,
                      decoration: new InputDecoration.collapsed(hintText: '请输入房间名'),
                    ),
                  ))
                ],
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(bottom: 1.0),
            color: new Color.fromRGBO(214, 214, 214, 1.0),
            child: new Row(
              children: <Widget>[
                new Expanded(child: new Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: new Text('已连接$addNum个设备',style: new TextStyle(color: Colors.grey),),
                ))
              ],
            ),
          ),
          new Expanded(child: new ListView.builder(itemBuilder: (_,int index) => cells[index],itemCount: cells.length,)),
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new ActionBtn(text: '添加设备',callback: (){
              DeviceScene deviceScene = new DeviceScene('添加设备',EnterType.typeDevice,callback: (String id, String subId){
                areaAddDevice(id, subId);
              },);
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                return new NavigationBar(deviceScene, '添加设备');
              }));
            },),
          )
        ],
      ),
    );
  }
}