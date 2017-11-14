import 'package:flutter/material.dart';

class ShowInfo{
  static void showInfo(BuildContext context,{String title = '提示',String content}){
    showDialog(context: context, child: new AlertDialog(
      title: new Text(title,textAlign: TextAlign.center,),
      content: new Text(content,textAlign: TextAlign.center),
      actions: <Widget>[
        new FlatButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: new Text('确定'))
      ],
    ));
  }
}