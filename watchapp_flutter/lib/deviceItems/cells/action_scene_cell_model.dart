import 'package:flutter/material.dart';

import 'package:watchapp_flutter/deviceItems/models/subdevice_info_model.dart';

class ActionSceneCellModel{

  ActionSceneCellModel({this.image, this.deviceName, this.location,this.status,this.deviceId,this.subDeviceInfoModel});

  Image image;
  String deviceName;
  String location;

  int status;

  String deviceId;

  SubDeviceInfoModel subDeviceInfoModel;

}