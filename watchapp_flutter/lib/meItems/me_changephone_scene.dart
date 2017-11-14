import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/Tools/send_code_btn.dart';

class MeChangePhoneScene extends StatefulWidget{


  @override
  _MeChangePhoneSceneState createState() => new _MeChangePhoneSceneState();
}

class _MeChangePhoneSceneState extends State<MeChangePhoneScene> with TickerProviderStateMixin{

  final TextEditingController oldController      = new TextEditingController();
  final TextEditingController newController      = new TextEditingController();
  final TextEditingController newPhoneController = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new SizedBox(
                    width: 25.0,
                    height: 25.0,
                    child: new Image(image: new AssetImage('images/icon_phone.png')),
                  ),
                ),
                new Expanded(child: new Container(
                  child: new Text('12345678901',style: new TextStyle(fontSize: 16.0),),
                )),
                new Expanded(child: new Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: new TextField(
                    controller: oldController,
                    textAlign: TextAlign.end,
                    style: new TextStyle(fontSize: 16.0,color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration.collapsed(hintText: '请输入验证码',),
                  ),
                ))
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 1.0),
            color: new Color.fromRGBO(214, 214, 214, 1.0),
            child: new Container(
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: new Image(image: new AssetImage('images/icon_phone.png')),
                    ),
                  ),
                  new Expanded(child: new Container(
                    child: new TextField(
                      controller: newPhoneController,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(fontSize: 16.0,color: Colors.black),
                      decoration: new InputDecoration.collapsed(hintText: '请输入新手机号'),
                    ),
                  )),
                  new Expanded(child: new Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new TextField(
                      controller: newController,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(fontSize: 16.0,color: Colors.black),
                      decoration: new InputDecoration.collapsed(hintText: '请输入验证码'),
                    ),
                  ))
                ],
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(right: 8.0),
            alignment: Alignment.centerRight,
            child: new SendCodeBtn(text: '发送验证码',callback: (){

            },),
          ),
          new Expanded(child: new ActionBtn(text: '完成',callback: (){
              print('完成');
            },
          ))
        ],
      ),
    );
  }
}