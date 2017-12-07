import 'package:flutter/material.dart';
import 'action_scene_cell_model.dart';

typedef SwitchBtnClickCallback(bool isTurnOn);


class SceneCell extends StatefulWidget{

//  SceneCell({this.image,this.deviceName,this.location,this.isTurnOn});
  SceneCell({
    ActionSceneCellModel model,
    this.switchBtnClickCallback,
  })  : image = model.image,
        deviceName = model.deviceName,
        location = model.location,
        isTurnOn = model.status==1?false:true,
        cellModel = model;

  //设备图片
  final Image image;
  //设备名称
  final String deviceName;
  //设备所在地
  final String location;
  //设备是否开启
  bool isTurnOn;
  //模型
  ActionSceneCellModel cellModel;
  //开关回调
  SwitchBtnClickCallback switchBtnClickCallback;


  void reloadCell(ActionSceneCellModel model){
    cellModel = model;
    isTurnOn = model.status==1?false:true;
    cellState.setState((){});
  }

  _SceneCellState cellState = new _SceneCellState();

  @override
  _SceneCellState createState() => cellState;
}

class _SceneCellState extends State<SceneCell>{

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
              padding: const EdgeInsets.only(bottom: 1.0),
              color: new Color.fromRGBO(214, 214, 214, 1.0),
              child: new Container(
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    new Expanded(child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(widget.deviceName),
                        new Text(widget.location,style: new TextStyle(color: Colors.grey),),
                      ],
                    )),
                    new Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new GestureDetector(
                        onTap: (){
                          widget.isTurnOn = !widget.isTurnOn;
                          widget.switchBtnClickCallback(widget.isTurnOn);
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
                    ),
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