import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'ai_deviceinfo_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceVerGet/DeviceVerGet.pb.dart';


enum DeviceType{
  lightType,        //灯
  switchType,       //开关
  windowType,       //窗帘
}

class AiSettingScene extends StatefulWidget{

  AiSettingScene(
      this.type,
      this.deviceName,
      this.deviceType,
      this.deviceId,
      this.subDeviceId,
      );

  final DeviceType type;
  String deviceName;
  String deviceType;
  String deviceId;
  String subDeviceId;

  @override
  _AiSettingSceneState createState() => new _AiSettingSceneState();
}

class _AiSettingSceneState extends State<AiSettingScene>{

  final TextEditingController controller = new TextEditingController();

  @override
  void initState(){
    super.initState();

    getDeviceVer();
  }

  void getDeviceVer(){
    QueryInfo queryInfo = new QueryInfo()
    ..deviceId    = widget.deviceId
    ..subDeviceId = widget.subDeviceId;

    httpManage.deviceVerGet(UserAccessModel.accessModel.accessToken, [queryInfo], (Map map){

      var v = map['models'];
      print('$v');

      setState((){});
    }, (String errorMsg){

    });
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new GestureDetector(
            onTap: (){
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
                      child: new Image(image: new AssetImage(TypeJudgment.judgmentDeviceImage(widget.deviceType))),
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

              httpManage.deviceDel(UserAccessModel.accessModel.accessToken, widget.deviceId, widget.subDeviceId, (Map map){
                Navigator.of(context).pop();
              }, (String errorMsg){

              });

            },),
          ))
        ],
      ),
    );
  }
}