import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserLogin/UserLogin.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserLogin/UserLogin.pbgrpc.dart';

typedef LoginFailureCallback(String message);

class LoginRequest{

  LoginRequest(this.channel,{
    this.clientId,
    this.reqTime,
    this.signKey,
    this.login_type,
    this.login_deviceid,
    this.login_lang,
    this.login_os
  });

  final ClientChannel channel;

  RpcYCallClient rpcYCallClient;
  final Int64 reqTime;
  final String signKey;
  final String clientId;
  final int login_type;
  final String login_deviceid;
  final String login_lang;
  final int login_os;

  RpcYCallClient shareRpcYCall(){
    if(rpcYCallClient == null){
      rpcYCallClient = new RpcYCallClient(channel,options: new CallOptions(timeout: new Duration(seconds: 30)));
    }
    return rpcYCallClient;
  }

  //登录
  Future<RpcResponse> loginAccount(String phoneNum, String pwd, LoginFailureCallback callback) async{

    final rpcRequest = new RpcRequest()
      ..clientId = clientId
      ..reqTime = reqTime
      ..signKey = signKey
      ..userName = phoneNum
      ..password = pwd
      ..loginType = 1
      ..loginLang = 'CN'
      ..loginDeviceid = 'E12345677654321'
      ..loginOs = 1;


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