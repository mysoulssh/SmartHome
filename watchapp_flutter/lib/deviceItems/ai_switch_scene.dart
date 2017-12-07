import 'package:flutter/material.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';


typedef SwitchBtnCallback(bool isOpen);

class AiSwitchScene extends StatefulWidget{

  AiSwitchScene({
    this.isSwitchOn,
    this.deviceId,
    this.subDeviceId,
    this.callback
  });

  bool isSwitchOn;

  SwitchBtnCallback callback;

  String deviceId;
  String subDeviceId;

  @override
  _AiSwitchSceneState createState() => new _AiSwitchSceneState();
}

class _AiSwitchSceneState extends State<AiSwitchScene>{

  void runIOTcmd(){
    IOTCMD iotcmd = new IOTCMD();

    SIOTCMD cmd = new SIOTCMD()
    ..subDeviceId    = widget.subDeviceId
    ..deviceId       = widget.deviceId
    ..cmdid          = 201
    ..argInt32.add(widget.isSwitchOn?1:0);

    iotcmd.cmd.add(cmd);

    httpManage.deviceRunTOTCmd(UserAccessModel.accessModel.accessToken, iotcmd, (Map map){

    }, (String errorMsg){
      print('开关错误信息：$errorMsg');
    });
  }


  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Expanded(child: new Container(
            child: new Center(
              child: new Image(image: const AssetImage('images/img_switch.png')),
            ),
          )),
          new Expanded(child: new Container(
            child: new Center(
              child: new FlatButton(onPressed: (){
                setState((){
                  widget.isSwitchOn = !widget.isSwitchOn;
                  if (widget.callback != null){
                    widget.callback(widget.isSwitchOn);
                  }else{
                    runIOTcmd();
                  }
                });
              }, child: new Image(image: new AssetImage(widget.isSwitchOn?'images/btn_switch_s.png':'images/btn_switch_n.png'))),
            ),
          )),
        ],
      ),
    );
  }
}