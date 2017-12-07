import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/HouseDeviceList/HouseDeviceList.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/HouseDeviceList/HouseDeviceList.pbgrpc.dart';
import 'package:watchapp_flutter/deviceItems/models/house_device_info_model.dart';

typedef HouseDeviceListFailureCallback(String msg);

class HouseDeviceListRequest {
  HouseDeviceListRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List<HouseDeviceInfoModel>> houseDeviceList(String accessToken, String houseGuid, int page, int pageSize,  HouseDeviceListFailureCallback failureCallback, {String prodtType, String areaGuid,}) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..houseGuid   = houseGuid
      ..page        = page
      ..pageSize    = pageSize
      ..areaGuid    = areaGuid==null?'':areaGuid
      ..prodtType   = prodtType==null?'':prodtType;

    List<HouseDeviceInfoModel> models = <HouseDeviceInfoModel>[];

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);

      if(response.devs.length > 0){
        for (var v in response.devs){
          HouseDeviceInfoModel infoModel = new HouseDeviceInfoModel()
              ..deviceId    = v.deviceId
              ..areaGuid    = v.areaGuid
              ..prodtType   = v.prodtType
              ..houseGuid   = v.houseGuid
              ..deviceName  = v.deviceName
              ..subDeviceId = v.subDeviceId;

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