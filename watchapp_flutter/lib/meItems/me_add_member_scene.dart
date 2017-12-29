import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'me_add_member_second_scene.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/RelationList/RelationList.pb.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';


class MeAddMemberScene extends StatefulWidget{

  MeAddMemberScene(this.relationList);

  List<RelationInfo> relationList;

  @override
  _MeAddMemberSceneState createState() => new _MeAddMemberSceneState();
}

class _MeAddMemberSceneState extends State<MeAddMemberScene>{

  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController idCardController = new TextEditingController();

  String relation = '请选择';
  int relationCode = 8888;

  List<PopupMenuEntry<int>> getRelation(){

    List<PopupMenuEntry<int>> tmpList = <PopupMenuEntry<int>>[];
    for (var v in widget.relationList){
      tmpList.add(new PopupMenuItem(
        child: new Text(TypeJudgment.judgmentRelation(v.relationCode)),
        value: v.relationCode,)
      );
    }

    return tmpList;
  }
  
  Widget createSelectScene(String imageName,String text){
    return new Container(
      color: new Color.fromRGBO(214, 214, 214, 1.0),
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: new SizedBox(
                width: 25.0,
                height: 25.0,
                child: new Image(image: new AssetImage('images/'+imageName)),
              ),
            ),
            new Container(
              child: new Text(text,style: new TextStyle(fontSize: 16.0)),
            ),
            new Expanded(child: new Container(
                alignment: Alignment.centerRight,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new PopupMenuButton<int>(itemBuilder: (BuildContext context) => getRelation(),
                      onSelected: (int value){
                        setState((){
                          relationCode = value;
                          relation = TypeJudgment.judgmentRelation(value);
                        });
                      },
                      child: new Text(relation,style: new TextStyle(fontSize: 16.0),),
                    ),
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createInputScene(String imageName,String text, TextEditingController controller, String hintText){
    return new Container(
      color: new Color.fromRGBO(214, 214, 214, 1.0),
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(10.0),
              child: new SizedBox(
                width: 25.0,
                height: 25.0,
                child: new Image(image: new AssetImage('images/'+imageName)),
              ),
            ),
            new Container(
              child: new Text(text,style: new TextStyle(fontSize: 16.0),),
            ),
            new Expanded(child: new Container(
              padding: const EdgeInsets.only(right: 8.0),
              child: new TextField(
                keyboardType: text == '手机号'?TextInputType.number:TextInputType.text,
                textAlign: TextAlign.end,
                controller: controller,
                decoration: new InputDecoration.collapsed(hintText: hintText),
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
          createSelectScene('icon_people.png', '关系'),
          createInputScene('icon_phone.png', '手机号', phoneController, '请输入手机号'),
          createInputScene('icon_id.png', '身份证号', idCardController, '请输入18位身份证号'),

          new Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: new ActionBtn(text: '下一步',callback: (){
              MeAddMemberSecondScene secondScene = new MeAddMemberSecondScene(relation,relationCode,phoneController.text,idCardController.text);
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new NavigationBar(secondScene,'添加家人')
              ));
            },),
          )
        ],
      ),
    );
  }
}