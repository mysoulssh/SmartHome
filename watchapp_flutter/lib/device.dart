import 'package:flutter/material.dart';
import 'deviceItems/device_scene.dart';
import 'deviceItems/device_add_scene.dart';
import 'main_navbar.dart';
import 'Tools/right_btn.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'meItems/models/area_info_model.dart';
import 'deviceItems/device_area_scene.dart';
import 'deviceItems/device_class_scene.dart';
import 'deviceItems/models/house_device_info_model.dart';
import 'deviceItems/models/scene_info_model.dart';
import 'grpc_src/dart_out/iot_comm/iot_comm.pb.dart';
import 'grpc_src/dart_out/DeviceStatusGet/DeviceStatusGet.pb.dart';
import 'package:watchapp_flutter/deviceItems/models/status_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';

enum SceneType{
  SceneRoom,    //房间
  SceneClass,   //类型
}

class DeviceItem extends StatefulWidget{

  DeviceItem({this.currentHouseGuid});      //问题，待解决

  String currentHouseGuid;

  @override
  _DeviceItemState createState() => new _DeviceItemState();
}

class _DeviceItemState extends State<DeviceItem> with SingleTickerProviderStateMixin{
  List<Scene> scene = <Scene>[
    new Scene('images/icon_home2_n.png', 'images/icon_home2_s.png', '回家','0a0a79f667629ea6cecd8dc225ffefb0',0),
    new Scene('images/icon_outhome_n.png', 'images/icon_outhome_s.png', '离家','b2f2363f56da29b458ce80e64db856c0',0),
    new Scene('images/icon_wakeup_n.png', 'images/icon_wakeup_s.png', '起床','abff0f9c08f344ec9a77d992829b7922',0),
    new Scene('images/icon_sleep_n.png', 'images/icon_sleep_s.png', '睡觉','94013c4ed339c072d869dddc2577105d',0),
  ];

  List<Widget> sceneList = <Widget>[];
  
  SceneType sceneType;
  bool roomSwitch       = false;
  bool livingRoomSwitch = false;
  bool kitchenSwitch    = false;
  bool studyRoom        = false;

  bool centerControlSwitch = false;
  bool cameraSwitch        = false;
  bool lightSwitch         = false;
  bool decSwitch           = false;
  bool bellSwitch          = false;
  bool tvSwitch            = false;

  List<Widget> gridsRoom = <SwitchRoomClass>[];
  List<Widget> gridsClass = <Widget>[];

  List<HouseDeviceInfoModel> cameraList         = <HouseDeviceInfoModel>[];
  List<HouseDeviceInfoModel> lightList          = <HouseDeviceInfoModel>[];
  List<HouseDeviceInfoModel> dectectorList      = <HouseDeviceInfoModel>[];
  List<HouseDeviceInfoModel> bellList           = <HouseDeviceInfoModel>[];
  List<HouseDeviceInfoModel> tvList             = <HouseDeviceInfoModel>[];
  List<HouseDeviceInfoModel> centerControlList  = <HouseDeviceInfoModel>[];

  @override
  void initState(){
    super.initState();
    sceneType = SceneType.SceneRoom;

    for (var i=0;i < scene.length; i++){
      Scene tmp = scene[i];
      sceneList.add(_createSceneBtn(tmp,null));
    }

    loadScene(widget.currentHouseGuid);
    loadRoom(widget.currentHouseGuid);
    loadDeviceList(widget.currentHouseGuid);
  }

  @override
  void dispose(){
    super.dispose();
  }

  void reload(){
    setState((){});
  }

