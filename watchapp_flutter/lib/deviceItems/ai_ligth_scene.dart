import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';

typedef ChangeColorsCallback(int r, int g, int b);

class AiLightScene extends StatefulWidget{

  AiLightScene({
    this.isSwitchOn,
    this.deviceId,
    this.subDeviceId,
    this.changeColorsCallback
  });

  bool isSwitchOn;
  ChangeColorsCallback changeColorsCallback;

  String deviceId;
  String subDeviceId;

  @override
  _AiLightSceneState createState() => new _AiLightSceneState();
}

class _AiLightSceneState extends State<AiLightScene>{

  int r = 0;
  int g = 0;
  int b = 0;

  List<String> imagesList = <String>[
    'images/btn_yellow.png',
    'images/btm_green.png',
    'images/btn_morecolor.png',
    'images/btn_purple.png',
    'images/btn_blue.png',
  ];

  List<Widget> colorsRowList = <Widget>[];

  Color lightColor = Colors.white;
  double angle = 0.0;
  Color touchColor = Colors.black;

  @override
  void initState(){
    super.initState();
    if (widget.isSwitchOn == null){
      widget.isSwitchOn = false;
    }
    createColorsRow();
  }

  List<Widget> createColorsRow(){
    int i = 0;
    for (String tmp in imagesList){
      colorsRowList.add(createColorBtn(i, tmp));
      i++;
    }
    return colorsRowList;
  }

  Widget createColorBtn(int index, String imageName){
    return new Expanded(child: new Container(
      child: new SizedBox(
        width: 40.0,
        height: 40.0,
        child: new FlatButton(
            onPressed: (){
              print('$index and $imageName');



              switch (index){
                case 0:
                  lightColor = new Color.fromRGBO(243, 223, 174, 1.0);
                  r = 243;
                  g = 223;
                  b = 174;
                  if (widget.changeColorsCallback != null){
                    widget.changeColorsCallback(243,223,174);
                  }
                  break;
                case 1:
                  lightColor = new Color.fromRGBO(84, 175, 237, 1.0);
                  r = 84;
                  g = 175;
                  b = 237;
                  if (widget.changeColorsCallback != null){
                    widget.changeColorsCallback(84,175,237);
                  }
                  break;
                case 2:
                  lightColor = new Color.fromRGBO(89, 220, 125, 1.0);
                  r = 89;
                  g = 220;
                  b = 125;
                  if (widget.changeColorsCallback != null){
                    widget.changeColorsCallback(89,220,125);
                  }
                  break;
                case 3:
                  lightColor = new Color.fromRGBO(223, 108, 229, 1.0);
                  r = 223;
                  g = 108;
                  b = 229;
                  if (widget.changeColorsCallback != null){
                    widget.changeColorsCallback(233,108,229);
                  }
                  break;
                case 4:

                  break;
              }

              if (widget.changeColorsCallback == null){
                runIOTcmd(r, g, b);
              }

              setState((){});
            },
            child: new Image(image: new AssetImage(imageName))
        ),
      ),
    ));
  }

  void runIOTcmd(int r, int g, int b){
    IOTCMD iotcmd = new IOTCMD();

    SIOTCMD cmd1 = new SIOTCMD()                //控制灯光开关
    ..subDeviceId   = widget.subDeviceId
    ..deviceId      = widget.deviceId
    ..cmdid         = 201
      ..argInt32.add(widget.isSwitchOn?1:0);

    SIOTCMD cmd2 = new SIOTCMD()                //控制灯光颜色
    ..subDeviceId   = widget.subDeviceId
    ..deviceId      = widget.deviceId
    ..cmdid         = 202
      ..argInt32.add(r)
      ..argInt32.add(g)
      ..argInt32.add(b);

    iotcmd.cmd.add(cmd1);
    iotcmd.cmd.add(cmd2);

    httpManage.deviceRunTOTCmd(UserAccessModel.accessModel.accessToken, iotcmd, (Map map){

    }, (String errorMsg){
      print('灯光错误信息：$errorMsg');
    });
  }


  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(child: new Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 48.0, 0.0, 50.0),
                      child: new Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          new SizedBox(
                            width: 171.0,
                            height: 171.0,
                            child: new Transform.rotate(
                              angle: angle,
                              child: new Image(image: const AssetImage('images/img_light2.png')),
                            )
                          ),
                          new Container(
                            width: 154.0,
                            height: 154.0,
                            decoration: new BoxDecoration(
                              color: lightColor,
                              borderRadius: new BorderRadius.all(new Radius.circular(77.0))
                            ),
                          )
                        ],
                      ),
                    ),
                    new GestureDetector(
                      onTapDown: (TapDownDetails details){
                        var positionX = details.globalPosition.dx;
                        var positionY = details.globalPosition.dy;

                        var editX = 180.0-positionX;
                        var editY = 205.0-positionY;

                        setState((){
                          if(positionY < 205.0){
                            angle = -math.atan(editX/editY);
                          }else{
                            var tmpAngle = -math.atan(editX/editY) + math.PI;
                            if(tmpAngle > -math.PI*2/3 && tmpAngle < math.PI*2/3 || tmpAngle>4.21){
                              angle = tmpAngle;
                            }
                          }
                        });
                      },
                      onHorizontalDragUpdate: (DragUpdateDetails details){
                        var positionX = details.globalPosition.dx;
                        var positionY = details.globalPosition.dy;

                        var editX = 180.0-positionX;
                        var editY = 205.0-positionY;

                        setState((){
                          if(positionY < 205.0){
                            angle = -math.atan(editX/editY);
                          }else{
                            var tmpAngle = -math.atan(editX/editY) + math.PI;
                            if(tmpAngle > -math.PI*2/3 && tmpAngle < math.PI*2/3 || tmpAngle>4.21){
                              angle = tmpAngle;
                            }
                          }
                        });
                      },
                      child: new Container(
                        padding: const EdgeInsets.all(10.0),
                        child: new SizedBox(
                          width: 190.0,
                          height: 200.0,
                          child: new Image(image: const AssetImage('images/img_light_round.png')),
                        ),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: new SizedBox(
                        width: 80.0,
                        height: 128.0,
                        child: new Image(image: const AssetImage('images/imglight1.png')),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 185.0),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(child: new Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: new SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: new Image(image: const AssetImage('images/moon.png')),
                            ),
                          )),
                          new Expanded(child: new Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: new SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: new Image(image: const AssetImage('images/sun.png')),
                            ),
                          )),

                        ],
                      ),
                    ),

                  ],
                ))
              ],
            ),
          ),
          new Row(
            children: colorsRowList,
          ),
          new Expanded(child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SizedBox(
                width: 130.0,
                height: 130.0,
                child: new FlatButton(onPressed: (){
                  setState((){
                    runIOTcmd(r, g, b);
                    widget.isSwitchOn = !widget.isSwitchOn;
                  });
                }, child: new Image(image: new AssetImage(widget.isSwitchOn?'images/btn_switch_s.png':'images/btn_switch_n.png'))),
              )
            ],
          ))
        ],
      ),
    );
  }
}