import 'package:flutter/material.dart';
import 'cells/me_device_cell.dart';

class MeDeviceScene extends StatefulWidget{
  @override
  _MeDeviceSceneState createState() => new _MeDeviceSceneState();
}

class _MeDeviceSceneState extends State<MeDeviceScene>{

  List<MeDeviceCell> cells = <MeDeviceCell>[];

  @override
  void initState(){
    super.initState();

    for (int i=0;i<4;i++){
      cells.add(new MeDeviceCell());
    }
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new ListView.builder(itemBuilder: (_,int index) => cells[index],itemCount: cells.length,),
    );
  }
}