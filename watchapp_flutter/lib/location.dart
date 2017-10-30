import 'package:flutter/material.dart';

class LocationItem extends StatefulWidget{
  @override
  _LocationItemState createState() => new _LocationItemState();
}

class _LocationItemState extends State<LocationItem>{
  @override
  Widget build(BuildContext context){
    return new Stack(
      children: <Widget>[
        new Align(
          alignment: FractionalOffset.center,
          child: new Text('位置'),
        ),
      ],
    );
  }
}