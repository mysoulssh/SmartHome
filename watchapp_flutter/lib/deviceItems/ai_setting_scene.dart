import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'ai_deviceinfo_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
//import 'package:watchapp_flutter/Tools/http_manage.dart';
//import 'package:http/src/response.dart';
//import 'dart:convert';


enum DeviceType{
  lightType,        //灯
  switchType,       //开关
  windowType,       //窗帘
}

class AiSettingScene extends StatefulWidget{

  AiSettingScene(this.type,this.deviceName);

  final DeviceType type;
  String deviceName;

  @override
  _AiSettingSceneState createState() => new _AiSettingSceneState();
}

class _AiSettingSceneState extends State<AiSettingScene>{

  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new GestureDetector(
            onTap: (){

//              HttpManage.get((Response respone){
//                var body = respone.body;
//                var editBody = body.substring(5,body.length-1);
//                Map data = JSON.decode(editBody);
//                var dataList = data['result'];
//                print('$dataList');
//              },(Error error){
//
//              });

              print('详情');
              AiDeviceInfoScene infoScene = new AiDeviceInfoScene();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new NavigationBar(infoScene, '设备信息'))
              );
            },
            child: new Container(
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(8.0),
                    child: new SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: new Image(image: new AssetImage('images/testIcon.jpg')),
                    ),
                  ),
                  new Expanded(child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: new Text('设备信息',style: new TextStyle(
                            fontSize: 16.0
                        ),),
                      ),
                      new Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: new SizedBox(
                            width: 12.0,
                            height: 18.5,
                            child: new Image(image: new AssetImage('images/btn_next2_n.png'),
                            )
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          new GestureDetector(
            onTap: (){
              print('修改名称');
              showDialog(context: context, child: new AlertDialog(
                title: new Text('修改设备名称'),
                content: new TextField(
                  controller: controller,
                  decoration: new InputDecoration.collapsed(hintText: '请输入修改后的名称'),
                ),
                actions: <Widget>[
                  new FlatButton(onPressed: (){
                    setState((){
                      widget.deviceName = controller.text;
                    });
                    Navigator.of(context).pop();
                  }, child: new Text('确定')),
                  new FlatButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: new Text('取消'))
                ],
              ));
            },
            child: new Container(
              padding: const EdgeInsets.only(top: 1.0),
              child: new Container(
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    new Expanded(child: new Container(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text('设备名称',style: new TextStyle(fontSize: 16.0),),
                    )),
                    new Container(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: new Text(widget.deviceName,style: new TextStyle(fontSize: 14.0),),
                    ),
                    new Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: new SizedBox(
                          width: 12.0,
                          height: 18.5,
                          child: new Image(image: new AssetImage('images/btn_next2_n.png'),
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 1.0),
            child: new Container(
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Expanded(child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text('固件版本',style: new TextStyle(fontSize: 16.0),),
                  )),
                  new Container(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text('Ver 1.0.0',style: new TextStyle(fontSize: 14.0),),
                  )
                ],
              ),
            ),
          ),
          new Expanded(child: new Center(
            child: new ActionBtn(text: '删除设备',callback: (){
              print('删除设备');
              Navigator.of(context).pop();
            },),
          ))
        ],
      ),
    );
  }
}