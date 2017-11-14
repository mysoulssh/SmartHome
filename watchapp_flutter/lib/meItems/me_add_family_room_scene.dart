import 'package:flutter/material.dart';

typedef AddFamilyRoomSceneCallback(String roomName);

class MeAddFamilyRoomScene extends StatefulWidget{
  @override
  _MeAddFamilyRoomSceneState createState() => new _MeAddFamilyRoomSceneState();
}

class _MeAddFamilyRoomSceneState extends State<MeAddFamilyRoomScene>{

  final TextEditingController roomController = new TextEditingController();

  final List<String> roomsName = <String>['玄关','客厅','卧室','餐厅','厨房','卫生间','儿童房','书房'];

  final List<Widget> grids = <Widget>[];

  @override
  void initState(){
    super.initState();
    for(int i=0;i<roomsName.length;i++){
      grids.add(createItems(roomsName[i],(String roomName){
        setState((){
          roomController.text = roomName;
        });
      }));
    }
  }

  Widget createItems(String roomName, AddFamilyRoomSceneCallback callback){
    return new GestureDetector(
      onTap: (){
        callback(roomName);
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
        child: new Center(
          child: new Text(roomName,textAlign: TextAlign.center,),
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
                    child: new Text('房间名称',style: new TextStyle(fontSize: 16.0),),
                  ),
                  new Expanded(child: new Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new TextField(
                      controller: roomController,
                      textAlign: TextAlign.right,
                      decoration: new InputDecoration.collapsed(hintText: '请输入房间名称'),
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
                  child: new Text('推荐名称',textAlign: TextAlign.center,),
                ))
              ],
            ),
          ),
          new Expanded(child: new GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10.0),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 4,
            children: grids,
          ),)
        ],
      ),
    );
  }
}