import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserDeviceEdit/UserDeviceEdit.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserDeviceEdit/UserDeviceEdit.pbgrpc.dart';

typedef UserDeviceEditFailureCallback(String msg);

class UserDeviceEditRequest {
  UserDeviceEditRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> userDeviceEdit(String accessToken, String deviceId, String deviceName, UserDeviceEditFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..deviceId = deviceId
      ..deviceName = deviceName;

    RpcResponse response = null;

    try{
      response = await shareRpcYCall().yCall(rpcRequest);
    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(failureCallback != null){
        failureCallback(errorList[2]);
      }
    }

    return response;
  }
}