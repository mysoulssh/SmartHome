import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserPhoneChange/UserPhoneChange.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserPhoneChange/UserPhoneChange.pbgrpc.dart';


typedef UserPhoneChangeFailureCallback(String msg);

class UserPhoneChangeRequest {
  UserPhoneChangeRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> userPhoneChange(String accessToken, String oldPhone, String oldVcode, String newPhone, String newVcode, UserPhoneChangeFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
    ..oldPhone = oldPhone
    ..oldVcode = oldVcode
    ..newPhone = newPhone
    ..newVcode = newVcode
      ;
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