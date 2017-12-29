import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserAttrGet/UserAttrGet.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserAttrGet/UserAttrGet.pbgrpc.dart';
import 'package:watchapp_flutter/meItems/models/user_info_model.dart';

typedef InfoGetFailureCallback(String message);

class UserInfoGetRequest {

  UserInfoGetRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List<UserInfoModel>> infoGet(String accessToken, List<String> userName, InfoGetFailureCallback callback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken = accessToken;
    
    for (var v in userName){
      rpcRequest.userName.add(v);
    }


    List<UserInfoModel> models = <UserInfoModel>[];

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);
      
      for (var v in response.attrs){
        UserAttr attr = v;

        UserInfoModel infoModel = new UserInfoModel();
        infoModel.user_id = attr.userId;
        infoModel.user_name = attr.userName;
        infoModel.like_name = attr.likeName;
        infoModel.sign = attr.sign;
        infoModel.birth_year = attr.birthYear;
        infoModel.birth_month = attr.birthMonth;
        infoModel.birth_day = attr.birthDay;
        infoModel.height = attr.height;
        infoModel.weight = attr.weight;
        infoModel.sex = attr.sex;
        infoModel.pic_fileid = attr.picFileid;
        infoModel.card_id = attr.cardId;
        infoModel.latitude = attr.latitude;
        infoModel.longitude = attr.longitude;
        infoModel.company_code = attr.companyCode;
        infoModel.site_name = attr.siteName;
        infoModel.target_step = attr.targetStep;
        
        models.add(infoModel);
      }
      
    }catch(e){
      String error = e.message;
      List<String> errorList = error.split(',');
      print('error = $errorList');
      if(callback != null){
        callback(errorList[2]);
      }
    }

    return models;
  }

}