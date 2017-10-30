import 'package:flutter/material.dart';
import 'deviceItems/device_scene.dart';
import 'deviceItems/device_add_scene.dart';
import 'main_navbar.dart';
import 'Tools/scan_qr_code.dart';
import 'Tools/right_btn.dart';

enum SceneType{
  SceneRoom,    //房间
  SceneClass,   //类型
}

class DeviceItem extends StatefulWidget{
  @override
  _DeviceItemState createState() => new _DeviceItemState();
}

class _DeviceItemState extends State<DeviceItem> with SingleTickerProviderStateMixin{
  List<Scene> scene = <Scene>[
    new Scene('images/icon_home2_n.png', 'images/icon_home2_s.png', '回家'),
    new Scene('images/icon_outhome_n.png', 'images/icon_outhome_s.png', '离家'),
    new Scene('images/icon_wakeup_n.png', 'images/icon_wakeup_s.png', '起床'),
    new Scene('images/icon_sleep_n.png', 'images/icon_sleep_s.png', '睡觉'),
  ];

  SceneType sceneType;
  bool roomSwitch = false;
  bool livingRoomSwitch = false;
  bool kitchenSwitch = false;
  bool studyRoom = false;

  bool cameraSwitch = false;
  bool lightSwitch = false;
  bool decSwitch = false;
  bool bellSwitch = false;
  bool tvSwitch = false;
  bool centerControlSwitch = false;

  bool inHomeSelect = true;
  bool outHomeSelect = false;
  bool wakeupSelect = false;
  bool sleepSelect = false;


  @override
  void initState(){
    super.initState();
    sceneType = SceneType.SceneRoom;
  }

  @override
  void dispose(){
    super.dispose();
  }

  void _resetSelectStatu(){
    inHomeSelect = false;
    outHomeSelect = false;
    wakeupSelect = false;
    sleepSelect = false;
  }

