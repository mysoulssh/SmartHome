///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceVerGet_DeviceVerGet;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class DeviceVer extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DeviceVer')
    ..a<String>(1, 'deviceId', PbFieldType.OS)
    ..a<String>(2, 'subDeviceId', PbFieldType.OS)
    ..a<int>(3, 'swVer', PbFieldType.O3)
    ..a<int>(4, 'hwVer', PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeviceVer() : super();
  DeviceVer.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DeviceVer.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DeviceVer clone() => new DeviceVer()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static DeviceVer create() => new DeviceVer();
  static PbList<DeviceVer> createRepeated() => new PbList<DeviceVer>();
  static DeviceVer getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDeviceVer();
    return _defaultInstance;
  }
  static DeviceVer _defaultInstance;
  static void $checkItem(DeviceVer v) {
    if (v is! DeviceVer) checkItemFailed(v, 'DeviceVer');
  }

  String get deviceId => $_get(0, 1, '');
  set deviceId(String v) { $_setString(0, 1, v); }
  bool hasDeviceId() => $_has(0, 1);
  void clearDeviceId() => clearField(1);

  String get subDeviceId => $_get(1, 2, '');
  set subDeviceId(String v) { $_setString(1, 2, v); }
  bool hasSubDeviceId() => $_has(1, 2);
  void clearSubDeviceId() => clearField(2);

  int get swVer => $_get(2, 3, 0);
  set swVer(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasSwVer() => $_has(2, 3);
  void clearSwVer() => clearField(3);

  int get hwVer => $_get(3, 4, 0);
  set hwVer(int v) { $_setUnsignedInt32(3, 4, v); }
  bool hasHwVer() => $_has(3, 4);
  void clearHwVer() => clearField(4);
}

class _ReadonlyDeviceVer extends DeviceVer with ReadonlyMessageMixin {}

class QueryInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('QueryInfo')
    ..a<String>(1, 'deviceId', PbFieldType.OS)
    ..a<String>(2, 'subDeviceId', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  QueryInfo() : super();
  QueryInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  QueryInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  QueryInfo clone() => new QueryInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static QueryInfo create() => new QueryInfo();
  static PbList<QueryInfo> createRepeated() => new PbList<QueryInfo>();
  static QueryInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyQueryInfo();
    return _defaultInstance;
  }
  static QueryInfo _defaultInstance;
  static void $checkItem(QueryInfo v) {
    if (v is! QueryInfo) checkItemFailed(v, 'QueryInfo');
  }

  String get deviceId => $_get(0, 1, '');
  set deviceId(String v) { $_setString(0, 1, v); }
  bool hasDeviceId() => $_has(0, 1);
  void clearDeviceId() => clearField(1);

  String get subDeviceId => $_get(1, 2, '');
  set subDeviceId(String v) { $_setString(1, 2, v); }
  bool hasSubDeviceId() => $_has(1, 2);
  void clearSubDeviceId() => clearField(2);
}

class _ReadonlyQueryInfo extends QueryInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..pp<QueryInfo>(11, 'query', PbFieldType.PM, QueryInfo.$checkItem, QueryInfo.create)
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

  List<QueryInfo> get query => $_get(1, 11, null);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<DeviceVer>(11, 'vers', PbFieldType.PM, DeviceVer.$checkItem, DeviceVer.create)
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

  List<DeviceVer> get vers => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

