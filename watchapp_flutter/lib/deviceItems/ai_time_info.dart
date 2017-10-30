import 'package:flutter/material.dart';
import 'dart:ui';

class AiTimeInfo extends StatefulWidget{
  @override
  _AiTimeInfoState createState() => new _AiTimeInfoState();
}

class _AiTimeInfoState extends State<AiTimeInfo>{

  @override
  void initState(){
    super.initState();

//    showTimePicker(context: context, initialTime: new TimeOfDay.fromDateTime(new DateTime.now()));
    showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1999),
      lastDate: new DateTime(2050),
      locale: window.locale,
    );
  }

  @override
  Widget build(BuildContext context){
    return new Container(

    );
  }
}