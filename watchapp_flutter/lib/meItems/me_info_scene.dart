import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'me_identify_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/login_regist/login_scene.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserAttrSet/UserAttrSet.pb.dart' show Attr;
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';
import 'package:watchapp_flutter/meItems/models/user_info_model.dart';

typedef CellSelectCallback(int index);


class MeInfoScene extends StatefulWidget{

  @override
  _MeInfoSceneState createState() => new _MeInfoSceneState();
}

class _MeInfoSceneState extends State<MeInfoScene>{

  List<String> infoList = <String>['我的昵称', '我的小区', '性别', '出生日期', '身高', '体重', '运动目标', '身份认证',];
  List<String> contentList = <String>['来去之间', '孵化园', '男', '1999年9月9日', '178', '60', '10000', '未认证',];
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

    userInfoGet();
  }

  void userInfoGet(){
    httpManage.getUserInfo(UserAccessModel.accessModel.accessToken, UserAccessModel.accessModel.userName, (Map map){
      UserInfoModel infoModel = map['UserInfoModel'];
      print('$infoModel');
    }, (String errorMsg){
      print('个人详情错误信息：$errorMsg');
    });
  }


  //设置信息
  void setInfo(int item_id, {String valueString, int valueInt}){
    var tmp = new Attr()
      ..itemId = item_id
      ..itemVstring = valueString==null?'':valueString
      ..itemVint32 = valueInt;
    int tmpNum = tmp.itemVint32;
    print('$tmpNum');
    List<Attr> attr = <Attr>[tmp];
    httpManage.setUserInfo(UserAccessModel.accessModel.accessToken, UserAccessModel.accessModel.userName, attr, (Map map){

    },(String errorMsg){
      ShowInfo.showInfo(context,content: errorMsg);
    });
  }

  void reloadList(){
    infoSceneList.removeRange(0, infoSceneList.length);

    setState((){
      initList();
    });
  }

  void initList(){
    for(int i=0; i<infoList.length; i++){

      infoSceneList.add(createCell(infoList[i], i, contentList[i], 'cm', (int index){
        print('$index');
        if(index == 7){
          identify();
        }else if (index == 2){
          selectSex();
        }else if (index == 3){
          showDate(index);
        }else if(index == 0){
          changeDialog('昵称',index,'请输入您的昵称',likeNameController);
        }else if(index == 4){
          changeDialog('身高',index,'请输入您的身高（单位cm）',heightController);
        }else if(index == 5){
          changeDialog('体重',index,'请输入您的体重（单位kg）',weightController);
        }else if(index == 6){
          changeDialog('运动目标',index,'请输入您运动目标（单位步）',stepController);
        }
      }));
    }

    infoSceneList.insert(0, createHeader());
    infoSceneList.add(createFooter());
  }

  void changeDialog(String text, int index, String hintText,TextEditingController controller){      //修改昵称
    showDialog(context: context, child: new AlertDialog(
      title: new Text(text,textAlign: TextAlign.center,),
      content: new TextField(
        keyboardType: index==4||index==5||index==6?TextInputType.number:TextInputType.text,
        controller: controller,
        decoration: new InputDecoration.collapsed(hintText: hintText),
      ),
      actions: <Widget>[
        new FlatButton(onPressed: (){

          switch (index){
            case 0:{    //昵称设置
              setInfo(4, valueString: likeNameController.text);
            }
            break;
            case 4:{    //身高
              int height = int.parse(heightController.text);
              setInfo(21, valueInt: height);
            }
            break;
            case 5:{    //体重
              int weight = int.parse(weightController.text);
              setInfo(22, valueInt: weight);
            }
            break;
            case 6:{    //运动目标
              int step = int.parse(stepController.text);
              setInfo(23, valueInt: step);
            }
            break;
          }

          if (controller.text != null){
            if(index == 4){
              controller.text = controller.text;
            }else if(index == 5){
              controller.text = controller.text;
            }else if(index == 6){
              controller.text = controller.text;
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

  Widget createCell(String info,int index, String content, String unit, CellSelectCallback callback){

    String unit = '';
    if(index == 4){
      unit = 'cm';
    }else if(index == 5){
      unit = 'kg';
    }else{
      unit = '步';
    }

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
                  child: new Text(content,style: new TextStyle(fontSize: 14.0,color: Colors.grey),),
                ),
                (index == 4||index == 5|| index == 6)?
                new Container(
                  padding: const EdgeInsets.only(right: 8.0),
                    child: new Text(unit,style: new TextStyle(color: Colors.grey),),
                ):new Container(),
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

  void selectSex(){
    showDialog(context: context, child: new AlertDialog(
      title: new Text('性别',textAlign: TextAlign.center,),
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlatButton(onPressed: (){
            sexController.text = '男';
            changeSex('男', 1, sexController);
          }, child: new Text('男',style: new TextStyle(fontSize: 16.0),)),
          new FlatButton(onPressed: (){
            sexController.text = '女';
            changeSex('女', 2, sexController);
          }, child: new Text('女',style: new TextStyle(fontSize: 16.0),)),
        ],
      ),
    ));
  }

  //性别修改
  void changeSex(String text, int index, TextEditingController controller){
    Navigator.of(context).pop();

    contentList[index] = controller.text;
    reloadList();

    setInfo(14, valueInt: index);

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

      var attrYear = new Attr();
      attrYear.itemId = 11;
      attrYear.itemVint32 = value.year;

      var attrMonth = new Attr();
      attrMonth.itemId = 12;
      attrMonth.itemVint32 = value.month;

      var attrDay = new Attr();
      attrDay.itemId = 13;
      attrDay.itemVint32 = value.day;

      List<Attr> attr = <Attr>[attrYear,attrMonth,attrDay];
      httpManage.setUserInfo(UserAccessModel.accessModel.accessToken, UserAccessModel.accessModel.userName, attr, (Map map){

      },(String errorMsg){
        ShowInfo.showInfo(context,content: errorMsg);
      });

      
      contentList[index]  = '$year'+'年'+'$month'+'月'+'$day'+'日';
      reloadList();
    });
  }
  
  Widget createHeader(){
    return  new Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: new GestureDetector(
        onTap: (){
          ImagePicker.pickImage().then((File value){

          });
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
    );
  }
  
  Widget createFooter(){
    return new Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: new GestureDetector(
        onTap: (){
          print('退出登录');
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LoginScene()));
        },
        child: new Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Expanded(child: new Text(
                '退出登录',
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.red),)
              )
            ],
          ),
        )
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