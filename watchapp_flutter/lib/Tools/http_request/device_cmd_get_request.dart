import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceCmdGet/DeviceCmdGet.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceCmdGet/DeviceCmdGet.pbgrpc.dart';


typedef DeviceCmdGetFailureCallback(String msg);

class DeviceCmdGetRequest {
  DeviceCmdGetRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> deviceCmdGet(String accessToken, String deviceId, String subDeviceId, int page, int pageSize, DeviceCmdGetFailureCallback callback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..deviceId = deviceId
      ..subDeviceId = subDeviceId
      ..page = page
      ..pageSize = pageSize;


    RpcResponse response;

    try{
      response = await shareRpcYCall().yCall(rpcRequest);

    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(callback != null){
        callback(errorList[2]);
      }
    }

    return response;
  }
}