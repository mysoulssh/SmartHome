import 'package:flutter/material.dart';

class AiDeviceInfoScene extends StatefulWidget{
  @override
  _AiDeviceInfoSceneState createState() => new _AiDeviceInfoSceneState();
}

class _AiDeviceInfoSceneState extends State<AiDeviceInfoScene>{

  List<Widget> deviceInfoList = <Widget>[];

  List<String> deviceInfo = <String>['设备归属', '生产厂商', '设备编号', 'MAC地址'];
  List<String> devices = <String>['13888888888', 'Hawei', '1234567890', 'BC:56:36:01:B4:3C'];

  @override
  void initState(){
    super.initState();
    for (int i=0; i<deviceInfo.length; i++){
      deviceInfoList.add(new Container(
        padding: const EdgeInsets.only(top: 1.0),
        child: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Expanded(child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  deviceInfo[i],
                  style: new TextStyle(fontSize: 16.0),))
              ),
              new Padding(padding: const EdgeInsets.all(8.0),child: new Text(devices[i]),)
            ],
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: deviceInfoList,
      ),
    );
  }
}