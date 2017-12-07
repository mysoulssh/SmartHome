import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/HouseAreaDeviceSet/HouseAreaDeviceSet.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/HouseAreaDeviceSet/HouseAreaDeviceSet.pbgrpc.dart';


typedef HouseAreaDeviceSetFailureCallback(String msg);

class HouseAreaDeviceSetRequest {
  HouseAreaDeviceSetRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> houseAreaDeviceSet(String accessToken, String houseGuid, String areaGuid, String deviceId, String subDeviceId, HouseAreaDeviceSetFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..houseGuid = houseGuid
      ..areaGuid = areaGuid
      ..deviceId = deviceId
      ..subDeviceId = subDeviceId;

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