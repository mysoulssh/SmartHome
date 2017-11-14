///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library UserVcode_UserVcode_pbgrpc;

import 'dart:async';

import 'package:grpc/grpc.dart';

import 'UserVcode.pb.dart';
export 'UserVcode.pb.dart';

class RpcYCallClient extends Client {
  static final _$yCall = new ClientMethod<RpcRequest, RpcResponse>(
      '/UserVcode.RpcYCall/YCall',
      (RpcRequest value) => value.writeToBuffer(),
      (List<int> value) => new RpcResponse.fromBuffer(value));

  RpcYCallClient(ClientChannel channel, {CallOptions options})
      : super(channel, options: options);

  ResponseFuture<RpcResponse> yCall(RpcRequest request, {CallOptions options}) {
    final call = $createCall(_$yCall, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }
}

abstract class RpcYCallServiceBase extends Service {
  String get $name => 'UserVcode.RpcYCall';

  RpcYCallServiceBase() {
    $addMethod(new ServiceMethod(
        'YCall',
        yCall_Pre,
        false,
        false,
        (List<int> value) => new RpcRequest.fromBuffer(value),
        (RpcResponse value) => value.writeToBuffer()));
  }

  Future<RpcResponse> yCall_Pre(
      ServiceCall call, Future<RpcRequest> request) async {
    return yCall(call, await request);
  }

  Future<RpcResponse> yCall(ServiceCall call, RpcRequest request);
}
