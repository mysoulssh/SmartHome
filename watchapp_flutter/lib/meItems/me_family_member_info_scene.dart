import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';

enum FamilyMemeberInfoType{
  FamilyMemeberInfoTypeSelf,
  FamilyMemeberInfoTypeInfo,
}

class MeFamilyMemeberInfoScene extends StatefulWidget{

  MeFamilyMemeberInfoScene({this.likeName,this.relation,this.isManage,this.type});

  final String likeName;
  final String relation;
  final bool isManage;
  final FamilyMemeberInfoType type;

  @override
  _MeFamilyMemeberInfoSceneState createState() => new _MeFamilyMemeberInfoSceneState();
}

class _MeFamilyMemeberInfoSceneState extends State<MeFamilyMemeberInfoScene>{
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.all(8.0),
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
                        child: new Text(widget.likeName,style: new TextStyle(fontSize: 16.0),),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: new Text(widget.relation,style: new TextStyle(fontSize: 14.0)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Padding(padding: const EdgeInsets.only(top: 20.0),child: new Container(
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(10.0),
                  child: new SizedBox(
                    width: 25.0,
                    height: 25.0,
                    child: new Image(image: new AssetImage('images/icon_phone.png')),
                  ),
                ),
                new Container(
                  child: new Text('手机号',style: new TextStyle(fontSize: 16.0),),
                ),
                new Expanded(child: new Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: new Text('12345678901',textAlign: TextAlign.end,),
                ))
              ],
            ),
          ),),
          widget.isManage&&widget.type!=FamilyMemeberInfoType.FamilyMemeberInfoTypeSelf?new Container(
            padding: const EdgeInsets.only(top: 80.0),
            child: new ActionBtn(text: '删除成员',callback: (){
              Navigator.of(context).pop();
            },),
          ):new Container()
        ],
      ),
    );
  }
}