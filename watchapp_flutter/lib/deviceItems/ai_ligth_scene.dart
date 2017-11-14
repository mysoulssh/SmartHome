import 'package:flutter/material.dart';
import 'dart:math' as math;

class AiLightScene extends StatefulWidget{

  AiLightScene({this.isSwitchOn});

  bool isSwitchOn;

  @override
  _AiLightSceneState createState() => new _AiLightSceneState();
}

class _AiLightSceneState extends State<AiLightScene>{

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
                  break;
                case 1:
                  lightColor = new Color.fromRGBO(84, 175, 237, 1.0);
                  break;
                case 2:
                  lightColor = new Color.fromRGBO(89, 220, 125, 1.0);
                  break;
                case 3:
                  lightColor = new Color.fromRGBO(223, 108, 229, 1.0);
                  break;
                case 4:

                  break;
              }
              setState((){});
            },
            child: new Image(image: new AssetImage(imageName))
        ),
      ),
    ));
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