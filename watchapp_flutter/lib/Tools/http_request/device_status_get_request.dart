import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceStatusGet/DeviceStatusGet.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceStatusGet/DeviceStatusGet.pbgrpc.dart';
import 'package:watchapp_flutter/deviceItems/models/status_info_model.dart';


typedef DeviceStatusGetFailureCallback(String msg);

class DeviceStatusGetRequest {
  DeviceStatusGetRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List<StatusInfoModel>> deviceStatusGet(String accessToken, List<QueryInfo> query, DeviceStatusGetFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ;

    for (var v in query){
      rpcRequest.devs.add(v);
    }

    List<StatusInfoModel> models = <StatusInfoModel>[];

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);

      if (response.status.length > 0){
        for (var v in response.status){
          StatusInfoModel infoModel = new StatusInfoModel()
              ..deviceId    = v.deviceId
              ..subDeviceId = v.subDeviceId
              ..argBytes    = v.argBytes
              ..argInt32    = v.argInt32
              ..argString   = v.argString
              ..online      = v.online
              ..cmdid       = v.cmdid
              ..timeStamp   = v.timeStamp;
          models.add(infoModel);
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

    return models;
  }
}