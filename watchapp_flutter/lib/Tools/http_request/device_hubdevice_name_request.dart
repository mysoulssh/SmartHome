import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceHubDeviceName/DeviceHubDeviceName.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceHubDeviceName/DeviceHubDeviceName.pbgrpc.dart';


typedef DeviceHubDeviceNameFailureCallback(String msg);

class DeviceHubDeviceNameRequest {
  DeviceHubDeviceNameRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> deviceHubDeviceName(String accessToken, String deviceId, String subDeviceId, String deviceName, DeviceHubDeviceNameFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..deviceId = deviceId
      ..accessToken = accessToken
      ..subDeviceId = subDeviceId
      ..deviceName = deviceName;

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