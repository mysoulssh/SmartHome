import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'me_family_room_info_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';
import 'models/area_info_model.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/deviceItems/models/house_device_info_model.dart';
import 'package:watchapp_flutter/meItems/me_add_family_room_scene.dart';


typedef FamilyRoomSceneCallback();
typedef FamilyAddRoomCallback(AreaInfoModel areaInfoModel);

class MeFamilyRoomScene extends StatefulWidget{

  MeFamilyRoomScene(this.infoModels,this.houseGuid,{this.addRoomCallback});

  List<AreaInfoModel> infoModels;
  String houseGuid;
  FamilyAddRoomCallback addRoomCallback;

  @override
  _MeFamilyRoomSceneState createState() => new _MeFamilyRoomSceneState();
}

class _MeFamilyRoomSceneState extends State<MeFamilyRoomScene>{

  List<Widget> cells = <Widget>[];

  @override
  void initState(){
    super.initState();

    for(int i=0;i<widget.infoModels.length;i++){
      var areaModel = widget.infoModels[i];

      httpManage.houseDeviceList(UserAccessModel.accessModel.accessToken, areaModel.houseGuid, 1, 20, (Map map){
        print('map = $map');
        List<HouseDeviceInfoModel> houseDeviceInfoModels = map['models'];

        cells.insert(0,createCells(areaModel.areaName, houseDeviceInfoModels.length.toString(),(){
          MeFamilyRoomInfoScene roomInfoScene = new MeFamilyRoomInfoScene(roomName: areaModel.areaName, houseGuid: widget.houseGuid, areaGuid: areaModel.areaGuid,);
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(roomInfoScene, areaModel.areaName,
                actions: <Widget>[
                  new RightBtnItem('保存', (){
                    Navigator.of(context).pop();
                  })
                ],
              )
          ));
        }));
        setState((){});
      }, (String errorMsg){

      },areaGuid: areaModel.areaGuid,);


    }

    cells.add(new Row(
      children: <Widget>[
        new Expanded(child: new Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.white,
          child: new Text('房间删除后，设备连接关系将自动移至默认房间',textAlign: TextAlign.center,),
        ))
      ],
    ),);

    cells.add(new Padding(padding: const EdgeInsets.only(top: 80.0),child: new ActionBtn(text: '添加房间',callback: (){
      MeAddFamilyRoomScene addFamilyRoomScene = new MeAddFamilyRoomScene();
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new NavigationBar(addFamilyRoomScene, '添加房间',
            actions: <Widget>[
              new RightBtnItem('保存', (){
                String roomName = addFamilyRoomScene.roomSceneState.roomController.text;
                httpManage.houseAreaAdd(UserAccessModel.accessModel.accessToken, widget.houseGuid, roomName, (Map map){
                  String areaGuid = map['areaGuid'];
                  if (widget.addRoomCallback != null){
                    widget.addRoomCallback(
                        new AreaInfoModel()
                          ..areaGuid  = areaGuid
                          ..houseGuid = widget.houseGuid
                          ..areaName  = roomName
                          ..deviceNum = '0'
                    );
                  }

                  cells.insert(cells.length - 2, createCells(roomName, '0',(){
                    MeFamilyRoomInfoScene roomInfoScene = new MeFamilyRoomInfoScene(roomName: roomName,);
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new NavigationBar(roomInfoScene, roomName,
                          actions: <Widget>[
                            new RightBtnItem('保存', (){
                              Navigator.of(context).pop();
                            })
                          ],
                        )
                    ));
                  }));

                  Navigator.of(context).pop();
                }, (String errorMsg){

                });

              })
            ],
          )
      ));
    },),));
  }

  Widget createCells(String roomName,String contactDevice,FamilyRoomSceneCallback callback){
    return new GestureDetector(
      onTap: (){
        callback();
      },
      child: new Container(
        padding: const EdgeInsets.only(bottom: 1.0),
        child: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: new Text(roomName,style: new TextStyle(fontSize: 16.0),),
              ),
              new Expanded(child: new Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.all(10.0),
                child: new Text('已连接'+contactDevice+'个设备',style: new TextStyle(fontSize: 15.0,color: Colors.grey),),
              )),
              new Container(
                padding: const EdgeInsets.only(right: 8.0),
                width: 26.0,
                height: 18.0,
                child: new Image(image: new AssetImage('images/btn_next2_n.png')),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new ListView.builder(itemBuilder: (_,int index) => cells[index],itemCount: cells.length,),
    );
  }
}