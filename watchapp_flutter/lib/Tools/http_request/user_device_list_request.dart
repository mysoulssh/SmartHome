import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserDeviceList/UserDeviceList.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserDeviceList/UserDeviceList.pbgrpc.dart';
import 'package:watchapp_flutter/deviceItems/models/device_info_model.dart';

typedef UserDeviceListFailureCallback(String msg);

class UserDeviceListRequest {
  UserDeviceListRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

  final ClientChannel channel;

  RpcYCallClient rpcYCallClient;
  final Int64 reqTime;
  final String signKey;
  final String clientId;

  RpcYCallClient shareRpcYCall(){
    if(rpcYCallClient == null){
      rpcYCallClient = new RpcYCallClient(channel,options: new CallOptions(timeout: new Duration(seconds: 30)));
    }
    return rpcYCallClient;
  }

  //获取个人信息
  Future<List<DeviceInfoModel>> userDeviceList(String accessToken, int page, int pageSize, UserDeviceListFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..page = page
      ..pageSize = pageSize;

    List<DeviceInfoModel> infoModels;

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);

      if (response.total != 0){
        infoModels = <DeviceInfoModel>[];

        for (var tmp in response.devs){
          DeviceInfoModel model = new DeviceInfoModel()
              ..deviceName = tmp.deviceName
              ..deviceId   = tmp.deviceId
              ..createTime = tmp.createTime;
          infoModels.add(model);
        }

      }

    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(failureCallback != null){
        failureCallback(errorList[2]);
      }
    }

    return infoModels;
  }
}