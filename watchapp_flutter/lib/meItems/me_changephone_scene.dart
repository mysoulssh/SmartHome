import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/Tools/send_code_btn.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';

import 'package:watchapp_flutter/Tools/show_infos_tool.dart';
import 'models/user_info_model.dart';

class MeChangePhoneScene extends StatefulWidget{

  MeChangePhoneScene(this.userInfoModel);

  final UserInfoModel userInfoModel;

  @override
  _MeChangePhoneSceneState createState() => new _MeChangePhoneSceneState();
}

class _MeChangePhoneSceneState extends State<MeChangePhoneScene> with TickerProviderStateMixin{

  final TextEditingController oldController      = new TextEditingController();
  final TextEditingController newController      = new TextEditingController();
  final TextEditingController newPhoneController = new TextEditingController();
  final TextEditingController oldPhoneController = new TextEditingController();


  @override
  void initState(){
    super.initState();

    oldPhoneController.text = widget.userInfoModel.user_name;
  }

  bool shouldChangePhone(){
    bool isAllow = true;
    if (
        oldController.text == ''||
        newController.text == ''||
        newPhoneController.text == ''
    ){
      isAllow = false;
      ShowInfo.showInfo(context,content: '手机号或验证码不能为空');
    }

    return isAllow;
  }

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
                  padding: const EdgeInsets.all(10.0),
                  child: new SizedBox(
                    width: 25.0,
                    height: 25.0,
                    child: new Image(image: new AssetImage('images/icon_phone.png')),
                  ),
                ),
                new Expanded(child: new Container(
                  child: new Text(oldPhoneController.text,style: new TextStyle(fontSize: 16.0),),
                )),
                new Expanded(child: new Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: new TextField(
                    controller: oldController,
                    textAlign: TextAlign.end,
                    style: new TextStyle(fontSize: 16.0,color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration.collapsed(hintText: '请输入验证码',),
                  ),
                ))
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 1.0),
            color: new Color.fromRGBO(214, 214, 214, 1.0),
            child: new Container(
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: new Image(image: new AssetImage('images/icon_phone.png')),
                    ),
                  ),
                  new Expanded(child: new Container(
                    child: new TextField(
                      controller: newPhoneController,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(fontSize: 16.0,color: Colors.black),
                      decoration: new InputDecoration.collapsed(hintText: '请输入新手机号'),
                    ),
                  )),
                  new Expanded(child: new Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new TextField(
                      controller: newController,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      style: new TextStyle(fontSize: 16.0,color: Colors.black),
                      decoration: new InputDecoration.collapsed(hintText: '请输入验证码'),
                    ),
                  ))
                ],
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(right: 8.0),
            alignment: Alignment.centerRight,
            child: new SendCodeBtn(text: '发送验证码',callback: (){
              if (newPhoneController.text != ''){
                httpManage.sendCode(oldPhoneController.text, 3,(String errorMsg){
                  ShowInfo.showInfo(context,content: errorMsg);
                });
                httpManage.sendCode(newPhoneController.text, 3,(String errorMsg){
                  ShowInfo.showInfo(context,content: errorMsg);
                });
              }else{
                ShowInfo.showInfo(context,content: '新手机号不能为空');
              }
            },),
          ),
          new Expanded(child: new ActionBtn(text: '完成',callback: (){
              print('完成');

              if (!shouldChangePhone()){
                return ;
              }

              httpManage.userPhoneChange(
                  UserAccessModel.accessModel.accessToken,
                  oldPhoneController.text,
                  oldController.text,
                  newPhoneController.text,
                  newController.text,
                      (Map map){

                      }, (String errorMsg){
                    print('修改手机号码错误信息：$errorMsg');
              });
            },
          ))
        ],
      ),
    );
  }
}