///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library EventRuleAdd_EventRuleAdd;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(9, 'houseGuid', PbFieldType.OS)
    ..a<String>(10, 'deviceId', PbFieldType.OS)
    ..a<String>(11, 'etName', PbFieldType.OS)
    ..a<int>(12, 'prio', PbFieldType.O3)
    ..a<int>(13, 'enable', PbFieldType.O3)
    ..a<int>(14, 'onlyTime', PbFieldType.O3)
    ..a<String>(15, 'lhs', PbFieldType.OS)
    ..pp<ExprInfo>(16, 'exprs', PbFieldType.PM, ExprInfo.$checkItem, ExprInfo.create)
    ..pp<RhsInfo>(17, 'rhs', PbFieldType.PM, RhsInfo.$checkItem, RhsInfo.create)
    ..a<int>(18, 'isEnd', PbFieldType.O3)
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

  String get houseGuid => $_get(1, 9, '');
  set houseGuid(String v) { $_setString(1, 9, v); }
  bool hasHouseGuid() => $_has(1, 9);
  void clearHouseGuid() => clearField(9);

  String get deviceId => $_get(2, 10, '');
  set deviceId(String v) { $_setString(2, 10, v); }
  bool hasDeviceId() => $_has(2, 10);
  void clearDeviceId() => clearField(10);

  String get etName => $_get(3, 11, '');
  set etName(String v) { $_setString(3, 11, v); }
  bool hasEtName() => $_has(3, 11);
  void clearEtName() => clearField(11);

  int get prio => $_get(4, 12, 0);
  set prio(int v) { $_setUnsignedInt32(4, 12, v); }
  bool hasPrio() => $_has(4, 12);
  void clearPrio() => clearField(12);

  int get enable => $_get(5, 13, 0);
  set enable(int v) { $_setUnsignedInt32(5, 13, v); }
  bool hasEnable() => $_has(5, 13);
  void clearEnable() => clearField(13);

  int get onlyTime => $_get(6, 14, 0);
  set onlyTime(int v) { $_setUnsignedInt32(6, 14, v); }
  bool hasOnlyTime() => $_has(6, 14);
  void clearOnlyTime() => clearField(14);

  String get lhs => $_get(7, 15, '');
  set lhs(String v) { $_setString(7, 15, v); }
  bool hasLhs() => $_has(7, 15);
  void clearLhs() => clearField(15);

  List<ExprInfo> get exprs => $_get(8, 16, null);

  List<RhsInfo> get rhs => $_get(9, 17, null);

  int get isEnd => $_get(10, 18, 0);
  set isEnd(int v) { $_setUnsignedInt32(10, 18, v); }
  bool hasIsEnd() => $_has(10, 18);
  void clearIsEnd() => clearField(18);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<String>(11, 'etId', PbFieldType.OS)
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

  String get etId => $_get(0, 11, '');
  set etId(String v) { $_setString(0, 11, v); }
  bool hasEtId() => $_has(0, 11);
  void clearEtId() => clearField(11);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

