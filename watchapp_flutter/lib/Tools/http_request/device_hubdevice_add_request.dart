import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceHubDeviceAdd/DeviceHubDeviceAdd.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceHubDeviceAdd/DeviceHubDeviceAdd.pbgrpc.dart';


typedef DeviceHubDeviceAddFailureCallback(String msg);

class DeviceHubDeviceAddRequest {
  DeviceHubDeviceAddRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> deviceHubDeviceAdd(String deviceSeckey, String deviceId, List<String> subDeviceId,  DeviceHubDeviceAddFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..deviceId = deviceId
      ..deviceSeckey = deviceSeckey;

    for (var v in subDeviceId){
      rpcRequest.subDeviceId.add(v);
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