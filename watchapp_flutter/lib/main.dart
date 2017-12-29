import 'package:flutter/material.dart';
import 'watch_app.dart';
import 'login_regist/login_scene.dart';
import 'dart:io';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{

  bool _checkShouldLogin(){
    bool tmp = false;

    var dir = Directory.systemTemp.path;
    new File('$dir/account.txt').exists().then((bool onValue){
      tmp = onValue;
    });

    return tmp;
  }


  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'WatchApp',
      home: new LoginScene(),
    );
  }
}





