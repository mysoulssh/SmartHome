import 'package:flutter/material.dart';

class MeFamilyRoomInfoScene extends StatefulWidget{

  MeFamilyRoomInfoScene({this.roomName});

  String roomName;

  @override
  _MeFamilyRoomInfoScene createState() => new _MeFamilyRoomInfoScene();
}

class _MeFamilyRoomInfoScene extends State<MeFamilyRoomInfoScene>{
  
  final TextEditingController roomController = new TextEditingController();

  List<Widget> cells = <Widget>[];

  @override
  void initState(){
    super.initState();

    if(widget.roomName != null)
      roomController.text = widget.roomName;
    
    for(int i=0;i<3;i++){
      cells.add(createCells());
    }
  }

  Widget createCells(){
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
                    child: new Text('冰箱',style: new TextStyle(fontSize: 15.0),),
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
                  child: new Text('已连接3个设备',style: new TextStyle(color: Colors.grey),),
                ))
              ],
            ),
          ),
          new Expanded(child: new ListView.builder(itemBuilder: (_,int index) => cells[index],itemCount: cells.length,))
        ],
      ),
    );
  }
}