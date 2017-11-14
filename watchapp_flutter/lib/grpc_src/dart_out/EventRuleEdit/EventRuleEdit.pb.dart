///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library EventRuleEdit_EventRuleEdit;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(11, 'etId', PbFieldType.OS)
    ..a<String>(20, 'deviceId', PbFieldType.OS)
    ..a<String>(21, 'etName', PbFieldType.OS)
    ..a<int>(24, 'onlyTime', PbFieldType.O3)
    ..a<String>(25, 'lhs', PbFieldType.OS)
    ..pp<ExprInfo>(26, 'exprs', PbFieldType.PM, ExprInfo.$checkItem, ExprInfo.create)
    ..pp<RhsInfo>(27, 'rhs', PbFieldType.PM, RhsInfo.$checkItem, RhsInfo.create)
    ..a<int>(28, 'isEnd', PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RpcRequest() : super();
  RpcRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RpcRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RpcRequest clone() => new RpcRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static RpcRequest create() => new RpcRequest();
  static PbList<RpcRequest> createRepeated() => new PbList<RpcRequest>();
  static RpcRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyRpcRequest();
    return _defaultInstance;
  }
  static RpcRequest _defaultInstance;
  static void $checkItem(RpcRequest v) {
    if (v is! RpcRequest) checkItemFailed(v, 'RpcRequest');
  }

  String get accessToken => $_get(0, 1, '');
  set accessToken(String v) { $_setString(0, 1, v); }
  bool hasAccessToken() => $_has(0, 1);
  void clearAccessToken() => clearField(1);

  String get etId => $_get(1, 11, '');
  set etId(String v) { $_setString(1, 11, v); }
  bool hasEtId() => $_has(1, 11);
  void clearEtId() => clearField(11);

  String get deviceId => $_get(2, 20, '');
  set deviceId(String v) { $_setString(2, 20, v); }
  bool hasDeviceId() => $_has(2, 20);
  void clearDeviceId() => clearField(20);

  String get etName => $_get(3, 21, '');
  set etName(String v) { $_setString(3, 21, v); }
  bool hasEtName() => $_has(3, 21);
  void clearEtName() => clearField(21);

  int get onlyTime => $_get(4, 24, 0);
  set onlyTime(int v) { $_setUnsignedInt32(4, 24, v); }
  bool hasOnlyTime() => $_has(4, 24);
  void clearOnlyTime() => clearField(24);

  String get lhs => $_get(5, 25, '');
  set lhs(String v) { $_setString(5, 25, v); }
  bool hasLhs() => $_has(5, 25);
  void clearLhs() => clearField(25);

  List<ExprInfo> get exprs => $_get(6, 26, null);

  List<RhsInfo> get rhs => $_get(7, 27, null);

  int get isEnd => $_get(8, 28, 0);
  set isEnd(int v) { $_setUnsignedInt32(8, 28, v); }
  bool hasIsEnd() => $_has(8, 28);
  void clearIsEnd() => clearField(28);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..hasRequiredFields = false
  ;

  RpcResponse() : super();
  RpcResponse.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RpcResponse.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RpcResponse clone() => new RpcResponse()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static RpcResponse create() => new RpcResponse();
  static PbList<RpcResponse> createRepeated() => new PbList<RpcResponse>();
  static RpcResponse getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyRpcResponse();
    return _defaultInstance;
  }
  static RpcResponse _defaultInstance;
  static void $checkItem(RpcResponse v) {
    if (v is! RpcResponse) checkItemFailed(v, 'RpcResponse');
  }
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

