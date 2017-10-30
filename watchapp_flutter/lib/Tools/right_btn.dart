import 'package:flutter/material.dart';

typedef RightBtnClickedCallback();

class RightBtnItem extends StatefulWidget{

  RightBtnItem(this.text,this.clickedCallback);

  final RightBtnClickedCallback clickedCallback;
  final String text;

  @override
  _RightBtnItemState createState() => new _RightBtnItemState();
}


class _RightBtnItemState extends State<RightBtnItem>{
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new GestureDetector(      //智能联动界面添加规则按钮
        onTap: (){
          widget.clickedCallback();
        },
        child: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Center(
              child: new Text(widget.text,style: new TextStyle(color: Colors.black,fontSize: 15.0),
              ),
            )
        ),
      ),
    );
  }
}