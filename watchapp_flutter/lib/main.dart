import 'package:flutter/material.dart';
import 'watch_app.dart';
import 'login_regist/login_scene.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'WatchApp',
      home: new LoginScene(),
    );
  }
}





