import 'package:flutter/material.dart';

typedef FamilyCellCallback(int index);

class MeFamilyCell extends StatefulWidget{
  
  MeFamilyCell({this.index,this.text,this.callback});
  
  int index;
  String text;
  final FamilyCellCallback callback;


  @override
  _MeFamilyCellState createState() => new _MeFamilyCellState();
}

class _MeFamilyCellState extends State<MeFamilyCell>{
  @override
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: (){
        if(widget.callback != null)
          widget.callback(widget.index);
      },
      child: new Container(
        padding: const EdgeInsets.only(bottom: 1.0),
        color: new Color.fromRGBO(214, 214, 214, 1.0),
        child: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Expanded(child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: new Text(widget.text,style: new TextStyle(fontSize: 16.0),),
              )),
              new Container(
                padding: const EdgeInsets.only(right: 8.0),
                width: 26.0,
                height: 18.0,
                child: new Image(image: new AssetImage('images/btn_next2_n.png')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
