import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'me_add_family_room_scene.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';

typedef AddFamilySceneCallback();

class MeAddFamilyScene extends StatefulWidget{
  @override
  _MeAddFamilySceneState createState() => new _MeAddFamilySceneState();
}

class _MeAddFamilySceneState extends State<MeAddFamilyScene>{

  final TextEditingController roomController = new TextEditingController();

  List<String> roomsName = <String>['卧室','客厅','厨房','书房'];
  List<String> imagesName = <String>['icon_bedroom.png','icon_livingroom.png','icon_kitchen.png','icon_study.png'];

  List<Widget> grids = <Widget>[];

  @override
  void initState(){
    super.initState();

    for(int i=0;i<roomsName.length;i++){
      grids.add(createItems(roomsName[i], imagesName[i],null));
    }

    grids.add(createItems('添加房间', 'img_add.png',(){      //添加房间
      print('添加房间');
      MeAddFamilyRoomScene addFamilyRoomScene = new MeAddFamilyRoomScene();
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new NavigationBar(addFamilyRoomScene, '添加房间',
            actions: <Widget>[
              new RightBtnItem('保存', (){
                Navigator.of(context).pop();
              })
            ],
          )
      ));
    }));
  }

  Widget createItems(String roomName,String imageName, AddFamilySceneCallback callback){
    return new GestureDetector(
      onTap: (){
        if (roomName == '添加房间'){
          callback();
        }
      },
      child: new Container(
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
            border: new Border(
              top: new BorderSide(color: new Color.fromRGBO(214, 214, 214, 1.0)),
              bottom: new BorderSide(color: new Color.fromRGBO(214, 214, 214, 1.0)),
              left: new BorderSide(color: new Color.fromRGBO(214, 214, 214, 1.0)),
              right: new BorderSide(color: new Color.fromRGBO(214, 214, 214, 1.0)),
            )
        ),
        child: roomName=='添加房间'?new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new SizedBox(
                width: 40.0,
                height: 40.0,
                child: new Image(image: new AssetImage('images/'+imageName)),
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text(roomName),
            )
          ],
        ):new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new SizedBox(
                width: 100.0,
                height: 60.0,
                child: new Image(image: new AssetImage('images/'+imageName)),
              ),
            ),
            new Container(
              child: new Text(roomName),
            )
          ],
        ),
      ),
    );
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
                    child: new Text('家庭名称',style: new TextStyle(fontSize: 16.0),),
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
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Expanded(child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text('我的房间',textAlign: TextAlign.center,),
                ))
              ],
            ),
          ),
          new Expanded(child: new GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10.0),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 3,
            children: grids,
          ),flex: 2,),
          new Expanded(child: new Padding(padding: const EdgeInsets.only(top: 20.0),child: new ActionBtn(text: '创建家庭',callback: (){
            Navigator.of(context).pop();
          },),))
        ],
      ),
    );
  }
}