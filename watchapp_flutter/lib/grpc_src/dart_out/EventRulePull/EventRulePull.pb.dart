///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library EventRulePull_EventRulePull;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

//import 'iot_comm.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'deviceId', PbFieldType.OS)
    ..a<String>(2, 'deviceSeckey', PbFieldType.OS)
    ..a<int>(11, 'page', PbFieldType.OU3)
    ..a<int>(12, 'pageSize', PbFieldType.OU3)
    ..a<int>(21, 'syncFlag', PbFieldType.O3)
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

  String get deviceId => $_get(0, 1, '');
  set deviceId(String v) { $_setString(0, 1, v); }
  bool hasDeviceId() => $_has(0, 1);
  void clearDeviceId() => clearField(1);

  String get deviceSeckey => $_get(1, 2, '');
  set deviceSeckey(String v) { $_setString(1, 2, v); }
  bool hasDeviceSeckey() => $_has(1, 2);
  void clearDeviceSeckey() => clearField(2);

  int get page => $_get(2, 11, 0);
  set page(int v) { $_setUnsignedInt32(2, 11, v); }
  bool hasPage() => $_has(2, 11);
  void clearPage() => clearField(11);

  int get pageSize => $_get(3, 12, 0);
  set pageSize(int v) { $_setUnsignedInt32(3, 12, v); }
  bool hasPageSize() => $_has(3, 12);
  void clearPageSize() => clearField(12);

  int get syncFlag => $_get(4, 21, 0);
  set syncFlag(int v) { $_setUnsignedInt32(4, 21, v); }
  bool hasSyncFlag() => $_has(4, 21);
  void clearSyncFlag() => clearField(21);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<int>(1, 'total', PbFieldType.OU3)
    ..pp<RuleInfo>(11, 'rules', PbFieldType.PM, RuleInfo.$checkItem, RuleInfo.create)
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

  int get total => $_get(0, 1, 0);
  set total(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasTotal() => $_has(0, 1);
  void clearTotal() => clearField(1);

  List<RuleInfo> get rules => $_get(1, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

