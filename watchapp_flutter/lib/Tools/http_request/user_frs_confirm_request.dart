import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserFRSConfirm/UserFRSConfirm.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserFRSConfirm/UserFRSConfirm.pbgrpc.dart';

typedef UserFRSConfirmFailureCallback(String msg);

class UserFRSConfirmRequest {
  UserFRSConfirmRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> userFRSConfirm(String accessToken, String relationUserName, int action, UserFRSConfirmFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken       = accessToken
      ..relationUserName  = relationUserName
      ..action            = action;

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