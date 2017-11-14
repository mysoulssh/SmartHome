import 'package:flutter/material.dart';

typedef FamilyInfoCellCallback(int index);

class MeFamilyInfoCell extends StatefulWidget{

  MeFamilyInfoCell({this.familyName,this.familyInfo,this.index,this.callback});

  String familyName;
  String familyInfo;
  int index;
  final FamilyInfoCellCallback callback;

  _MeFamilyInfoCellState cellState = new _MeFamilyInfoCellState();

  @override
  _MeFamilyInfoCellState createState() => cellState;
}

class _MeFamilyInfoCellState extends State<MeFamilyInfoCell>{

  void reload(){
    setState((){});
  }

  @override
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: (){
        if (widget.callback != null)
          widget.callback(widget.index);
      },
      child: new Container(
        padding: const EdgeInsets.only(bottom: 1.0),
        color: new Color.fromRGBO(214, 214, 214, 1.0),
        child: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new Text(widget.familyName,style: new TextStyle(fontSize: 16.0),),
              ),
              new Expanded(child: new Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 8.0),
                child: new Text(widget.familyInfo),
              )),
              new Container(
                padding: const EdgeInsets.only(right: 8.0),
                width: 26.0,
                height: 18.0,
                child: new Image(image: new AssetImage('images/btn_next2_n.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}