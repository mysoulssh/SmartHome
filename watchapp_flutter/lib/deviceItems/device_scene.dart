import 'package:flutter/material.dart';
import 'cells/scene_device_cell.dart';

class DeviceScene extends StatefulWidget{

  DeviceScene(this.title);

  final String title;

  @override
  _DeviceSceneState createState() => new _DeviceSceneState();
}

class _DeviceSceneState extends State<DeviceScene>{

  List<DeviceSceneCell> _cell = <DeviceSceneCell>[];

  @override
  void initState(){
    super.initState();
    _cell.add(new DeviceSceneCell(image: new Image(image: const AssetImage('images/testIcon.jpg')),deviceName: '小米空气净化器',isDeviceOnline: true,isTurnOn: true,));
    _cell.add(new DeviceSceneCell(image: new Image(image: const AssetImage('images/testIcon.jpg')),deviceName: '小米55寸智能电视',isDeviceOnline: true,isTurnOn: false,));
    _cell.add(new DeviceSceneCell(image: new Image(image: const AssetImage('images/testIcon.jpg')),deviceName: '节能灯',isDeviceOnline: false,isTurnOn: false,));
    _cell.add(new DeviceSceneCell(image: new Image(image: const AssetImage('images/testIcon.jpg')),deviceName: '窗帘',isDeviceOnline: true,isTurnOn: true,));
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.white,
      child: new ListView.builder(
        itemBuilder: (_,int index) => _cell[index],
        itemCount: _cell.length,
      ),
    );
  }
}
