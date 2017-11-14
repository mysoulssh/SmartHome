import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'me_identify_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';

typedef CellSelectCallback(int index);


class MeMemberDetailInfoScene extends StatefulWidget{

  @override
  _MeMemberDetailInfoSceneState createState() => new _MeMemberDetailInfoSceneState();
}

class _MeMemberDetailInfoSceneState extends State<MeMemberDetailInfoScene>{

  List<String> infoList = <String>['关系','我的昵称', '我的小区', '性别', '出生日期', '身高', '体重', '运动目标'];
  List<String> contentList = <String>['哥哥','来去之间', '孵化园', '男', '1999年9月9日', '178cm', '60kg', '10000步'];
  List<Widget> infoSceneList = <Widget>[];

  final TextEditingController likeNameController = new TextEditingController();
  final TextEditingController heightController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();
  final TextEditingController stepController = new TextEditingController();
  final TextEditingController sexController = new TextEditingController();

  String imagePath = 'images/testIcon.jpg';

  @override
  void initState(){
    super.initState();

    initList();
  }

  void reloadList(){
    infoSceneList.removeRange(0, infoSceneList.length);

    setState((){
      initList();
    });
  }

  void initList(){
    for(int i=0; i<infoList.length; i++){
      infoSceneList.add(createCell(infoList[i], i, contentList[i], (int index){
        print('$index');
        if (index == 3){
          selectSex(index);
        }else if (index == 4){
          showDate(index);
        }else if(index == 5){
          changeDialog('身高',index,'请输入您的身高（单位cm）',heightController);
        }else if(index == 6){
          changeDialog('体重',index,'请输入您的体重（单位kg）',weightController);
        }else if(index == 7){
          changeDialog('运动目标',index,'请输入您运动目标（单位步）',stepController);
        }
      }));
    }

    infoSceneList.insert(0, createHeader());
  }

  void changeDialog(String text, int index, String hintText,TextEditingController controller){      //修改昵称
    showDialog(context: context, child: new AlertDialog(
      title: new Text(text,textAlign: TextAlign.center,),
      content: new TextField(
        controller: controller,
        decoration: new InputDecoration.collapsed(hintText: hintText),
      ),
      actions: <Widget>[
        new FlatButton(onPressed: (){
          if (controller.text != null){
            if(index == 5){
              controller.text = controller.text +'cm';
            }else if(index == 6){
              controller.text = controller.text +'kg';
            }else if(index == 7){
              controller.text = controller.text +'步';
            }

            contentList[index] = controller.text;
            reloadList();
          }
          Navigator.of(context).pop();
        }, child: new Text('确定')),
        new FlatButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: new Text('取消',style: new TextStyle(color: Colors.red),))
      ],
    ));
  }

  void identify(){          //身份认证
    MeIdentifyScene identifyScene = new MeIdentifyScene();
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new NavigationBar(identifyScene, '身份认证')));
  }

  Widget createCell(String info,int index, String content, CellSelectCallback callback){
    return new GestureDetector(
      onTap: (){
        callback(index);
      },
      child: new Container(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: new Container(
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Expanded(child: new Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,10.0,0.0,10.0),
                  child: new Text(info,style: new TextStyle(fontSize: 16.0),),
                )),
                new Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: index==0?new PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        new PopupMenuItem(child: new Container(
                          child: new Container(
                            child: new Text('姐姐'),
                          ),
                        ),value: '姐姐',),
                        new PopupMenuItem(child: new Container(
                          child: new Container(
                            child: new Text('弟弟'),
                          ),
                        ),value: '弟弟',),
                        new PopupMenuItem(child: new Container(
                          child: new Container(
                            child: new Text('哥哥'),
                          ),
                        ),value: '哥哥',),
                        new PopupMenuItem(child: new Container(
                          child: new Container(
                            child: new Text('妹妹'),
                          ),
                        ),value: '妹妹',),
                      ],
                    onSelected: (String value){
                        contentList[0] = value;
                        reloadList();
                    },
                    child: new Text(content,style: new TextStyle(fontSize: 14.0,color: Colors.grey),),
                  ):new Text(content,style: new TextStyle(fontSize: 14.0,color: Colors.grey),),
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
          )
      ),
    );
  }

  void selectSex(int index){
    showDialog(context: context, child: new AlertDialog(
      title: new Text('性别',textAlign: TextAlign.center,),
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlatButton(onPressed: (){
            sexController.text = '男';
            changeSex('男', index, sexController);
          }, child: new Text('男',style: new TextStyle(fontSize: 16.0),)),
          new FlatButton(onPressed: (){
            sexController.text = '女';
            changeSex('女', index, sexController);
          }, child: new Text('女',style: new TextStyle(fontSize: 16.0),)),
        ],
      ),
    ));
  }

  void changeSex(String text, int index, TextEditingController controller){
    Navigator.of(context).pop();

    contentList[index] = controller.text;
    reloadList();
  }

  void showDate(int index){
    showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now())
        .then((DateTime value){
      if (value == null) return;

      var year  = value.year;
      var month = value.month;
      var day   = value.day;

      contentList[index]  = '$year'+'年'+'$month'+'月'+'$day'+'日';
      reloadList();
    });
  }

  Widget createHeader(){
    return  new Container(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: new GestureDetector(
          onTap: (){

          },
          child: new Container(
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Expanded(child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text('头像',style: new TextStyle(fontSize: 16.0),),
                ),),
                new Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 15.0, 8.0),
                  child: new CircleAvatar(
                    radius: 28.0,
                    backgroundImage: new AssetImage(imagePath),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context){
    return new Container(
      child: new ListView.builder(
        itemBuilder: (_,int index) => infoSceneList[index],
        itemCount: infoSceneList.length,
      ),
    );
  }
}