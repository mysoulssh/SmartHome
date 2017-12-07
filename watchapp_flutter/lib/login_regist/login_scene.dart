import 'package:flutter/material.dart';
import 'regist_scene.dart';
import 'package:watchapp_flutter/watch_app.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/md5_text.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';
import 'package:watchapp_flutter/meItems/models/house_info_model.dart';


class LoginScene extends StatefulWidget{
  @override
  _LoginSceneState createState() => new _LoginSceneState();
}

class _LoginSceneState extends State<LoginScene>{
  final TextEditingController accountController = new TextEditingController();
  final TextEditingController pwdController     = new TextEditingController();

  var edgeLeftAndRight = 40.0;

  bool isRemenberPwd = true;

  var loginAllEdge = new EdgeInsets.all(8.0);

  bool checkShouldLogin(){
    bool shouldLogin = true;

    if(accountController.text == '' || accountController.text == null){
      ShowInfo.showInfo(context,content: '账号不能为空');
      shouldLogin = false;
    }else if(pwdController.text == '' || pwdController.text == null){
      ShowInfo.showInfo(context,content: '密码不能为空');
      shouldLogin = false;
    }

    return shouldLogin;
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
                new Stack(
                  children: <Widget>[
                    new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            padding: new EdgeInsets.fromLTRB(edgeLeftAndRight, 80.0, edgeLeftAndRight, 10.0),
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
                                      decoration: new InputDecoration.collapsed(hintText: '请输入密码'),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          new Container(
                            padding: new EdgeInsets.fromLTRB(edgeLeftAndRight, 10.0, 35.0, 10.0),
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  padding: const EdgeInsets.only(left: 11.0),
                                  child: new GestureDetector(
                                    onTap: (){
                                      setState((){
                                        isRemenberPwd = !isRemenberPwd;
                                      });
                                    },
                                    child: new Image(image: new AssetImage(isRemenberPwd?'images/btn_checkbox1.png':'images/btn_checkbox2.png')),
                                  ),
                                ),
                                new Expanded(child: new Container(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: new GestureDetector(
                                    onTap: (){
                                      setState((){
                                        isRemenberPwd = !isRemenberPwd;
                                      });
                                    },
                                    child: new Text('记住密码',style: new TextStyle(fontSize: 15.0,color: Colors.black)),
                                  ),
                                )),
                                new Container(
                                  child: new GestureDetector(
                                    onTap: (){
                                      print('忘记密码');
                                    },
                                    child: new Text('忘记密码',style: new TextStyle(fontSize: 15.0,color: Colors.black)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            padding: new EdgeInsets.fromLTRB(edgeLeftAndRight, 110.0, edgeLeftAndRight, 0.0),
                            child: new GestureDetector(
                              onTap: (){
                                if (checkShouldLogin() == false) return;
                                print('登录');

                                showDialog(context: context, child: new Center(
                                  child: new CircularProgressIndicator(),
                                ));

                                httpManage.loginCode(accountController.text, MD5Text.convertMD5(pwdController.text), (Map map){
                                  UserAccessModel accessModel = map['accessModel'];
                                  accessModel.userName = accountController.text;

                                  httpManage.houseList(UserAccessModel.accessModel.accessToken, '', (Map map){
                                    Navigator.of(context).pop();

                                    List<HouseInfoModel> houseModels = map['houses'];
                                    if(houseModels.length > 0){
                                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new WatchApp(houseGuid: houseModels.first.houseGuid,)));
                                    }else{
                                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new WatchApp()));
                                    }
                                  }, (String errorMsg){
                                    print('$errorMsg');
                                  });
//18200550780
                                }, (String errorMsg){
                                  Navigator.of(context).pop();

                                  ShowInfo.showInfo(context,content: errorMsg);
                                });

                              },
                              child: new Container(
                                padding: loginAllEdge,
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
                                  child: new Text('登录',style: new TextStyle(fontSize: 16.0,color: Colors.black),),
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            padding: new EdgeInsets.fromLTRB(edgeLeftAndRight, 20.0, edgeLeftAndRight, 0.0),
                            child: new GestureDetector(
                              onTap: (){
                                print('注册');

                                RegistScene registScene = new RegistScene((int user_id){
                                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new WatchApp()));
                                });
                                Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) => registScene,
                                ));
                              },
                              child: new Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: new BoxDecoration(
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
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}