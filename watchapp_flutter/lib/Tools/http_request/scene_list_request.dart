import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/SceneList/SceneList.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/SceneList/SceneList.pbgrpc.dart';
import 'package:watchapp_flutter/deviceItems/models/scene_info_model.dart';

typedef SceneListFailureCallback(String msg);

class SceneListRequest {
  SceneListRequest(this.channel,{this.clientId,this.reqTime,this.signKey});

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
  Future<List<SceneInfoModel>> sceneList(String accessToken, String houseGuid, int page, int pageSize, SceneListFailureCallback failureCallback) async{
    final rpcRequest = new RpcRequest()
      ..accessToken  = accessToken
      ..houseGuid    = houseGuid
      ..page         = page
      ..pageSize     = pageSize;

    List<SceneInfoModel> infoModels;

    try{
      RpcResponse response = await shareRpcYCall().yCall(rpcRequest);

      infoModels = <SceneInfoModel>[];

      for (var tmp in response.scenes){
        SceneInfoModel model = new SceneInfoModel()
            ..houseGuid = tmp.houseGuid
            ..sceneId   = tmp.sceneId
            ..sceneName = tmp.sceneName
            ..cmd       = tmp.cmd
            ..enable    = tmp.enable
            ..sceneType = tmp.sceneType;

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