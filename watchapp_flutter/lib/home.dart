import 'package:flutter/material.dart';
import 'deviceItems/ai_action.dart';

class HomeItem extends StatefulWidget{

  HomeItem({this.currentHouseGuid});

  String currentHouseGuid;

  @override
  _HomeItemState createState() => new _HomeItemState();
}

class _HomeItemState extends State<HomeItem>{
  @override
  Widget build(BuildContext context){
    return new Stack(
      children: <Widget>[
        new AiAction(houseGuid: widget.currentHouseGuid,),
      ],
    );
  }
}