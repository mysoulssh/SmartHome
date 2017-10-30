import 'package:flutter/material.dart';

class SportItem extends StatefulWidget{
  @override
  _SportItemState createState() => new _SportItemState();
}

class _SportItemState extends State<SportItem>{

  Container _buildWidget(Icon icon,String string){
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Expanded(child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              new Container(
                padding: new EdgeInsets.only(top: 8.0),
                child: new Text(string),
              ),
            ],
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
//    return new Stack(
//      children: <Widget>[
//        new Align(
//          alignment: FractionalOffset.bottomCenter,
//          child: new Row(
//            crossAxisAlignment: CrossAxisAlignment.end,
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              new Expanded(child: _buildWidget(new Icon(Icons.favorite), '心率'),),
//              new Expanded(child: _buildWidget(new Icon(Icons.streetview), '血压'),),
//              new Expanded(child: _buildWidget(new Icon(Icons.audiotrack), '体温'),),
//            ],
//          ),
//        ),
//      ],
//    );
  return new Container(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            new Expanded(child: _buildWidget(new Icon(Icons.favorite), '心率'),),
//            new Expanded(child: _buildWidget(new Icon(Icons.streetview), '血压'),),
//            new Expanded(child: _buildWidget(new Icon(Icons.audiotrack), '体温'),),
            new Expanded(child: new Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: const Border(
                    right: const BorderSide(width: 1.0, color: Colors.grey),
                  ),
                ),
              padding: new EdgeInsets.all(30.0),
              child: new Column(
                children: <Widget>[
                  new Text('Text1'),
                  new Text('Text1'),
                ],
              ),
            )),
            new Expanded(child: new Container(
              padding: new EdgeInsets.all(30.0),
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new Text('Text1'),
                  new Text('Text1'),
                ],
              ),
            )),
            new Expanded(child: new Container(
              padding: new EdgeInsets.all(30.0),
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new Text('Text1'),
                  new Text('Text1'),
                ],
              ),
            )),
          ],
        ),
      ],
    ),
  );
//    new Row(
//      crossAxisAlignment: CrossAxisAlignment.end,
//      children: <Widget>[
//        new Expanded(child: _buildWidget(new Icon(Icons.favorite), '心率'),),
//        new Expanded(child: _buildWidget(new Icon(Icons.streetview), '血压'),),
//        new Expanded(child: _buildWidget(new Icon(Icons.audiotrack), '体温'),),
//      ],
//    );
  }
}