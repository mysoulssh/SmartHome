import 'package:flutter/material.dart';
import 'me_member_detaiinfo_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/deviceItems/device_scene.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';
import 'package:watchapp_flutter/Tools/scan_qr_code.dart';
import 'me_changephone_scene.dart';
import 'me_identify_scene.dart';

class MeMemberInfoScene extends StatefulWidget{

  MeMemberInfoScene({this.likeName,this.realName});

  final String likeName;
  final String realName;

  @override
  _MeMemberInfoSceneState createState() => new _MeMemberInfoSceneState();
}

class _MeMemberInfoSceneState extends State<MeMemberInfoScene>{

  Widget createCells(String imageName, String text, String content,int index){
    return new GestureDetector(
      onTap: (){
        if(index == 0){
          MeMemberDetailInfoScene detailInfoScene = new MeMemberDetailInfoScene();
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext contex) => new NavigationBar(detailInfoScene, widget.likeName)
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
          MeChangePhoneScene phoneScene = new MeChangePhoneScene();
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(phoneScene, '修改手机号'))
          );
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
    return new Container(
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
                          child: new Text(widget.likeName,style: new TextStyle(fontSize: 16.0),),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: new Text(widget.realName,style: new TextStyle(fontSize: 14.0)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          createCells('icon_famliy.png', '个人信息','',0),
          createCells('icon_watch.png', '设备管理','',1),
          createCells('icon_phone.png', '手机号','12345678901',2),
          createCells('icon_id.png', '身份证号','未认证',3),
        ],
      ),
    );
  }
}