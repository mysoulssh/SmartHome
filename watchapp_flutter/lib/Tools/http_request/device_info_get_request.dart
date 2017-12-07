import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceInfoGet/DeviceInfoGet.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceInfoGet/DeviceInfoGet.pbgrpc.dart';
import 'package:watchapp_flutter/deviceItems/models/device_detail_info_model.dart';


typedef DeviceInfoGetFailureCallback(String msg);

class DeviceInfoGetRequest {
  DeviceInfoGetRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List<DeviceDetailInfoModel>> deviceInfoGet(List<String> deviceId, String accessToken, DeviceInfoGetFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken;

    for (var v in deviceId){
      rpcRequest.deviceId.add(v);
    }

    List<DeviceDetailInfoModel> models = <DeviceDetailInfoModel>[];

    try{
      RpcResponse response= await shareRpcYCall().yCall(rpcRequest);

      if (response.vers.length > 0){
        for (var v in response.vers){
          DeviceDetailInfoModel infoModel = new DeviceDetailInfoModel()
              ..deviceId    = v.deviceId
              ..prodtCode   = v.prodtCode
              ..productCode = v.productCode
              ..productName = v.productName
              ..companyCode = v.companyCode
              ..pic1Fileid  = v.pic1Fileid
              ..pic2Fileid  = v.pic2Fileid
              ..pic3Fileid  = v.pic3Fileid
              ..swVer       = v.swVer
              ..hwVer       = v.hwVer
              ..nbiCode     = v.nbiCode;
          models.add(infoModel);
        }
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