import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/HouseAreaList/HouseAreaList.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/HouseAreaList/HouseAreaList.pbgrpc.dart';
import 'package:watchapp_flutter/meItems/models/area_info_model.dart';


typedef HouseAreaListFailureCallback(String msg);

class HouseAreaListRequest {
  HouseAreaListRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List<AreaInfoModel>> houseAreaList(String accessToken, String houseGuid, HouseAreaListFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..houseGuid = houseGuid;

    List<AreaInfoModel> infoModels = null;

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);
      if(response.areas == null || response.areas.length == 0){
        return null;
      }

      infoModels = <AreaInfoModel>[];

      for (AreaInfo tmp in response.areas){
        AreaInfoModel model = new AreaInfoModel()
            ..houseGuid = tmp.houseGuid
            ..areaGuid  = tmp.areaGuid
            ..areaName  = tmp.areaName
            ..isDefault = tmp.isDefault;
        infoModels.add(model);
      }

    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(failureCallback != null){
        failureCallback(errorList[2]);
      }
    }

    return infoModels;
  }
}