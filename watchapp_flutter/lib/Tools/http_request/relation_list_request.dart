import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/RelationList/RelationList.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/RelationList/RelationList.pbgrpc.dart';

typedef RelationListCallback(String message);

class RelationListRequest{

  RelationListRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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

  //获取关系表
  Future<List<RelationInfo>> relationList(String accessToken, int page, int pageSize, int relationCode, RelationListCallback callback) async{
    final rpcRequest = new RpcRequest()
    ..accessToken   = accessToken
    ..page          = page
    ..pageSize      = pageSize
    ..relationCode  = relationCode
      ;

    List<RelationInfo> infos = <RelationInfo>[];

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);

      if (response.ris.length > 0){
        infos = response.ris;
      }

    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(callback != null){
        callback(errorList[2]);
      }
    }

    return infos;
  }
}