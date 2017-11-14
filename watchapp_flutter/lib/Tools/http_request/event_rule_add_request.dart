import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/EventRuleAdd/EventRuleAdd.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/EventRuleAdd/EventRuleAdd.pbgrpc.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';


typedef EventRuleAddFailureCallback(String msg);

class EventRuleAddRequest {
  EventRuleAddRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> eventRuleAdd(
      String deviceId,
      String accessToken,
      String houseGuid,
      String etName,
      int prio,
      int enable,
      int onlyTime,
      String lhs,
      int isEnd,
      List<ExprInfo> exprs,
      List<RhsInfo> rhs,
      EventRuleAddFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..deviceId = deviceId
      ..accessToken = accessToken
      ..houseGuid = houseGuid
      ..etName = etName
      ..prio = prio
      ..enable = enable
      ..onlyTime = onlyTime
      ..lhs = lhs
      ..isEnd = isEnd;

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