  void loadScene(String houseGuid){
    widget.currentHouseGuid = houseGuid;
    httpManage.sceneList(UserAccessModel.accessModel.accessToken, houseGuid, 1, 10, (Map map){
      print('$map');

      sceneList.removeRange(0, sceneList.length);

      List<Scene> tmpSceneList = <Scene>[];

      List<SceneInfoModel> sceneModels = map['models'];
      for (var v in sceneModels){

        if (v.sceneId == '0a0a79f667629ea6cecd8dc225ffefb0'){       //回家
          tmpSceneList.add(new Scene('images/icon_home2_n.png', 'images/icon_home2_s.png', '回家','0a0a79f667629ea6cecd8dc225ffefb0',v.enable),);
        }else if (v.sceneId == 'b2f2363f56da29b458ce80e64db856c0'){ //离家
          tmpSceneList.add(new Scene('images/icon_outhome_n.png', 'images/icon_outhome_s.png', '离家','b2f2363f56da29b458ce80e64db856c0',v.enable));
        }else if (v.sceneId == 'abff0f9c08f344ec9a77d992829b7922'){ //起床
          tmpSceneList.add(new Scene('images/icon_wakeup_n.png', 'images/icon_wakeup_s.png', '起床','abff0f9c08f344ec9a77d992829b7922',v.enable));
        }else if (v.sceneId == '94013c4ed339c072d869dddc2577105d'){ //睡觉
          tmpSceneList.add(new Scene('images/icon_sleep_n.png', 'images/icon_sleep_s.png', '睡觉','94013c4ed339c072d869dddc2577105d',v.enable));
        }else{
          tmpSceneList.add(new Scene('images/testIcon.jpg','images/icon_home2_s.png',v.sceneName,v.sceneId,v.enable));
        }

      }
      
      for (var v in scene){
        bool isSame = false;
        for (var tmp in tmpSceneList){
          if (v.sceneId == tmp.sceneId){
            isSame = true;
            break;
          }
        }

        if (!isSame){
          tmpSceneList.insert(0, v);
        }
      }

      for (var v = 0; v< tmpSceneList.length; v++){
        Scene sceneInfo = tmpSceneList[v];
        SceneInfoModel sceneInfoModel = new SceneInfoModel()
          ..houseGuid = widget.currentHouseGuid
          ..sceneName = sceneInfo.text
          ..sceneId   = sceneInfo.sceneId
          ..sceneType = 1
          ..enable    = sceneInfo.enable
          ..cmd       = new IOTCMD();

        for (var tmp in sceneModels){
          if (tmp.sceneId == sceneInfo.sceneId){
            sceneInfoModel = tmp;
            break;
          }
        }

        sceneList.add(_createSceneBtn(sceneInfo, sceneInfoModel));
      }

      scene = tmpSceneList;

      setState((){});
    }, (String errorMsg){

    });
  }

  void loadRoom(String houseGuid){
    httpManage.houseAreaList(UserAccessModel.accessModel.accessToken, houseGuid, (Map map){
      print('loadRoom = $map');
      gridsRoom.removeRange(0, gridsRoom.length);
      List<AreaInfoModel> models = map['areas'];
      for (var v in models){
        v.isSwitchOn = false;

        httpManage.houseDeviceList(
            UserAccessModel.accessModel.accessToken,
            widget.currentHouseGuid,
            1,
            20,
            (Map map){

              List<HouseDeviceInfoModel> models = map['models'];
              List<QueryInfo> tmpQuery = <QueryInfo>[];

              for (var v in models){
                QueryInfo info = new QueryInfo()
                ..deviceId    = v.deviceId
                ..subDeviceId = v.subDeviceId;
                tmpQuery.add(info);
              }

              if (tmpQuery.length > 0){
                httpManage.deviceStatusGet(UserAccessModel.accessModel.accessToken, tmpQuery, (Map map){
                  List<StatusInfoModel> models = map['models'];
                  List<bool> tmpStatus = <bool>[];
                  List<bool> openStatus = <bool>[];

                  for (var statusV in models){
                    if(statusV.subDeviceId != ''){
                      tmpStatus.add(TypeJudgment.judgmentSwitch(statusV, statusV.subDeviceId.substring(4,8)));
                    }else{
                      tmpStatus.add(false);
                    }
                  }

                  for (var v in tmpStatus){
                    if (v){
                      openStatus.add(v);
                    }
                  }

                  int totalNum = tmpStatus.length;
                  int openNum  = openStatus.length;

                  if (totalNum == openNum && totalNum != 0){
                    v.isSwitchOn = true;
                    gridsRoom.add(new SwitchRoomClass(
                      typeImage: TypeJudgment.judgmentAreaImage(v.areaName),
                      typeText: v.areaName,
                      isSwitchOn: v.isSwitchOn,
                      numText: '$openNum/$totalNum',
                      isNewImage: false,
                      areaGuid: v.areaGuid,
                      currentHouseGuid: widget.currentHouseGuid,
                    ));
                  }else{
                    v.isSwitchOn = false;
                    gridsRoom.add(new SwitchRoomClass(
                      typeImage: TypeJudgment.judgmentAreaImage(v.areaName),
                      typeText: v.areaName,
                      isSwitchOn: v.isSwitchOn,
                      numText: '$openNum/$totalNum',
                      isNewImage: false,
                      areaGuid: v.areaGuid,
                      currentHouseGuid: widget.currentHouseGuid,
                    ));
                  }

                  reload();
                }, (String errorMsg){

                });
              }else{
                gridsRoom.add(new SwitchRoomClass(
                  typeImage: TypeJudgment.judgmentAreaImage(v.areaName),
                  typeText: v.areaName,
                  isSwitchOn: false,
                  numText: '0/0',
                  isNewImage: false,
                  areaGuid: v.areaGuid,
                  currentHouseGuid: widget.currentHouseGuid,
                ));
                reload();
              }

            }, (String errorMsg){},
            areaGuid: v.areaGuid);

      }
    }, (String errorMsg){

    });
  }

