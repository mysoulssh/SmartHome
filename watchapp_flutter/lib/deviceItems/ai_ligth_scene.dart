import 'package:flutter/material.dart';

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
                    new Padding(
                      padding: const EdgeInsets.all(47.0),
                      child: new SizedBox(
                        width: 180.0,
                        height: 188.0,
                        child: new Image(image: const AssetImage('images/img_light2.png')),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new SizedBox(
                        width: 200.0,
                        height: 210.0,
                        child: new Image(image: const AssetImage('images/img_light_round.png')),
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