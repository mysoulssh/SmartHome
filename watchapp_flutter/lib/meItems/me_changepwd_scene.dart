import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';


class MeChangePwdScene extends StatefulWidget{
  @override
  _MeChangePwdSceneState createState() => new _MeChangePwdSceneState();
}

class _MeChangePwdSceneState extends State<MeChangePwdScene>{
  
  final TextEditingController oldPwdControl = new TextEditingController();
  final TextEditingController newPwdControl = new TextEditingController();
  
  bool isShowOldPwd = false;
  bool isShowNewPwd = false;
  
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
                    child: new Image(image: new AssetImage('images/icon_lock.png')),
                  ),
                ),
                new Expanded(child: new TextField(
                  controller: oldPwdControl,
                  obscureText: !isShowOldPwd,
                  decoration: new InputDecoration.collapsed(hintText: '请输入旧密码'),
                  style: new TextStyle(fontSize: 16.0,color: Colors.black),
                )),
                new Container(
                  child: new FlatButton(onPressed: (){
                    setState((){
                      isShowOldPwd = !isShowOldPwd;
                    });
                  }, child: new Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: new SizedBox(
                      width: 26.0,
                      height: 15.0,
                      child: new Image(image: new AssetImage(isShowOldPwd?'images/btn_eye1.png':'images/btn_eye2.png')),
                    ),
                  )),
                )
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
            child: new Container(
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: new Image(image: new AssetImage('images/icon_lock.png')),
                    ),
                  ),
                  new Expanded(child: new TextField(
                    controller: newPwdControl,
                    obscureText: !isShowNewPwd,
                    decoration: new InputDecoration.collapsed(hintText: '请输入新密码'),
                    style: new TextStyle(fontSize: 16.0,color: Colors.black),
                  )),
                  new Container(
                    child: new FlatButton(onPressed: (){
                      setState((){
                        isShowNewPwd = !isShowNewPwd;
                      });
                    }, child: new Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: new SizedBox(
                        width: 26.0,
                        height: 15.0,
                        child: new Image(image: new AssetImage(isShowNewPwd?'images/btn_eye1.png':'images/btn_eye2.png')),
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
          new Container(
            color: new Color.fromRGBO(107, 107, 107, 1.0),
            child: new Row(
              children: <Widget>[
                new Expanded(child: new Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: new Text('6-16位任意字符组合，区分大小写，不能有空格',style: new TextStyle(color: Colors.white,fontSize: 13.0),),
                ))
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 100.0),
            child: new Center(
              child: new ActionBtn(text: '完成',callback: (){

                if (newPwdControl.text != '' && oldPwdControl.text != '') {
                  showDialog(context: context, child: new Center(
                    child: new CircularProgressIndicator(),
                  ));
                  httpManage.userChangePass(
                      UserAccessModel.accessModel.accessToken,
                      newPwdControl.text, (Map map) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }, (String errorMsg) {
                    Navigator.of(context).pop();
                  });
                }else{
                  ShowInfo.showInfo(context,content: '请输入完整信息');
                }

              },),
            ),
          )
        ],
      ),
    );
  }
}