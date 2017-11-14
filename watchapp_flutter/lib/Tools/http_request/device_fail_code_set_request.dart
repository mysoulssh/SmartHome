import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceFailcodeSet/DeviceFailcodeSet.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceFailcodeSet/DeviceFailcodeSet.pbgrpc.dart';


typedef DeviceFailCodeSetFailureCallback(String msg);

class DeviceFailCodeSetRequest {
  DeviceFailCodeSetRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<RpcResponse> deviceFailCodeSet(String deviceSeckey, String deviceId, String subDeviceId, int failCode, int timeStamp, DeviceFailCodeSetFailureCallback callback) async{
    final rpcRequest = new RpcRequest()
      ..deviceId = deviceId
      ..deviceSeckey = deviceSeckey
      ..subDeviceId = subDeviceId
      ..failCode = failCode
      ..timeStamp = timeStamp;


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