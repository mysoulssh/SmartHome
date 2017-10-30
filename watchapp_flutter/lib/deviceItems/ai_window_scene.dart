import 'package:flutter/material.dart';

class AiWindowScene extends StatefulWidget{

  AiWindowScene({this.isSwitchOn});

  bool isSwitchOn;

  @override
  _AiWindowSceneState createState() => new _AiWindowSceneState();
}

class _AiWindowSceneState extends State<AiWindowScene>{

  List<Widget> lines = <Widget>[];
  int lightSight = 50;

  var paddingLeft;
  var paddingRight;

  @override
  void initState(){
    super.initState();
    if(widget.isSwitchOn == null){
      widget.isSwitchOn = false;
    }
    for (int i=0;i<21;i++){
      if (i==0){
        lines.add(createLines(i%5==0));
      }else{
        lines.add(new Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: createLines(i%5==0),
        ));
      }
    }

    lines.insert(0, createMoon());
    lines.add(createSun());

    paddingLeft = 0.0;
    paddingRight = 0.0;

  }

  Widget createControl(){
    return new Row(
      children: lines,
    );
  }

  Widget createLines(bool isLonger){
    return isLonger?new SizedBox(
      width: 1.0,
      height: 20.0,
      child: new Container(
        color: const Color.fromRGBO(119, 122, 137, 1.0),
      ),
    ):new Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: new SizedBox(
        width: 1.0,
        height: 13.0,
        child: new Container(
          color: const Color.fromRGBO(119, 122, 137, 1.0),
        ),
      ),
    );
  }

  Widget createMoon(){
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
      child: new SizedBox(
        width: 20.0,
        height: 20.0,
        child: new Image(image: new AssetImage('images/moon.png')),
      ),);
  }

  Widget createSun(){
    return new Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: new SizedBox(
          width: 20.0,
          height: 20.0,
          child: new Image(image: new AssetImage('images/sun.png'))
      ),);
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.fromLTRB(70.0, 60.0, 70.0, 0.0),
            child: new Image(image: const AssetImage('images/img_window.png')),
          ),
          new Expanded(child: new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new GestureDetector(
                  onTapDown: (TapDownDetails details){
                    var offset = details.globalPosition;
                    var dx = offset.dx;
                    var span = 180.0 - dx;

                    if (span >= 0 && span <= 110){
                      setState((){
                        paddingRight = span*2;
                        paddingLeft = 0.0;

                        double result = span/110;
                        lightSight = (50 - (result*100)/2).toInt();
                      });
                    }else if (span < 0 && span >= -111){
                      setState((){
                        paddingLeft = -span*2;
                        paddingRight = 0.0;

                        double result = span/110;
                        lightSight = (50 - (result*100)/2).toInt();
                      });
                    }
                  },
                  onHorizontalDragUpdate: (DragUpdateDetails details){
                    var offset = details.globalPosition;
                    var dx = offset.dx;
                    var span = 180.0 - dx;

                    if (span >= 0 && span <= 110){
                      setState((){
                        paddingRight = span*2;
                        paddingLeft = 0.0;

                        double result = span/110;
                        lightSight = (50 - (result*100)/2).toInt();
                      });
                    }else if (span < 0 && span >= -111){
                      setState((){
                        paddingLeft = -span*2;
                        paddingRight = 0.0;

                        double result = span/110;
                        lightSight = (50 - (result*100)/2).toInt();
                      });
                    }
                  },
                  child: new Container(
                    color: const Color.fromRGBO(214, 214, 214, 1.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          padding: new EdgeInsets.fromLTRB(paddingLeft, 65.0, paddingRight, 0.0),
                          child: new Column(
                            children: <Widget>[
                              new Text('$lightSight%',style: const TextStyle(
                                  fontSize: 17.0,
                                  color: const Color.fromRGBO(127, 127, 127, 1.0)
                              ),),
                              new SizedBox(
                                width: 14.0,
                                height: 10.1,
                                child: new Image(image: const AssetImage('images/img_down.png')),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          padding: const EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 0.0),
                          child: createControl(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),),
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