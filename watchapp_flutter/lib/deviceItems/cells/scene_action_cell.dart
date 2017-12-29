import 'package:flutter/material.dart';
import 'action_scene_cell_model.dart';

typedef void CellDidSelectCallback(ActionSceneCellModel cellModel);

class ActionSceneCell extends StatefulWidget{

  ActionSceneCell({
    ActionSceneCellModel tmpModel,
    this.callback,
  })  : image = tmpModel.image,
        deviceName = tmpModel.deviceName,
        location = tmpModel.location,
        model = tmpModel;

  final Image image;
  final String deviceName;
  final String location;
  final CellDidSelectCallback callback;
  final ActionSceneCellModel model;

  @override
  _ActionSceneCellState createState() => new _ActionSceneCellState();
}

class _ActionSceneCellState extends State<ActionSceneCell>{
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new GestureDetector(
        onTap: (){
          String _name = widget.deviceName;
          print('$_name');
          if (widget.callback != null) widget.callback(widget.model);
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
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.image,
                  ),
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
                        padding: const EdgeInsets.all(20.0),
                        child: new SizedBox(
                          width: 13.0,
                          height: 22.39,
                          child: new Image(image: new AssetImage('images/btn_next2_n.png')),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}