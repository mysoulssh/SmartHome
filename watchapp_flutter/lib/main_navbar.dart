import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget{
  NavigationBar(this.view,this.title,{this.actions});

  final Widget view;
  final String title;
  final List<Widget> actions;


  @override
  _NavigationBarState createState() => new _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title,style: new TextStyle(
          color: Colors.black,
        ),),
        actions: widget.actions,
        backgroundColor: new Color.fromRGBO(250, 251, 253, 1.00),
        leading: new IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.of(context).pop();
        },color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: widget.view,
      backgroundColor: new Color.fromRGBO(214, 214, 214, 1.00),
    );
  }
}