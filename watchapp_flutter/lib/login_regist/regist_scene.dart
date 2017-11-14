import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/send_code_btn.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/md5_text.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/watch_app.dart';

typedef loginSuccessCallback(int user_id);

class RegistScene extends StatefulWidget{

  RegistScene(this.callback);

  final loginSuccessCallback callback;

  @override
  _RegistSceneState createState() => new _RegistSceneState();
}

class _RegistSceneState extends State<RegistScene>{

  final TextEditingController accountController = new TextEditingController();
  final TextEditingController pwdController     = new TextEditingController();
  final TextEditingController codeController    = new TextEditingController();

  var edgeLeftAndRight = 40.0;

  bool isAgree = true;

  bool checkShouldRegist(){
    bool shouldRegist = true;

    if(accountController.text == '' || accountController.text == null){
      ShowInfo.showInfo(context,content: '账号不能为空');
      shouldRegist = false;
    }else if(pwdController.text == '' || pwdController.text == null){
      ShowInfo.showInfo(context,content: '密码不能为空');
      shouldRegist = false;
    }else if(codeController.text == '' || codeController.text == null){
      ShowInfo.showInfo(context,content: '验证码不能为空');
      shouldRegist = false;
    }else if(!isAgree){
      ShowInfo.showInfo(context,content: '未同意用户注册协议');
      return false;
    }
    return shouldRegist;
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: new Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                new Container(
                  child: new Image(image: new AssetImage('images/background_login.png')),
                ),
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                          child: new IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              color: Colors.black)
                      ),
                      new Container(
                        padding: new EdgeInsets.fromLTRB(edgeLeftAndRight, 0.0, edgeLeftAndRight, 10.0),
                        child: new Container(
                          decoration: new BoxDecoration(
                              border: const Border(bottom: const BorderSide(width: 1.0,color: Colors.black))
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 5.0),
                                child: new Image(image: new AssetImage('images/icon_phone_black.png')),
                              ),
                              new Expanded(child: new Container(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: new TextField(
                                  controller: accountController,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration.collapsed(hintText: '请输入手机号码'),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                      new Container(
                        padding: new EdgeInsets.fromLTRB(edgeLeftAndRight, 0.0, edgeLeftAndRight, 10.0),
                        child: new Container(
                          decoration: new BoxDecoration(
                              border: const Border(bottom: const BorderSide(width: 1.0,color: Colors.black))
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 5.0),
                                child: new Image(image: new AssetImage('images/icon_lock_black.png')),
                              ),
                              new Expanded(child: new Container(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: new TextField(
                                  controller: pwdController,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: new InputDecoration.collapsed(hintText: '请输入新密码'),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                      new Container(
                        padding: new EdgeInsets.fromLTRB(edgeLeftAndRight, 0.0, edgeLeftAndRight, 10.0),
                        child: new Container(
                          decoration: new BoxDecoration(
                              border: const Border(bottom: const BorderSide(width: 1.0,color: Colors.black))
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                padding: const EdgeInsets.fromLTRB(7.0, 8.0, 0.0, 5.0),
                                child: new Image(image: new AssetImage('images/icon_message_black.png')),
                              ),
                              new Expanded(child: new Container(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: new TextField(
                                  controller: codeController,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration.collapsed(hintText: '请输入验证码'),
                                ),
                              )),
                              new Container(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: new SizedBox(
                                  width: 105.0,
                                  height: 30.0,
                                  child: new SendCodeBtn(text: '发送验证码',callback: (){
                                    print('发送验证码');
                                    httpManage.sendCode(accountController.text, 1,(String errorMsg){
                                      ShowInfo.showInfo(context,content: errorMsg);
                                    });

                                  },),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Container(
                        padding: new EdgeInsets.fromLTRB(edgeLeftAndRight, 110.0, edgeLeftAndRight, 0.0),
                        child: new GestureDetector(
                          onTap: (){
                            if(checkShouldRegist() == false) return;

                            print('注册');
                            httpManage.registCode(accountController.text, codeController.text, pwdController.text, (Map map){

                              int user_id = map['user_id'];
                              print('user_id = $user_id');

                              String pwdMd5 = MD5Text.convertMD5(pwdController.text);

                              httpManage.loginCode(accountController.text, pwdMd5, (Map map){

                                UserAccessModel accessModel = map['accessModel'];
                                accessModel.userName = accountController.text;
                                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new WatchApp()));

                              }, (String errorMsg){
                                ShowInfo.showInfo(context,content: errorMsg);
                              });

                            },(String errorMsg){
                              ShowInfo.showInfo(context,content: errorMsg);
                            });
                          },
                          child: new Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
                                border: const Border(
                                  top: const BorderSide(width: 1.0,color: Colors.black),
                                  right: const BorderSide(width: 1.0,color: Colors.black),
                                  bottom: const BorderSide(width: 1.0,color: Colors.black),
                                  left: const BorderSide(width: 1.0,color: Colors.black),
                                )
                            ),
                            child: new Center(
                              child: new Text('注册',style: new TextStyle(fontSize: 16.0,color: Colors.black),),
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(left: 11.0),
                              child: new GestureDetector(
                                onTap: (){
                                  setState((){
                                    isAgree = !isAgree;
                                  });
                                },
                                child: new Image(image: new AssetImage(isAgree?'images/btn_checkbox1.png':'images/btn_checkbox2.png')),
                              ),
                            ),
                            new Container(
                              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                              child: new GestureDetector(
                                onTap: (){
                                  setState((){
                                    isAgree = !isAgree;
                                  });
                                },
                                child: new Text('同意',style: new TextStyle(fontSize: 15.0,color: Colors.black)),
                              ),
                            ),
                            new Container(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: new GestureDetector(
                                onTap: (){
                                  print('用户注册协议');
                                },
                                child: new Text('用户注册协议',style: new TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}