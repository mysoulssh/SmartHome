import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'dart:ui' show window;

class MeAddMemberSecondScene extends StatefulWidget{
  @override
  _MeAddMemberSecondSceneState createState() => new _MeAddMemberSecondSceneState();
}

class _MeAddMemberSecondSceneState extends State<MeAddMemberSecondScene>{

  String likeName = '请输入';
  String sex      = '请输入';
  String birthday = '请输入';

  final TextEditingController likeNameController = new TextEditingController();

  Widget createTextField(){
    return new Container(
      padding: const EdgeInsets.only(right: 10.0),
      child: new TextField(
        textAlign: TextAlign.end,
        controller: likeNameController,
        decoration: new InputDecoration.collapsed(hintText: '请输入',hintStyle: new TextStyle(fontSize: 15.0,color: Colors.black54)),
        style: new TextStyle(fontSize: 16.0,color: Colors.black54),
      ),
    );
  }

  Widget createPopScene(){
    return new Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 10.0),
      child: new PopupMenuButton<String>(itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        new PopupMenuItem(child: new Text('男'), value: '男',),
        new PopupMenuItem(child: new Text('女'), value: '女',),
      ],onSelected: (String value){
        setState((){
          sex = value;
        });
      },child: new Text(sex,style: new TextStyle(fontSize: 15.0,color: Colors.black54),),),
    );
  }

  Widget createBirthdayScene(){
    return new Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 10.0),
      child: new GestureDetector(onTap: (){
        showDatePicker(
            context: context,
            initialDate: new DateTime.now(),
            firstDate: new DateTime(1900),
            lastDate: new DateTime.now(),
            locale: window.locale
        ).then((DateTime value){
          setState((){
            var year  = value.year;
            var month = value.month;
            var day   = value.day;
            birthday  = '$year'+'年'+'$month'+'月'+'$day'+'日';
          });
        });
      }, child: new Text(birthday,style: new TextStyle(fontSize: 15.0,color: Colors.black54),)),
    );
  }

  Widget createSelectScene(String imageName,String text, int tag){
    Widget scene;
    switch (tag){
      case 0:{
        scene = createTextField();
      }
      break;
      case 1:{
        scene = createPopScene();
      }
      break;
      case 2:{
        scene = createBirthdayScene();
      }
      break;
    }

    return new Container(
      color: new Color.fromRGBO(214, 214, 214, 1.0),
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
              child: new SizedBox(
                width: 25.0,
                height: 25.0,
                child: new Image(image: new AssetImage('images/'+imageName)),
              )
            ),
            new Container(
              child: new Text(text,style: new TextStyle(fontSize: 16.0),),
            ),
            new Expanded(child: new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Expanded(child: scene),
                  new Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new SizedBox(
                        width: 12.0,
                        height: 18.5,
                        child: new Image(image: new AssetImage('images/btn_next2_n.png'),
                        )
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(child: new Container(
                color: new Color.fromRGBO(214, 214, 214, 1.0),
                padding: const EdgeInsets.only(bottom: 1.0),
                child: new Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: new Text('请填写个人信息，以便准确的分析数据',textAlign: TextAlign.center,),
                ),
              ))
            ],
          ),
          createSelectScene('icon_name.png', '昵称', 0),
          createSelectScene('icon_sex.png', '性别', 1),
          createSelectScene('icon_brithday.png', '出生日期', 2),

          new Container(
            padding: const EdgeInsets.only(top: 80.0),
            child: new ActionBtn(text: '完成',callback: (){

            },),
          )
        ],
      ),
    );
  }
}