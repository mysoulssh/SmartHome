import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/EventRuleEdit/EventRuleEdit.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/EventRuleEdit/EventRuleEdit.pbgrpc.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';


typedef EventRuleEditFailureCallback(String msg);

class EventRuleEditRequest {
  EventRuleEditRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> eventRuleEdit(
      String accessToken,
      String etId,
      String deviceId,
      String etName,
      int onlyTime,
      String lhs,
      int isEnd,
      List<ExprInfo> exprs,
      List<RhsInfo> rhs,
      EventRuleEditFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..etId = etId
      ..isEnd = isEnd
      ..deviceId = deviceId
      ..etName = etName
      ..onlyTime = onlyTime
      ..lhs = lhs;

    for (var v in exprs){
      rpcRequest.exprs.add(v);
    }

    for (var v in rhs){
      rpcRequest.rhs.add(v);
    }

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