import 'package:flutter/material.dart';

class AiSwitchScene extends StatefulWidget{

  AiSwitchScene({this.isSwitchOn});

  bool isSwitchOn;

  @override
  _AiSwitchSceneState createState() => new _AiSwitchSceneState();
}

class _AiSwitchSceneState extends State<AiSwitchScene>{
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Expanded(child: new Container(
            child: new Center(
              child: new Image(image: const AssetImage('images/img_switch.png')),
            ),
          )),
          new Expanded(child: new Container(
            child: new Center(
              child: new FlatButton(onPressed: (){
                setState((){
                  widget.isSwitchOn = !widget.isSwitchOn;
                });
              }, child: new Image(image: new AssetImage(widget.isSwitchOn?'images/btn_switch_s.png':'images/btn_switch_n.png'))),
            ),
          )),
        ],
      ),
    );
  }
}