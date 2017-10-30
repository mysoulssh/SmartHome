import 'package:flutter/material.dart';
import 'cells/action_scene_cell_model.dart';

class DeviceInfoScene extends StatefulWidget{
  DeviceInfoScene(this.model,{this.callback});

  final ActionSceneCellModel model;
  final CellSelectCallback callback;

  @override
  _DeviceInfoSceneState createState() => new _DeviceInfoSceneState();
}

class _DeviceInfoSceneState extends State<DeviceInfoScene>{

  List<DeviceInfoSceneCell> infoCell = <DeviceInfoSceneCell>[];
  List<String> nameList = <String>['开','关','调至自动模式','调至睡眠模式','调至强力模式'];

  @override
  void initState(){
    super.initState();
    int i = 0;
    for (String tmp in nameList){
      infoCell.add(new DeviceInfoSceneCell(tmp,isTurnOn: i==widget.model.status?true:false,index: i, callback: (int index){
        for (DeviceInfoSceneCell tmp in infoCell){
          tmp.isTurnOn = false;
          tmp.reloadList();
        }

        DeviceInfoSceneCell cell = infoCell[index];
        cell.isTurnOn = true;
        widget.callback(index);
        cell.reloadList();
      },));
      i++;
    }
    i = 0;
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Expanded(child: new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new Padding(padding: const EdgeInsets.all(15.0),
                    child: widget.model.image,
                  ),
                ))
              ],
            ),
          ),
          new Expanded(child: new Container(
            padding: const EdgeInsets.only(top: 30.0),
            child: new ListView.builder(
              itemBuilder: (_,int index) => infoCell[index],
              itemCount: infoCell.length,
            ),
          ))
        ],
      ),
    );
  }
}


typedef void CellSelectCallback(int index);

class DeviceInfoSceneCell extends StatefulWidget{

  DeviceInfoSceneCell(this.text,{this.isTurnOn : false, this.index, this.callback});
  
  final String text;
  int index;
  bool isTurnOn;
  CellSelectCallback callback;

  _DeviceInfoSceneCellState cellState = new _DeviceInfoSceneCellState();

  void reloadList(){
    cellState.setState((){});
  }

  @override
  _DeviceInfoSceneCellState createState() => cellState;
}

class _DeviceInfoSceneCellState extends State<DeviceInfoSceneCell>{
  @override
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: (){
        String _text = widget.text;
        print('$_text');
//          widget.isTurnOn = !widget.isTurnOn;
        widget.callback(widget.index);
      },
      child: new Container(
        color: new Color.fromRGBO(214, 214, 214, 1.0),
        padding: const EdgeInsets.only(bottom: 1.0),
        child: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Expanded(child: new Container(
                padding: const EdgeInsets.fromLTRB(8.0, 13.0, 0.0, 13.0),
                child: new Text(widget.text,style: const TextStyle(fontSize: 15.0),),
              )),
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: new Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: new Image(image: new AssetImage(widget.isTurnOn?'images/btn_round2.png':'images/btn_round1.png')),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}