  Widget _createSceneBtn(String iconN, String iconS, String text, int tag, bool isSelect){
    return new Expanded(child: new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new GestureDetector(
                  onTap: (){
                    _resetSelectStatu();
                    switch (tag){
                      case 0:
                        inHomeSelect = isSelect = true;
                        break;
                      case 1:
                        outHomeSelect = isSelect = true;
                        break;
                      case 2:
                        wakeupSelect = isSelect = true;
                        break;
                      case 3:
                        sleepSelect = isSelect = true;
                        break;
                    }
                    setState((){

                    });
                  },
                  child: new SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: new Image(image: new AssetImage(isSelect?iconS:iconN)),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new GestureDetector(
                    onTap: (){
                      print('$text');
                      DeviceAddScene editScene = new DeviceAddScene(true,sceneTitle: text,);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context){
                            return new NavigationBar(editScene, '编辑场景',
                              actions: <Widget>[
                                new RightBtnItem('保存', (){
                                  print('保存');
                                  print(editScene.sceneTitle);
                                })
                              ],
                            );
                          })
                      );
                    },
                    child: new Text(text),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _switchRoom(String typeImage,String typeText,bool isSwitchOn,String numText,bool isNewImage){
    return new GestureDetector(
      onTap: (){
        print('$typeText');
        Widget deviceScene = new DeviceScene(typeText);
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
          return new NavigationBar(deviceScene, typeText,
            actions: <Widget>[
              new RightBtnItem('添加', (){
                print('添加');
                setState((){
                  ScanQRCode.showQRCodeReader((String value){
                    showDialog(context: context, child: new AlertDialog(
                      title: new Text('扫描结果', textAlign: TextAlign.center),
                      content: new Text(value, textAlign: TextAlign.center),
                      actions: <Widget>[
                        new FlatButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: new Text('确定'))
                      ],
                    ));
                  });
                });
              })
            ],
          );
          }
        ));
      },
      child: new Container(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                new Container(
                  child: new SizedBox(
                    width: 150.0,
                    height: 70.0,
                    child: isNewImage?new Container(
                      padding: const EdgeInsets.all(15.0),
                      child: new Image(image: new AssetImage(typeImage)),
                    ):new Container(
                      child: new Image(image: new AssetImage(typeImage)),
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: new Text(typeText,style: new TextStyle(
                      color: new Color.fromRGBO(232, 153, 110, 1.0),
                      fontSize: 16.0
                  ),),
                ),
              ],
            ),
            new GestureDetector(
              onTap: (){
                setState((){
                  if (typeText == '卧室'){
                    roomSwitch = isSwitchOn = !isSwitchOn;
                  }else if (typeText == '客厅'){
                    livingRoomSwitch = isSwitchOn = !isSwitchOn;
                  }else if (typeText == '厨房'){
                    kitchenSwitch = isSwitchOn = !isSwitchOn;
                  }else if (typeText == '书房'){
                    studyRoom = isSwitchOn = !isSwitchOn;
                  }else if (typeText == '摄像头'){
                    cameraSwitch = isSwitchOn = !isSwitchOn;
                  }else if (typeText == '灯'){
                    lightSwitch = isSwitchOn = !isSwitchOn;
                  }else if (typeText == '感应器'){
                    decSwitch = isSwitchOn = !isSwitchOn;
                  }else if (typeText == '门铃'){
                    bellSwitch = isSwitchOn = !isSwitchOn;
                  }else if (typeText == '电视'){
                    tvSwitch = isSwitchOn = !isSwitchOn;
                  }else if (typeText == '中控'){
                    centerControlSwitch = isSwitchOn = !isSwitchOn;
                  }
                });
              },
              child: new Stack(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.fromLTRB(4.0,15.0,0.0,0.0),
                    child: new SizedBox(
                      width: 80.0,
                      height: 30.0,
                      child: new Image(image: new AssetImage(isSwitchOn?'images/btn_switch_bg2.png':'images/btn_switch_bg1.png')),
                    ),
                  ),
                  new Container(
                    padding: isSwitchOn?const EdgeInsets.fromLTRB(50.0,10.0,0.0,0.0):const EdgeInsets.only(top: 10.0),
                    child: new SizedBox(
                      width: 37.0,
                      height: 40.0,
                      child: new Image(image: new AssetImage('images/btn_switch.png')),
                    ),
                  ),
                  new Container(
                    padding: isSwitchOn?const EdgeInsets.fromLTRB(15.0, 22.0, 0.0, 0.0):const EdgeInsets.fromLTRB(45.0, 22.0, 0.0, 0.0),
                    child: new Text(
                      numText,
                      style: new TextStyle(
                          fontSize: 15.5,
                          color: isSwitchOn?const Color.fromRGBO(249, 199, 170, 1.0):const Color.fromRGBO(232, 153, 110, 1.0)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSceneRoom(){
    return new Expanded(child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Expanded(child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Expanded(child: new Padding(padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
              child: _switchRoom('images/icon_bedroom.png','卧室',roomSwitch,'6/6',false),
            )),
            new Expanded(child: new Padding(padding: const EdgeInsets.all(1.0),
              child: _switchRoom('images/icon_livingroom.png','客厅',livingRoomSwitch,'2/3',false),
            )),
          ],
        )),
        new Expanded(child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Expanded(child: new Padding(padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,1.0),
              child: _switchRoom('images/icon_kitchen.png', '厨房', kitchenSwitch, '6/6',false),
            )),
            new Expanded(child: new Padding(padding: const EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 1.0),
              child: _switchRoom('images/icon_study.png', '书房', studyRoom, '6/6',false),
            )),
          ],
        ))
      ],
    ),);
  }

  Widget _createSceneClass(){
    return new Expanded(child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Expanded(child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Expanded(child: new Padding(padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
              child: _switchRoom('images/icon_canmera.png','摄像头',cameraSwitch,'6/6',true),
            )),
            new Expanded(child: new Padding(padding: const EdgeInsets.fromLTRB(1.0, 1.0, 0.0, 1.0),
              child: _switchRoom('images/icon_light.png','灯',lightSwitch,'2/3',true),
            )),
            new Expanded(child: new Padding(padding: const EdgeInsets.fromLTRB(1.0, 1.0, 0.0, 1.0),
              child: _switchRoom('images/icon_inductor.png','感应器',decSwitch,'2/3',true),
            )),
          ],
        )),
        new Expanded(child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Expanded(child: new Padding(padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,1.0),
              child: _switchRoom('images/icon_doorbell.png', '门铃', bellSwitch, '6/6',true),
            )),
            new Expanded(child: new Padding(padding: const EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 1.0),
              child: _switchRoom('images/icon_livingroom.png', '电视', tvSwitch, '1/2',false),
            )),
            new Expanded(child: new Padding(padding: const EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 1.0),
              child: _switchRoom('images/icon_centercontrol.png', '中控', centerControlSwitch, '2/3',true),
            )),
          ],
        ))
      ],
    ));
  }

  
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text('我的场景'),
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: new Container(
              color: Colors.white,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _createSceneBtn(scene[0].iconN, scene[0].iconS, scene[0].text, 0, inHomeSelect),
                  _createSceneBtn(scene[1].iconN, scene[1].iconS, scene[1].text, 1, outHomeSelect),
                  _createSceneBtn(scene[2].iconN, scene[2].iconS, scene[2].text, 2, wakeupSelect),
                  _createSceneBtn(scene[3].iconN, scene[3].iconS, scene[3].text, 3, sleepSelect),
                ],
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(child: new GestureDetector(
                  onTap: (){
                    print('房间');
                    setState((){
                      sceneType = SceneType.SceneRoom;
                    });
                  },
                  child: new Container(
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                          child: new Text('房间',textAlign: TextAlign.center,style: new TextStyle(
                              color: sceneType == SceneType.SceneRoom?Colors.red:Colors.grey
                          ),),
                        ),
                        new Container(
                          color: sceneType == SceneType.SceneRoom?const Color.fromRGBO(254, 189, 148, 1.0):Colors.white,
                          child: new SizedBox(
                            width: 45.0,
                            height: 5.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                new Expanded(child: new Padding(padding: const EdgeInsets.only(left: 1.0),
                    child: new GestureDetector(
                      onTap: (){
                        print('类型');
                        setState((){
                          sceneType = SceneType.SceneClass;
                        });
                      },
                      child: new Container(
                        color: Colors.white,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                              child: new Text('类型',textAlign: TextAlign.center,style: new TextStyle(
                                  color: sceneType == SceneType.SceneClass?Colors.red:Colors.grey
                              ),),
                            ),
                            new Container(
                              color: sceneType == SceneType.SceneClass?const Color.fromRGBO(254, 189, 148, 1.0):Colors.white,
                              child: new SizedBox(
                                width: 45.0,
                                height: 5.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                )),
              ],
            ),
          ),
          sceneType == SceneType.SceneRoom?_createSceneRoom():_createSceneClass()
        ],
      )
    );
  }
}

class Scene{
  Scene(this.iconN,this.iconS,this.text);
  
  final String iconN;
  final String iconS;
  final String text;
}