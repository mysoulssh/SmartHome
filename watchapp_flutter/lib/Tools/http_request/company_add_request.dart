import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/CompanyAdd/CompanyAdd.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/CompanyAdd/CompanyAdd.pbgrpc.dart';

typedef CompanyAddFailureCallback(String msg);

class CompanyAddRequest {
  CompanyAddRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> companyAdd(String accessToken, String name, String addr, String agencyCode, String fileIds, CompanyAddFailureCallback callback) async{
    final rpcRequest = new RpcRequest()
    ..accessToken = accessToken
    ..name = name
    ..addr = addr
    ..agencyCode = agencyCode
    ..fileIds = fileIds;

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