  void loadDeviceList(String houseGuid){
    httpManage.houseDeviceList(UserAccessModel.accessModel.accessToken, houseGuid, 1, 20, (Map map){
      List<HouseDeviceInfoModel> infoModels = map['models'];
      print('$infoModels');

      for (var v in infoModels){
        switch (v.prodtType.first){
          case 'YHUB':      //中控
          centerControlList.add(v);
            break;
          case 'CHDL':      //门锁

            break;
          case 'CHSW':      //开关

            break;
          case 'CHLL':      //rgb灯
            lightList.add(v);
            break;
          case 'SHHI':      //体感

            break;
          case 'SHLI':      //光照度

            break;
          case 'SHMC':      //门磁

            break;
          case 'BHDB':      //门铃
            bellList.add(v);
            break;
          case 'BSOS':      //SOS

            break;
          case 'CIRC':      //红外遥控

            break;
          case 'CAIR':      //空调

            break;
          case 'CHCL':      //窗帘

            break;
          case 'SHYG':      //烟感

            break;
          case 'SHWG':case 'SHSG':      //温度传感器  湿度传感器
            dectectorList.add(v);
            break;
          case 'CHCZ':      //插座

            break;
          case 'YSBS':      //边界服务器

            break;
          case 'BHSC':      //情景按钮

            break;
          case 'BHCC':      //窗帘按钮

            break;
          case 'BHSW':      //开关按钮

            break;
          case 'YSWO':      //智能手表

            break;
        }
      }

      String cameraNum  = cameraList.length.toString();
      String lightNum   = lightList.length.toString();
      String decNum     = dectectorList.length.toString();
      String bellNum    = bellList.length.toString();
      String tvNum      = tvList.length.toString();
      String centerNum  = centerControlList.length.toString();

      gridsClass.add(new SwitchRoomClass(
        typeImage: 'images/icon_canmera.png',
        typeText: '摄像头',
        isSwitchOn: false,
        numText: '$cameraNum/$cameraNum',
        isNewImage: true,
        areaGuid: '',
        deviceList: cameraList,
        currentHouseGuid: widget.currentHouseGuid,
      ));

      gridsClass.add(new SwitchRoomClass(
        typeImage: 'images/icon_light.png',
        typeText: '灯',
        isSwitchOn: false,
        numText: '$lightNum/$lightNum',
        isNewImage: true,
        areaGuid: '',
        deviceList: lightList,
        currentHouseGuid: widget.currentHouseGuid,
      ));

      gridsClass.add(new SwitchRoomClass(
        typeImage: 'images/icon_inductor.png',
        typeText: '感应器',
        isSwitchOn: false,
        numText: '$decNum/$decNum',
        isNewImage: true,
        areaGuid: '',
        deviceList: dectectorList,
        currentHouseGuid: widget.currentHouseGuid,
      ));

      gridsClass.add(new SwitchRoomClass(
        typeImage: 'images/icon_doorbell.png',
        typeText: '门铃',
        isSwitchOn: false,
        numText: '$bellNum/$bellNum',
        isNewImage: true,
        areaGuid: '',
        deviceList: bellList,
        currentHouseGuid: widget.currentHouseGuid,
      ));

      gridsClass.add(new SwitchRoomClass(
        typeImage: 'images/icon_livingroom.png',
        typeText: '电视',
        isSwitchOn: false,
        numText: '$tvNum/$tvNum',
        isNewImage: false,
        areaGuid: '',
        deviceList: tvList,
        currentHouseGuid: widget.currentHouseGuid,
      ));

      gridsClass.add(new SwitchRoomClass(
        typeImage: 'images/icon_centercontrol.png',
        typeText: '中控',
        isSwitchOn: false,
        numText: '$centerNum/$centerNum',
        isNewImage: true,
        areaGuid: '',
        deviceList: centerControlList,
        currentHouseGuid: widget.currentHouseGuid,
      ));

      setState((){});

    }, (String errorMsg){

    });
  }


