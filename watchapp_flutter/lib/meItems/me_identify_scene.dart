import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';

class MeIdentifyScene extends StatefulWidget{
  @override
  _MeIdentifySceneState createState() => new _MeIdentifySceneState();
}

class _MeIdentifySceneState extends State<MeIdentifyScene>{

  final TextEditingController nameController    = new TextEditingController();
  final TextEditingController idCardController  = new TextEditingController();

  Widget createIdentifyScene(String text, TextEditingController controller, String imageName, String hintText){
    return new Container(
      color: new Color.fromRGBO(214, 214, 214, 1.0),
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: new SizedBox(
                width: 25.0,
                height: 25.0,
                child: new Image(image: new AssetImage('images/'+imageName)),
              ),
            ),
            new Container(
              child: new Text(text,style: new TextStyle(fontSize: 16.0)),
            ),
            new Expanded(child: new Container(
              padding: const EdgeInsets.only(right: 8.0),
              child: new TextField(
                textAlign: TextAlign.right,
                controller: controller,
                decoration: new InputDecoration.collapsed(hintText: hintText),
              ),
            ))
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
          createIdentifyScene('真实姓名', nameController, 'icon_people.png', '请输入你的真实姓名'),
          createIdentifyScene('身份证号', idCardController, 'icon_id.png', '请输入18位身份证号'),

          new Container(
            padding: const EdgeInsets.only(top: 80.0),
            child: new ActionBtn(text: '提交', callback: (){

            },),
          )
        ],
      ),
    );
  }
}