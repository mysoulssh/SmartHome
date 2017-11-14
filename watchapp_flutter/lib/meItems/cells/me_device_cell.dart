import 'package:flutter/material.dart';

class MeDeviceCell extends StatefulWidget{

  MeDeviceCell();


  @override
  _MeDeviceCellState createState() => new _MeDeviceCellState();
}

class _MeDeviceCellState extends State<MeDeviceCell>{
  @override
  Widget build(BuildContext context){
    return new Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: new SizedBox(
                width: 50.0,
                height: 50.0,
                child: new CircleAvatar(
                  backgroundImage: new AssetImage('images/testIcon.jpg'),
                ),
              ),
            ),
            new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: new Text('ZX001',style: new TextStyle(fontSize: 16.0),),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: new Text('已绑定自己',style: new TextStyle(fontSize: 14.0)),
                  )
                ],
              ),
            ),
            new Expanded(child: new Container(
              padding: const EdgeInsets.only(right: 8.0),
              alignment: Alignment.centerRight,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: new Text('设备在线',style: new TextStyle(fontSize: 16.0),),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: new Text('预计待机5天',style: new TextStyle(fontSize: 14.0)),
                  )
                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}