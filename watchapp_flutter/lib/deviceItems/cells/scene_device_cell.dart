import 'package:flutter/material.dart';
import 'package:watchapp_flutter/deviceItems/ai_ligth_scene.dart';
import 'package:watchapp_flutter/deviceItems/ai_window_scene.dart';
import 'package:watchapp_flutter/deviceItems/ai_switch_scene.dart';
import 'package:watchapp_flutter/deviceItems/ai_setting_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';
import 'package:watchapp_flutter/deviceItems/models/status_info_model.dart';
import 'package:watchapp_flutter/deviceItems/models/device_detail_info_model.dart';
import 'package:watchapp_flutter/deviceItems/models/device_info_model.dart';
import 'package:watchapp_flutter/deviceItems/models/house_device_info_model.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';

typedef void longPressCallback(String deviceId, String subId);
typedef void addDeviceCallback(String deviceId);
typedef void centerControlCallback();

class DeviceSceneCell extends StatefulWidget{

  DeviceSceneCell({
    this.houseDeviceInfoModel,
    this.deviceInfoModel,
    this.deviceDetailInfoModel,
    this.statusInfoModel,

    this.image,
    this.isTurnOn,
    this.isNeedSwitch,
    this.callback,
    this.deviceCallback,
    this.controlCallback
  });
  //设备图片
  final Image image;
  //设备是否开启
  bool isTurnOn;

  final longPressCallback callback;
  final addDeviceCallback deviceCallback;
  final bool isNeedSwitch;
  final centerControlCallback controlCallback;

  HouseDeviceInfoModel  houseDeviceInfoModel;
  DeviceDetailInfoModel deviceDetailInfoModel;
  DeviceInfoModel       deviceInfoModel;
  StatusInfoModel       statusInfoModel;



  @override
  _DeviceSceneCellState createState() => new _DeviceSceneCellState();
}

class _DeviceSceneCellState extends State<DeviceSceneCell>{

  @override
  void initState(){
    super.initState();

  }

  void pushToSettingScene(DeviceType type,String name){
    AiSettingScene settingScene = new AiSettingScene(type,name);
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new NavigationBar(settingScene, name)
    ));
  }

  @override
  Widget build(BuildContext context){
    String _name;
    if (widget.deviceInfoModel == null){
      _name = widget.houseDeviceInfoModel.deviceName;
    }else{
      _name = widget.deviceInfoModel.deviceName;
    }

    return new GestureDetector(
      onTap: (){

        if(widget.controlCallback != null){
          widget.controlCallback();
          return;
        }

        if(widget.deviceCallback != null){
          widget.deviceCallback(widget.deviceDetailInfoModel.deviceId);
          return;
        }
        print('$_name');
        if(_name == 'RGB灯'){
          AiLightScene lightSecen = new AiLightScene(
            isSwitchOn: widget.statusInfoModel.argInt32.length<3?false:(widget.statusInfoModel.argInt32[2]==1?true:false),
            deviceId: widget.statusInfoModel.deviceId,
            subDeviceId: widget.statusInfoModel.subDeviceId,
          );
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(lightSecen, _name,
                actions: <Widget>[
                  new RightBtnItem('设置', (){
                    pushToSettingScene(DeviceType.lightType, _name);
                  })
                ]
              ))
          );
        }else if(_name == '窗帘'){
          AiWindowScene windowScene = new AiWindowScene();
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(windowScene, _name,
                  actions: <Widget>[
                    new RightBtnItem('设置', (){
                      pushToSettingScene(DeviceType.windowType, _name);
                    })
                  ]
              ))
          );
        }else if (_name == '开关'){
          AiSwitchScene switchScene = new AiSwitchScene(
            isSwitchOn: false,
            deviceId: widget.statusInfoModel.deviceId,
            subDeviceId: widget.statusInfoModel.subDeviceId,
          );
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(switchScene, _name,
                  actions: <Widget>[
                    new RightBtnItem('设置', (){
                      pushToSettingScene(DeviceType.switchType, _name);
                    })
                  ]
              )),
          );
        }
      },
      onLongPress: (){
        if(widget.callback != null){
          widget.callback(widget.deviceDetailInfoModel.deviceId,widget.statusInfoModel.subDeviceId);
        }
      },
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(8.0),
              child: new SizedBox(
                width: 64.0,
                height: 64.0,
                child: widget.image,
              ),
            ),
            new Expanded(child: new Container(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 1.0),
              color: new Color.fromRGBO(214, 214, 214, 1.0),
              child: new Container(
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    new Expanded(child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(_name),
                        new Text(widget.statusInfoModel.online==1?'设备在线':'设备离线',style: new TextStyle(color: widget.statusInfoModel.online==1?Colors.grey:Colors.red),),
                      ],
                    )),
                    widget.isNeedSwitch?new Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new GestureDetector(
                        onTap: (){
                          widget.isTurnOn = !widget.isTurnOn;
                          
                          IOTCMD iotcmd = new IOTCMD();
                          iotcmd.cmd.add(new SIOTCMD()
                            ..deviceId    = widget.statusInfoModel.deviceId
                            ..subDeviceId = widget.statusInfoModel.subDeviceId
                            ..cmdid       = 201
                            ..cmdType     = 1
                            ..argInt32.add(widget.isTurnOn?1:0)
                          );

                          httpManage.deviceRunTOTCmd(UserAccessModel.accessModel.accessToken, iotcmd, (Map map){
                            print('开关按钮设置成功');
                            setState((){});
                          }, (String errorMsg){

                          });
                          

                        },
                        child: new Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            new SizedBox(
                                width: 80.0,
                                height: 30.0,
                                child: new Image(image: new AssetImage(widget.isTurnOn?'images/btn_switch_bg2.png':'images/btn_switch_bg1.png'))
                            ),
                            new Container(
                              padding: widget.isTurnOn?const EdgeInsets.only(left: 50.0):const EdgeInsets.only(right: 50.0),
                              child: new SizedBox(
                                width: 37.0,
                                height: 40.0,
                                child: new Image(image: new AssetImage('images/btn_switch.png')),
                              ),
                            )
                          ],
                        ),
                      ),
                    ):new Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new GestureDetector(
                        onTap: (){
                          widget.isTurnOn = !widget.isTurnOn;
                          setState((){});
                        },
                        child: new Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            new SizedBox(
                                width: 80.0,
                                height: 30.0,
                            ),
                            new Container(
                              padding: widget.isTurnOn?const EdgeInsets.only(left: 50.0):const EdgeInsets.only(right: 50.0),
                              child: new SizedBox(
                                width: 37.0,
                                height: 40.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}