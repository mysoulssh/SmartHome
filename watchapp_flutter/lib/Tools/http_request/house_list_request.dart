import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/HouseList/HouseList.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/HouseList/HouseList.pbgrpc.dart';
import 'package:watchapp_flutter/meItems/models/house_info_model.dart';

typedef HouseListFailureCallback(String msg);

class HouseListRequest {
  HouseListRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List<HouseInfoModel>> houseList(String accessToken, String houseGuid, HouseListFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken
      ..houseGuid = houseGuid;

    List<HouseInfoModel> houses = <HouseInfoModel>[];

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);
      if(response.houses.length == 0){
        return houses;
      }

      houses = <HouseInfoModel>[];
      for (var i=0; i<response.houses.length; i++){
        var tmp = response.houses[i];
        HouseInfoModel info = new HouseInfoModel()
        ..longitude = tmp.longitude
        ..latitude = tmp.latitude
        ..houseGuid = tmp.houseGuid
        ..houseName = tmp.houseName
        ..addrName = tmp.addrName
        ..isConfirm = tmp.isConfirm
        ..role = tmp.role
        ..userId = tmp.userId;

        houses.add(info);
      }

    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(failureCallback != null){
        failureCallback(errorList[2]);
      }
    }

    return houses;
  }
}