  void _resetSelectStatu(){

    for (var v in scene){
      v.enable = 0;
    }

  }

  Widget _createSceneBtn(Scene sceneInfo, SceneInfoModel sceneInfoModel){
    return new Container(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: new Column(
              children: <Widget>[
                new GestureDetector(
                  onTap: (){
                    httpManage.sceneActive(UserAccessModel.accessModel.accessToken, widget.currentHouseGuid, sceneInfo.sceneId, (Map map){
                      _resetSelectStatu();
                      sceneInfo.enable = 1;
                      sceneList.removeRange(0, sceneList.length);
                      for (var v in scene){
                        sceneList.add(_createSceneBtn(v, sceneInfoModel));
                      }
                      reload();
                    }, (String errorMsg){
                      if (sceneInfo.sceneId == '0a0a79f667629ea6cecd8dc225ffefb0' ||  //回家
                          sceneInfo.sceneId == 'b2f2363f56da29b458ce80e64db856c0' ||  //离家
                          sceneInfo.sceneId == 'abff0f9c08f344ec9a77d992829b7922' ||  //起床
                          sceneInfo.sceneId == '94013c4ed339c072d869dddc2577105d' ){    //睡觉
                        showDialog(context: context, child: new AlertDialog(
                          title: new Text('提示'),
                          content: new Text('还未对该场景进行编辑，是否进入编辑?'),
                          actions: <Widget>[
                            new FlatButton(onPressed: (){
                              Navigator.of(context).pop();

                              DeviceAddScene addScene = new DeviceAddScene(false,sceneTitle: sceneInfoModel.sceneName, sceneId: sceneInfoModel.sceneId,);
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) => new NavigationBar(addScene, '编辑场景',
                                    actions: <Widget>[
                                      //添加场景界面保存按钮
                                      new RightBtnItem('保存', (){
                                        print('保存');
                                        if(addScene.cmd.length > 0){
                                          IOTCMD iotCmd = new IOTCMD();
                                          for (var v in addScene.cmd){
                                            iotCmd.cmd.add(v);
                                          }
                                          //添加场景
                                          httpManage.sceneAdd(
                                              UserAccessModel.accessModel.accessToken,
                                              widget.currentHouseGuid,
                                              addScene.sceneState.editController.text,
                                              addScene.sceneId,
                                              iotCmd,
                                                  (Map map){
                                                print('添加场景成功');
                                                Navigator.of(context).pop();
                                              },
                                                  (String errorMsg){
                                                print('添加场景错误信息：$errorMsg');
                                              });
                                        }
                                      })
                                    ],
                                  )
                              ));

                            }, child: new Text('确定')),
                            new FlatButton(onPressed: (){
                              Navigator.of(context).pop();
                            }, child: new Text('取消')),
                          ],
                        ));
                      }
                    });

                  },
                  child: new SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: new Image(image: new AssetImage(sceneInfo.enable==1?sceneInfo.iconS:sceneInfo.iconN)),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new GestureDetector(
                    onTap: (){
                      DeviceAddScene editScene = new DeviceAddScene(true,sceneInfoModel: sceneInfoModel,);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context){
                            return new NavigationBar(editScene, '编辑场景',
                              actions: <Widget>[
                                new RightBtnItem('保存', (){
                                  print('保存');
                                  httpManage.sceneEdit(
                                      UserAccessModel.accessModel.accessToken,
                                      editScene.sceneInfoModel.sceneName,
                                      editScene.sceneInfoModel.sceneId,
                                      editScene.sceneInfoModel.cmd,
                                          (Map map){
                                        print('编辑场景成功');
                                        Navigator.of(context).pop();
                                      }, (String errorMsg){

                                  });
                                })
                              ],
                            );
                          })
                      );
                    },
                    child: new Text(sceneInfo.text),
                  ),
                ),
              ],
            ),
    );
  }


  Widget _createSceneRoom(){
    return new Expanded(child: new Container(
      child: new GridView.builder(
        primary: false,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) => gridsRoom[index],
        itemCount: gridsRoom.length,),
    ));
  }

  Widget _createSceneClass1(){
    return new Expanded(child: new Container(
      child: new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) => gridsClass[index],
        itemCount: gridsClass.length,
      ),
    ));
  }

  
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text('我的场景'),
              ],
            ),
          ),
          new SizedBox(
            width: 500.0,
            height: 100.0,
            child: new Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: new Container(
                  color: Colors.white,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => sceneList[index],
                    itemCount: sceneList.length,
                  ),

                )),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(child: new Padding(padding: const EdgeInsets.only(right: 0.5),
                    child: new GestureDetector(
                      onTap: (){
                        print('房间');
                        setState((){
                          sceneType = SceneType.SceneRoom;
                        });
                      },
                      child: new Container(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: new Container(
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                                child: new Text('房间',textAlign: TextAlign.center,style: new TextStyle(
                                    color: sceneType == SceneType.SceneRoom?Colors.red:Colors.grey
                                ),),
                              ),
                              new Container(
                                color: sceneType == SceneType.SceneRoom?const Color.fromRGBO(254, 189, 148, 1.0):Colors.white,
                                child: new SizedBox(
                                  width: 45.0,
                                  height: 5.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                )),
                new Expanded(child: new Padding(padding: const EdgeInsets.only(left: 0.5),
                    child: new GestureDetector(
                      onTap: (){
                        print('类型');
                        setState((){
                          sceneType = SceneType.SceneClass;
                        });
                      },
                      child: new Container(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: new Container(
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                                child: new Text('类型',textAlign: TextAlign.center,style: new TextStyle(
                                    color: sceneType == SceneType.SceneClass?Colors.red:Colors.grey
                                ),),
                              ),
                              new Container(
                                color: sceneType == SceneType.SceneClass?const Color.fromRGBO(254, 189, 148, 1.0):Colors.white,
                                child: new SizedBox(
                                  width: 45.0,
                                  height: 5.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                )),
              ],
            ),
          ),
          sceneType == SceneType.SceneRoom?_createSceneRoom():_createSceneClass1()
        ],
      )
    );
  }
}

