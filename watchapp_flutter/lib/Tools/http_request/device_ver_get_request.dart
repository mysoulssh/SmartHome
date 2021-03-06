import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceVerGet/DeviceVerGet.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceVerGet/DeviceVerGet.pbgrpc.dart';


typedef DeviceVerGetFailureCallback(String msg);

class DeviceVerGetRequest {
  DeviceVerGetRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List<DeviceVer>> deviceVerGet(String accessToken, List query, DeviceVerGetFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken;

    for (var v in query){
      rpcRequest.query.add(v);
    }

    List<DeviceVer> models = <DeviceVer>[];

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);

      if (response.vers.length > 0){
        models = response.vers;
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