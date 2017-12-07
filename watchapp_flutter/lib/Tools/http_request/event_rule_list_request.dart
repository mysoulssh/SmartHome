import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/EventRuleList/EventRuleList.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/EventRuleList/EventRuleList.pbgrpc.dart';


typedef EventRuleListFailureCallback(String msg);

class EventRuleListRequest {
  EventRuleListRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List> eventRuleList(String accessToken, int page, int pageSize, String houseGuid, EventRuleListFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..page        = page
      ..pageSize    = pageSize
      ..houseGuid   = houseGuid;

    List models = [];

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);

      for (var v in response.rules){
        models.add(v);
      }

    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(failureCallback != null){
        failureCallback(errorList[2]);
      }
    }

    return models;
  }
}