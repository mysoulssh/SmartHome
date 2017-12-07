import 'package:flutter/material.dart';
import 'meItems/me_info_scene.dart';
import 'main_navbar.dart';
import 'meItems/me_changepwd_scene.dart';
import 'meItems/me_changephone_scene.dart';
import 'meItems/me_member_scene.dart';
import 'meItems/me_add_member_scene.dart';
import 'meItems/me_device_scene.dart';
import 'package:watchapp_flutter/Tools/scan_qr_code.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';
import 'package:watchapp_flutter/Tools/scan_qr_code.dart';
import 'deviceItems/device_scene.dart';
import 'meItems/me_family_scene.dart';
import 'meItems/me_receive_message_scene.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'meItems/models/user_info_model.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';

class MineItem extends StatefulWidget {
  @override
  _MineItemState createState() => new _MineItemState();
}

class _MineItemState extends State<MineItem> {

  String likeName = '来去之间';

  @override
  void initState(){
    super.initState();
    //获取个人数据
    httpManage.getUserInfo(UserAccessModel.accessModel.accessToken, UserAccessModel.accessModel.userName, (Map map){

      UserInfoModel infoModel = map['UserInfoModel'];
      String liName = infoModel.like_name;
      likeName = '$liName';
      setState((){});

    }, (String errorMsg){
      ShowInfo.showInfo(context,content: errorMsg);
    });

  }

  Widget _createItems(String image,String text,int tag){
    return new GestureDetector(
      child: new Row(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new SizedBox(
              width: 25.0,
              height: 25.0,
              child: new Image(image: new AssetImage('images/'+image)),
            ),
          ),
          new Expanded(child: new Text(text,style: new TextStyle(fontSize: 16.0,color: new Color.fromRGBO(28, 28, 28, 1.00)),)),
          new Container(
            padding: const EdgeInsets.only(right: 8.0),
            width: 26.0,
            height: 18.0,
            child: new Image(image: new AssetImage('images/btn_next2_n.png')),
          )
        ],
      ),
      onTap: (){
        print('$tag 被点击');
        switch (tag){
          case 0:{
            MeMemberScene memberScene = new MeMemberScene();
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new NavigationBar(memberScene, '我的家人',
                  actions: <Widget>[
                    new GestureDetector(
                      onTap: (){
                        //添加家人
                        MeAddMemberScene addMemberScene = new MeAddMemberScene();
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new NavigationBar(addMemberScene, '我的家人',
                              actions: <Widget>[
                                new GestureDetector(
                                  onTap: (){
                                    setState((){
                                      ScanQRCode.showQRCodeReader((String value){
                                        showDialog(context: context, child: new AlertDialog(
                                          title: new Text('扫描结果', textAlign: TextAlign.center),
                                          content: new Text(value, textAlign: TextAlign.center),
                                          actions: <Widget>[
                                            new FlatButton(onPressed: (){
                                              Navigator.of(context).pop();
                                            }, child: new Text('确定'))
                                          ],
                                        ));
                                      });
                                    });
                                  },
                                  child: new Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: new SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: new Image(image: const AssetImage('images/btn_scan.png')),
                                    ),
                                  ),
                                )
                              ],
                            )
                        ));
                      },
                      child: new Container(
                        padding: const EdgeInsets.all(10.0),
                        child: new SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: new Image(image: const AssetImage('images/icon_addfamliy.png')),
                        ),
                      ),
                    )
                  ],
                ))
            );
          }
          break;
          case 1:{
            MeFamilyScene familyScene = new MeFamilyScene();
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new NavigationBar(familyScene, '我的家庭'))
            );
          }
          break;
          case 2:{        //我的设备
            DeviceScene deviceScene = new DeviceScene('我的设备',EnterType.typeMe);
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new NavigationBar(deviceScene, '设备',
                  actions: <Widget>[
                    new RightBtnItem('添加', (){
                      setState((){
                        ScanQRCode.showQRCodeReader((String value){
                          TextEditingController controller = new TextEditingController();
                          showDialog(context: context, child: new AlertDialog(
                            title: new Text('提示', textAlign: TextAlign.center,),
                            content: new TextField(
                              controller: controller,
                              textAlign: TextAlign.center,
                              decoration: new InputDecoration.collapsed(hintText: '请输入设备名称'),
                            ),
                            actions: <Widget>[
                              new FlatButton(onPressed: (){
                                if (controller.text == '' || controller.text == null) return;
                                deviceScene.sceneState.addDevice(controller.text, value);
                                Navigator.of(context).pop();
                              }, child: new Text('确定', style: new TextStyle(color: Colors.blue),)),
                              new FlatButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, child: new Text('取消', style: new TextStyle(color: Colors.red),))
                            ],
                          ));


                        });
                      });
                    })
                  ],
                ))
            );
          }
          break;
          case 3:{
            MeReceiveMessageScene messageScene = new MeReceiveMessageScene();
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new NavigationBar(messageScene, '消息'))
            );
          }
          break;
          case 4:{        //我的手机
            MeChangePhoneScene phoneScene = new MeChangePhoneScene();
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new NavigationBar(phoneScene, '我的手机'))
            );
          }
          break;
          case 5:{        //修改密码
            MeChangePwdScene pwdScene = new MeChangePwdScene();
            Navigator.of(context).push(new MaterialPageRoute(
                builder:(BuildContext context) => new NavigationBar(pwdScene, '修改密码')
            ));
          }
          break;
        }
      },
    );
  }

  Widget _createCell(String image,String text,int tag,double top){
    return new Padding(
      padding: new EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: new Container(
        color: Colors.white,
        child: _createItems(image, text, tag),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[

        new GestureDetector(
          onTap: (){
            print('ListTile被点击');
            MeInfoScene infoScene = new MeInfoScene();
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new NavigationBar(infoScene, '个人信息'))
            );
          },
          child: new Container(
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
                        child: new Text(likeName,style: new TextStyle(fontSize: 16.0),),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: new Text('陈亦度',style: new TextStyle(fontSize: 14.0)),
                      )
                    ],
                  ),
                ),
                new Expanded(child: new Container(
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.all(15.0),
                  child: new GestureDetector(
                    onTap: (){
                      print('二维码被点击');
                    },
                    child: new SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: new Image(image:  new AssetImage('images/btn_code.png')),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
        _createCell('icon_famliy.png', '我的家人', 0, 20.0),
        _createCell('icon_home.png', '我的家庭', 1, 1.0),
        _createCell('icon_watch.png', '我的设备', 2, 1.0),
        _createCell('icon_message.png', '消息接收', 3, 1.0),
        _createCell('icon_phone.png', '我的手机', 4, 1.0),
        _createCell('icon_lock.png', '修改密码', 5, 1.0),
        _createCell('icon_about_us.png', '关于我们', 6, 20.0),

      ],
    );
  }
}
