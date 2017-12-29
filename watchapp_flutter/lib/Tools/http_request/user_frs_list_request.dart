import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserFRSList/UserFRSList.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserFRSList/UserFRSList.pbgrpc.dart';

typedef UserFRSListFailureCallback(String msg);

class UserFRSListRequest {
  UserFRSListRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List<FRSInfo>> userFRSList(String accessToken, UserFRSListFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken;

    List<FRSInfo> infoModels = <FRSInfo>[];

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);

      if (response.frs.length > 0){
        infoModels = response.frs;
      }

    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(failureCallback != null){
        failureCallback(errorList[2]);
      }
    }

    return infoModels;
  }
}