class Scene{
  Scene(
      this.iconN,
      this.iconS,
      this.text,
      this.sceneId,
      this.enable,
      );

  final String iconN;
  final String iconS;
  //场景名
  final String text;
  //场景id
  final String sceneId;
  //是否开启
  int enable;
}

class SwitchRoomClass extends StatefulWidget{

  SwitchRoomClass({
    this.typeImage,
    this.typeText,
    this.isSwitchOn : false,
    this.numText,
    this.isNewImage : false,
    this.areaGuid,
    this.currentHouseGuid,
    this.deviceList,
  });

  String typeImage;
  String typeText;
  bool isSwitchOn;
  String numText;
  bool isNewImage;
  String areaGuid;
  String currentHouseGuid;
  List<HouseDeviceInfoModel> deviceList;

  @override
  _SwitchRoomClassState createState() => new _SwitchRoomClassState();

}

class _SwitchRoomClassState extends State<SwitchRoomClass>{
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new GestureDetector(
        onTap: (){
          if (widget.areaGuid == ''){

            DeviceClassScene classScene;

            if (widget.typeText == '摄像头'){
              classScene = new DeviceClassScene(widget.deviceList,false);
            }else if (widget.typeText == '灯'){
              classScene = new DeviceClassScene(widget.deviceList,false);
            }else if (widget.typeText == '感应器'){
              classScene = new DeviceClassScene(widget.deviceList,false);
            }else if (widget.typeText == '门铃'){
              classScene = new DeviceClassScene(widget.deviceList,false);
            }else if (widget.typeText == '电视'){
              classScene = new DeviceClassScene(widget.deviceList,false);
            }else if (widget.typeText == '中控'){
              classScene = new DeviceClassScene(widget.deviceList,true);
            }

            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
              return new NavigationBar(classScene, widget.typeText,
//              actions: <Widget>[
//                new RightBtnItem('添加', (){
//                  print('添加');
//                  DeviceScene deviceScene = new DeviceScene('添加设备',EnterType.typeDevice,callback: (String id, String subId){
//                    print('id = $id     subid = $subId');
//                  },);
//
//                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
//                    return new NavigationBar(deviceScene, '添加设备');
//                  }));
//                })
//              ],
              );
            }));
          }else{
            DeviceAreaScene deviceAreaScene = new DeviceAreaScene(widget.typeText, widget.currentHouseGuid, widget.areaGuid);
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
              return new NavigationBar(deviceAreaScene, widget.typeText,
                actions: <Widget>[
                  new RightBtnItem('添加', (){
                    print('添加');
                    DeviceScene deviceScene = new DeviceScene('添加设备',EnterType.typeDevice,callback: (String id, String subId){
                      deviceAreaScene.sceneState.addAreaDevice(id, subId);
                    },);
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                      return new NavigationBar(deviceScene, '添加设备');
                    }));
                  })
                ],
              );
            }));
          }
        },
        child: new Container(
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              new Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  new Container(
                    child: new SizedBox(
                      width: 150.0,
                      height: 70.0,
                      child: widget.isNewImage?new Container(
                        padding: const EdgeInsets.all(15.0),
                        child: new Image(image: new AssetImage(widget.typeImage)),
                      ):new Container(
                        child: new Image(image: new AssetImage(widget.typeImage)),
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: new Text(widget.typeText,style: new TextStyle(
                        color: new Color.fromRGBO(232, 153, 110, 1.0),
                        fontSize: 16.0
                    ),),
                  ),
                ],
              ),
              new GestureDetector(
                onTap: (){
                  widget.isSwitchOn = !widget.isSwitchOn;
                  setState((){});
                },
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.fromLTRB(4.0,15.0,0.0,0.0),
                      child: new SizedBox(
                        width: 80.0,
                        height: 30.0,
                        child: new Image(image: new AssetImage(widget.isSwitchOn?'images/btn_switch_bg2.png':'images/btn_switch_bg1.png')),
                      ),
                    ),
                    new Container(
                      padding: widget.isSwitchOn?const EdgeInsets.fromLTRB(50.0,10.0,0.0,0.0):const EdgeInsets.only(top: 10.0),
                      child: new SizedBox(
                        width: 37.0,
                        height: 40.0,
                        child: new Image(image: new AssetImage('images/btn_switch.png')),
                      ),
                    ),
                    new Container(
                      padding: widget.isSwitchOn?const EdgeInsets.fromLTRB(15.0, 22.0, 0.0, 0.0):const EdgeInsets.fromLTRB(45.0, 22.0, 0.0, 0.0),
                      child: new Text(
                        widget.numText,
                        style: new TextStyle(
                            fontSize: 15.5,
                            color: widget.isSwitchOn?const Color.fromRGBO(249, 199, 170, 1.0):const Color.fromRGBO(232, 153, 110, 1.0)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}