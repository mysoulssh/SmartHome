import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'me_add_family_room_scene.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';
import 'models/house_info_model.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';

typedef AddFamilySceneCallback();

class MeAddFamilyScene extends StatefulWidget{

  _MeAddFamilySceneState familySceneState = new _MeAddFamilySceneState();
  @override
  _MeAddFamilySceneState createState() => familySceneState;
}

class _MeAddFamilySceneState extends State<MeAddFamilyScene>{

  final TextEditingController roomController = new TextEditingController();

  List<String> roomsName = <String>['卧室','客厅','厨房','书房'];
  List<String> imagesName = <String>['icon_bedroom.png','icon_livingroom.png','icon_kitchen.png','icon_study.png'];

  List<Widget> grids = <Widget>[];

  @override
  void initState(){
    super.initState();

    for(int i=0;i<roomsName.length;i++){
      grids.add(createItems(roomsName[i], imagesName[i],null));
    }

    grids.add(createItems('添加房间', 'img_add.png',(){      //添加房间
      print('添加房间');
      MeAddFamilyRoomScene addFamilyRoomScene = new MeAddFamilyRoomScene();
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new NavigationBar(addFamilyRoomScene, '添加房间',
            actions: <Widget>[
              new RightBtnItem('保存', (){
                roomsName.add(addFamilyRoomScene.roomSceneState.roomController.text);
                grids.insert(grids.length-1, createItems(roomsName.last, imagesName.last, null));
                setState((){});
                Navigator.of(context).pop();
              })
            ],
          )
      ));
    }));
  }

  Widget createItems(String roomName,String imageName, AddFamilySceneCallback callback){
    return new GestureDetector(
      onTap: (){
        if (roomName == '添加房间'){
          callback();
        }
      },
      child: new Container(
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
            border: new Border(
              top: new BorderSide(color: new Color.fromRGBO(214, 214, 214, 1.0)),
              bottom: new BorderSide(color: new Color.fromRGBO(214, 214, 214, 1.0)),
              left: new BorderSide(color: new Color.fromRGBO(214, 214, 214, 1.0)),
              right: new BorderSide(color: new Color.fromRGBO(214, 214, 214, 1.0)),
            )
        ),
        child: roomName=='添加房间'?new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new SizedBox(
                width: 40.0,
                height: 40.0,
                child: new Image(image: new AssetImage('images/'+imageName)),
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Text(roomName),
            )
          ],
        ):new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new SizedBox(
                width: 100.0,
                height: 60.0,
                child: new Image(image: new AssetImage('images/'+imageName)),
              ),
            ),
            new Container(
              child: new Text(roomName),
            )
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
          new Container(
            color: new Color.fromRGBO(214, 214, 214, 1.0),
            padding: const EdgeInsets.only(bottom: 1.0),
            child: new Container(
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text('家庭名称',style: new TextStyle(fontSize: 16.0),),
                  ),
                  new Expanded(child: new Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new TextField(
                      controller: roomController,
                      onChanged: (String value){
                        if (value.length > 4){
                          ShowInfo.showInfo(context, content: '家庭名称最多4个字');
                          roomController.text = '';
                        }
                      },
                      textAlign: TextAlign.right,
                      decoration: new InputDecoration.collapsed(hintText: '请输入房间名'),
                    ),
                  ))
                ],
              ),
            ),
          ),
          new Container(
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Expanded(child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text('我的房间',textAlign: TextAlign.center,),
                ))
              ],
            ),
          ),
          new Expanded(child: new GridView.builder(
              primary: false,
              padding: const EdgeInsets.all(10.0),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) => grids[index],
              itemCount: grids.length,
          ),flex: 3,),
          new Expanded(child: new Padding(padding: const EdgeInsets.only(top: 20.0),child: new ActionBtn(text: '创建家庭',callback: (){
            if(roomController.text == null || roomController.text == ''){
              ShowInfo.showInfo(context,content: '房间名称不能为空');
            }else{
              httpManage.houseAdd(UserAccessModel.accessModel.accessToken, roomController.text, (Map map){
                var houseGuid = map['houseGuid'];
                for (var i = 0; i < grids.length - 1; ++i) {
                  var o = grids[i];
                  httpManage.houseAreaAdd(UserAccessModel.accessModel.accessToken, houseGuid, roomsName[i], (Map map){
                    var areaGuid = map['areaGuid'];
                    print('$i = $areaGuid');
                  }, (String errorMsg){
                    print('houseAreaAdd = $errorMsg');
                  });
                }
                HouseInfoModel infoModel = new HouseInfoModel();
                infoModel.houseGuid = houseGuid;
                infoModel.houseName = roomController.text;
                infoModel.addrName = roomController.text;
                infoModel.isConfirm = 1;
                infoModel.role = 1;
                infoModel.userId = UserAccessModel.accessModel.userId;
                Navigator.of(context).pop({'houseInfoModel':infoModel});
              }, (String errorMsg){
                print('houseAdd = $errorMsg');
              });
            }
          },),))
        ],
      ),
    );
  }
}