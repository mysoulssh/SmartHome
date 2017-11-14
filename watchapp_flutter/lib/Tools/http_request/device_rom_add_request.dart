import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceRomAdd/DeviceRomAdd.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceRomAdd/DeviceRomAdd.pbgrpc.dart';


typedef DeviceRomAddFailureCallback(String msg);

class DeviceRomAddRequest {
  DeviceRomAddRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> deviceRomAdd(String accessToken, String productCode, int romVer, String romMd5, String fileId, String changeLog,  DeviceRomAddFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
    ..productCode = productCode
    ..romVer = romVer
    ..romMd5 = romMd5
    ..fileId = fileId
    ..changeLog = changeLog;

    RpcResponse response;

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