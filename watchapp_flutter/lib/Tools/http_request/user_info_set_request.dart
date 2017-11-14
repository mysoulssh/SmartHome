import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserAttrSet/UserAttrSet.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserAttrSet/UserAttrSet.pbgrpc.dart';

typedef InfoSetFailureCallback(String message);

class UserInfoSetRequest {

  UserInfoSetRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> infoSet(String accessToken, String userName, List<Attr> attr, InfoSetFailureCallback callback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..userName = userName;

    for (var v in attr){
      rpcRequest.attrs.add(v);
    }

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