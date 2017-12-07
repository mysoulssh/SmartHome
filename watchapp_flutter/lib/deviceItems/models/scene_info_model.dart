import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';

class SceneInfoModel{
  String sceneId;
  String houseGuid;
  String sceneName;
  int sceneType;
  int enable;
  IOTCMD cmd;

}