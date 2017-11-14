import 'package:flutter/material.dart';

enum MeMemberState{
  meMemberStateNormal,      //正常情况
  meMemberStateWaiting,     //等待情况
  meMemberStateRefuse,      //拒绝情况
}

typedef void CellSelectedCallback();

class MeMemberCell extends StatefulWidget{

  MeMemberCell({this.likeName,this.relation,this.hasWatch,this.memberState,this.callback});

  final String likeName;
  final String relation;
  final bool hasWatch;
  final MeMemberState memberState;
  final CellSelectedCallback callback;


  @override
  _MeMemberCellState createState() => new _MeMemberCellState();
}

class _MeMemberCellState extends State<MeMemberCell>{
  
  @override
  void initState(){
    super.initState();
    
  }
  
  Widget createStateScene(){
    Widget stateScene;
    switch(widget.memberState){
      case MeMemberState.meMemberStateNormal:{
        stateScene = widget.hasWatch?new Expanded(child: new Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(10.0),
          child: new SizedBox(
            width: 25.0,
            height: 25.0,
            child: new Image(image: new AssetImage('images/icon_watch.png')),
          ),
        )):new Container();
      }
      break;
      case MeMemberState.meMemberStateWaiting:{
        stateScene = new Expanded(child: new Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 8.0),
          child: new Text('等待对方确认')
        ));
      }
      break;
      case MeMemberState.meMemberStateRefuse:{
        stateScene = new Expanded(child: new Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 8.0),
            child: new Text('对方已拒绝',style: new TextStyle(color: Colors.red),)
        ));
      }
      break;
    }
    return stateScene;
  }
  
  @override
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: (){
        if(widget.callback != null){
          widget.callback();
        }
      },
      child: new Container(
        padding: const EdgeInsets.only(top: 1.0),
        child: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(8.0),
                child: new SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: new CircleAvatar(
                    backgroundImage: new AssetImage('images/testIcon.jpg'),
                  ),
                ),
              ),
              new Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: new Text(widget.likeName),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: new Text(widget.relation),
                    )
                  ],
                ),
              ),
              createStateScene()
            ],
          ),
        ),
      ),
    );
  }
}