import 'package:flutter/material.dart';
import 'me_member_detaiinfo_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/deviceItems/device_scene.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';
import 'package:watchapp_flutter/Tools/scan_qr_code.dart';
import 'me_identify_scene.dart';
import 'models/user_info_model.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserFRSList/UserFRSList.pb.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';

class MeMemberInfoScene extends StatefulWidget{

  MeMemberInfoScene({this.userInfoModel, this.frsInfo, this.statusType});

  final UserInfoModel userInfoModel;
  final FRSInfo frsInfo;
  final int statusType;   //1、正常  2、自己添加对方未同意  3、对方添加自己未同意  4、被拒绝

  @override
  _MeMemberInfoSceneState createState() => new _MeMemberInfoSceneState();
}

class _MeMemberInfoSceneState extends State<MeMemberInfoScene>{

  Widget createCells(String imageName, String text, String content,int index){
    return new GestureDetector(
      onTap: (){
        if(index == 0){
          MeMemberDetailInfoScene detailInfoScene = new MeMemberDetailInfoScene(userInfoModel: widget.userInfoModel, frsInfo: widget.frsInfo,);
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext contex) => new NavigationBar(detailInfoScene, widget.userInfoModel.like_name)
          ));
        }else if (index == 1){
          DeviceScene deviceScene = new DeviceScene('设备管理',EnterType.typeMe);
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(deviceScene, '设备',
                actions: <Widget>[
                  new RightBtnItem('添加', (){
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
                  })
                ],
              ))
          );
        }else if (index == 2){
          String phoneNum = widget.userInfoModel.user_name;

          showDialog(context: context, child: new AlertDialog(
            title: new Text('提示'),
            content: new Text('手机号码:$phoneNum'),
            actions: <Widget>[
              new FlatButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: new Text('确定')),
            ],
          ));

        }else{
          MeIdentifyScene identifyScene = new MeIdentifyScene();
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new NavigationBar(identifyScene, '身份认证')));
        }
      },
      child: new Container(
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
                    new Expanded(
                        child: new Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 8.0),
                          child: new Text(
                            content,
                            style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey),
                          ),
                        )
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
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        new Expanded(child: new Container(
          child: new ListView(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 20.0),
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
                              child: new Text(widget.userInfoModel.like_name,style: new TextStyle(fontSize: 16.0),),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: new Text(widget.userInfoModel.user_name,style: new TextStyle(fontSize: 14.0)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              createCells('icon_famliy.png', '个人信息','',0),
              widget.statusType != 1?new Container():createCells('icon_watch.png', '设备管理','',1),
              widget.statusType != 1?new Container():createCells('icon_phone.png', '手机号', widget.userInfoModel.user_name, 2),
//              widget.statusType != 1?new Container():createCells('icon_id.png', '身份证号',widget.userInfoModel.card_id == ''?'未认证':widget.userInfoModel.card_id,3),
            ],
          ),
        )),
        widget.statusType == 1?new Container(
          padding: const EdgeInsets.all(30.0),
          child: new ActionBtn(text: '删除好友', callback: (){
            print('删除好友');
            httpManage.userFRSDel(UserAccessModel.accessModel.accessToken, widget.userInfoModel.user_name, (Map map){
              print('删除好友成功');
              Navigator.of(context).pop(true);
            }, (String errorMsg){

            });
          },),
        ):new Container(),
        widget.statusType == 3?new Container(
          padding: const EdgeInsets.all(5.0),
          child: new ActionBtn(text: '同意', callback: (){
            print('同意');
            httpManage.userFRSConfirm(
                UserAccessModel.accessModel.accessToken,
                widget.userInfoModel.user_name,
                2, (Map map){
              Navigator.of(context).pop(true);

              showDialog(context: context, child: new AlertDialog(
                content: new Text('添加好友成功'),
              ));

            }, (String errorMsg){

            });
          },),
        ):new Container(),
        widget.statusType == 3?new Container(
          padding: const EdgeInsets.all(15.0),
          child: new ActionBtn(text: '拒绝', callback: (){
            print('拒绝');
            httpManage.userFRSConfirm(
                UserAccessModel.accessModel.accessToken,
                widget.userInfoModel.user_name,
                3, (Map map){

                  Navigator.of(context).pop(true);

              showDialog(context: context, child: new AlertDialog(
                content: new Text('已拒绝好友'),
              ));

            }, (String errorMsg){

            });
          },),
        ):new Container(),
      ],
    );
  }
}