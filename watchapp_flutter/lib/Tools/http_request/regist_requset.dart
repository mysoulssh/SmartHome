import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserReg/UserReg.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserReg/UserReg.pbgrpc.dart';

typedef RegistFailureCallback(String message);

class RegistRequest{

  RegistRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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

  //注册账号
  Future<RpcResponse> registAccount(String phoneNum, String code, String pwd,RegistFailureCallback callback) async{
    final rpcRequest = new RpcRequest()
      ..clientId = clientId
      ..reqTime = reqTime
      ..signKey = signKey
      ..textPass = pwd
      ..userName = phoneNum
      ..vcode = code;

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