import 'dart:async';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserVcode/UserVcode.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserVcode/UserVcode.pbgrpc.dart';

typedef SendCodeFailureCallback(String message);

class SendCodeRequest{

  //单利
  SendCodeRequest(this.channel,{this.clientId,this.reqTime,this.md5Str});

  final ClientChannel channel;
  final Int64 reqTime;
  final String md5Str;
  final String clientId;

  RpcYCallClient rpcYCallClient;

  RpcYCallClient shareRpcYCall(){
    if(rpcYCallClient == null){
      rpcYCallClient = new RpcYCallClient(channel,options: new CallOptions(timeout: new Duration(seconds: 30)));
    }
    return rpcYCallClient;
  }

  //发送验证码(注册验证码)
  Future<Null> sendVcode(String phoneNum,int type, SendCodeFailureCallback callback) async{
    final rpcRequest = new RpcRequest()
      ..clientId = clientId
      ..reqTime = reqTime
      ..signKey = md5Str
      ..class_12 = type;

    rpcRequest.userName.add(phoneNum);


    try{
      await shareRpcYCall().yCall(rpcRequest);
    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(callback != null){
        callback(errorList[2]);
      }
    }
  }
}