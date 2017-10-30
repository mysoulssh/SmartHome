import 'package:flutter/material.dart';
import 'package:watchapp_flutter/deviceItems/ai_ligth_scene.dart';
import 'package:watchapp_flutter/deviceItems/ai_window_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';

class DeviceSceneCell extends StatefulWidget{

  DeviceSceneCell({this.image,this.deviceName,this.isDeviceOnline,this.isTurnOn});
  //设备图片
  final Image image;
  //设备名称
  final String deviceName;
  //设备是否在线
  final bool isDeviceOnline;
  //设备是否开启
  bool isTurnOn;

  @override
  _DeviceSceneCellState createState() => new _DeviceSceneCellState();
}

class _DeviceSceneCellState extends State<DeviceSceneCell>{

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: (){
        String _name = widget.deviceName;
        print('$_name');
        if(_name == '节能灯'){
          AiLightScene lightSecen = new AiLightScene(isSwitchOn: false,);
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(lightSecen, _name,
                actions: <Widget>[
                  new RightBtnItem('设置', (){

                  })
                ]
              ))
          );
        }else if(_name == '窗帘'){
          AiWindowScene windowScene = new AiWindowScene();
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(windowScene, _name,
                  actions: <Widget>[
                    new RightBtnItem('设置', (){

                    })
                  ]
              ))
          );
        }
      },
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(8.0),
              child: new SizedBox(
                width: 64.0,
                height: 64.0,
                child: widget.image,
              ),
            ),
            new Expanded(child: new Container(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 1.0),
              color: Colors.grey,
              child: new Container(
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    new Expanded(child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(widget.deviceName),
                        new Text(widget.isDeviceOnline?'设备在线':'设备离线',style: new TextStyle(color: widget.isDeviceOnline?Colors.grey:Colors.red),),
                      ],
                    )),
                    new Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new GestureDetector(
                        onTap: (){
                          widget.isTurnOn = !widget.isTurnOn;
                          setState((){});
                        },
                        child: new Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            new SizedBox(
                                width: 80.0,
                                height: 30.0,
                                child: new Image(image: new AssetImage(widget.isTurnOn?'images/btn_switch_bg2.png':'images/btn_switch_bg1.png'))
                            ),
                            new Container(
                              padding: widget.isTurnOn?const EdgeInsets.only(left: 50.0):const EdgeInsets.only(right: 50.0),
                              child: new SizedBox(
                                width: 37.0,
                                height: 40.0,
                                child: new Image(image: new AssetImage('images/btn_switch.png')),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}