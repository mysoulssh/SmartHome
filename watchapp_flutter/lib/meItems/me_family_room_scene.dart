import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'me_family_room_info_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';


typedef FamilyRoomSceneCallback();

class MeFamilyRoomScene extends StatefulWidget{
  @override
  _MeFamilyRoomSceneState createState() => new _MeFamilyRoomSceneState();
}

class _MeFamilyRoomSceneState extends State<MeFamilyRoomScene>{

  List<Widget> cells = <Widget>[];

  List<String> rooms = <String>['客厅','卧室','厨房'];
  List<String> devices = <String>['2','3','0'];

  @override
  void initState(){
    super.initState();

    for(int i=0;i<3;i++){
      cells.add(createCells(rooms[i], devices[i],(){
        MeFamilyRoomInfoScene roomInfoScene = new MeFamilyRoomInfoScene(roomName: rooms[i],);
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new NavigationBar(roomInfoScene, rooms[i],
              actions: <Widget>[
                new RightBtnItem('保存', (){
                  Navigator.of(context).pop();
                })
              ],
            )
        ));
      }));
    }

    cells.add(new Row(
      children: <Widget>[
        new Expanded(child: new Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.white,
          child: new Text('房间删除后，设备连接关系将自动移至默认房间',textAlign: TextAlign.center,),
        ))
      ],
    ),);

    cells.add(new Padding(padding: const EdgeInsets.only(top: 80.0),child: new ActionBtn(text: '添加房间',callback: (){
      MeFamilyRoomInfoScene roomInfoScene = new MeFamilyRoomInfoScene();
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new NavigationBar(roomInfoScene, '添加房间',
            actions: <Widget>[
              new RightBtnItem('保存', (){
                Navigator.of(context).pop();
              })
            ],
          )
      ));
    },),));
  }

  Widget createCells(String roomName,String contactDevice,FamilyRoomSceneCallback callback){
    return new GestureDetector(
      onTap: (){
        callback();
      },
      child: new Container(
        padding: const EdgeInsets.only(bottom: 1.0),
        child: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: new Text(roomName,style: new TextStyle(fontSize: 16.0),),
              ),
              new Expanded(child: new Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.all(10.0),
                child: new Text('已连接'+contactDevice+'个设备',style: new TextStyle(fontSize: 15.0,color: Colors.grey),),
              )),
              new Container(
                padding: const EdgeInsets.only(right: 8.0),
                width: 26.0,
                height: 18.0,
                child: new Image(image: new AssetImage('images/btn_next2_n.png')),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new ListView.builder(itemBuilder: (_,int index) => cells[index],itemCount: cells.length,),
    );
  }
}