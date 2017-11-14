///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceAdd_DeviceAdd;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'clientId', PbFieldType.OS)
    ..a<Int64>(2, 'reqTime', PbFieldType.O6, Int64.ZERO)
    ..a<String>(3, 'signKey', PbFieldType.OS)
    ..a<String>(11, 'productCode', PbFieldType.OS)
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

  String get clientId => $_get(0, 1, '');
  set clientId(String v) { $_setString(0, 1, v); }
  bool hasClientId() => $_has(0, 1);
  void clearClientId() => clearField(1);

  Int64 get reqTime => $_get(1, 2, null);
  set reqTime(Int64 v) { $_setInt64(1, 2, v); }
  bool hasReqTime() => $_has(1, 2);
  void clearReqTime() => clearField(2);

  String get signKey => $_get(2, 3, '');
  set signKey(String v) { $_setString(2, 3, v); }
  bool hasSignKey() => $_has(2, 3);
  void clearSignKey() => clearField(3);

  String get productCode => $_get(3, 11, '');
  set productCode(String v) { $_setString(3, 11, v); }
  bool hasProductCode() => $_has(3, 11);
  void clearProductCode() => clearField(11);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<String>(11, 'deviceId', PbFieldType.OS)
    ..a<String>(12, 'deviceSeckey', PbFieldType.OS)
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

  String get deviceId => $_get(0, 11, '');
  set deviceId(String v) { $_setString(0, 11, v); }
  bool hasDeviceId() => $_has(0, 11);
  void clearDeviceId() => clearField(11);

  String get deviceSeckey => $_get(1, 12, '');
  set deviceSeckey(String v) { $_setString(1, 12, v); }
  bool hasDeviceSeckey() => $_has(1, 12);
  void clearDeviceSeckey() => clearField(12);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

