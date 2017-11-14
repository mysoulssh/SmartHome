import 'package:flutter/material.dart';
import 'dart:async';
class MeReceiveMessageScene extends StatefulWidget{
  @override
  _MeReceiveMessageSceneState createState() => new _MeReceiveMessageSceneState();
}

class _MeReceiveMessageSceneState extends State<MeReceiveMessageScene> with TickerProviderStateMixin{

  Timer timer;

  @override
  void initState(){
    super.initState();

    timer = new Timer(new Duration(seconds: 1), (){
      showDialog(context: context, child: new AlertDialog(
        title: new Text('提示',textAlign: TextAlign.center,),
        content: new Text('暂无更多消息',textAlign: TextAlign.center,),
        actions: <Widget>[
          new FlatButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: new Text('确定')),
        ],
      ));
    });
  }

  @override
  void dispose(){
    super.dispose();
    if(timer != null){
      timer.cancel();
      timer = null;
    }
  }

  @override
  Widget build(BuildContext context){
    return new Container(

    );
  }
}