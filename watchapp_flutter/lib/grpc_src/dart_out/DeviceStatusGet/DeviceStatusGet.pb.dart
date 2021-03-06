///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceStatusGet_DeviceStatusGet;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

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

class StatusInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('StatusInfo')
    ..a<String>(1, 'subDeviceId', PbFieldType.OS)
    ..a<int>(2, 'online', PbFieldType.OU3)
    ..a<int>(3, 'timeStamp', PbFieldType.OU3)
    ..a<int>(4, 'cmdid', PbFieldType.O3)
    ..p<int>(5, 'argInt32', PbFieldType.P3)
    ..p<String>(6, 'argString', PbFieldType.PS)
    ..a<List<int>>(7, 'argBytes', PbFieldType.OY)
    ..a<String>(8, 'deviceId', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  StatusInfo() : super();
  StatusInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  StatusInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  StatusInfo clone() => new StatusInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static StatusInfo create() => new StatusInfo();
  static PbList<StatusInfo> createRepeated() => new PbList<StatusInfo>();
  static StatusInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyStatusInfo();
    return _defaultInstance;
  }
  static StatusInfo _defaultInstance;
  static void $checkItem(StatusInfo v) {
    if (v is! StatusInfo) checkItemFailed(v, 'StatusInfo');
  }

  String get subDeviceId => $_get(0, 1, '');
  set subDeviceId(String v) { $_setString(0, 1, v); }
  bool hasSubDeviceId() => $_has(0, 1);
  void clearSubDeviceId() => clearField(1);

  int get online => $_get(1, 2, 0);
  set online(int v) { $_setUnsignedInt32(1, 2, v); }
  bool hasOnline() => $_has(1, 2);
  void clearOnline() => clearField(2);

  int get timeStamp => $_get(2, 3, 0);
  set timeStamp(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasTimeStamp() => $_has(2, 3);
  void clearTimeStamp() => clearField(3);

  int get cmdid => $_get(3, 4, 0);
  set cmdid(int v) { $_setUnsignedInt32(3, 4, v); }
  bool hasCmdid() => $_has(3, 4);
  void clearCmdid() => clearField(4);

  List<int> get argInt32 => $_get(4, 5, null);

  List<String> get argString => $_get(5, 6, null);

  List<int> get argBytes => $_get(6, 7, null);
  set argBytes(List<int> v) { $_setBytes(6, 7, v); }
  bool hasArgBytes() => $_has(6, 7);
  void clearArgBytes() => clearField(7);

  String get deviceId => $_get(7, 8, '');
  set deviceId(String v) { $_setString(7, 8, v); }
  bool hasDeviceId() => $_has(7, 8);
  void clearDeviceId() => clearField(8);
}

class _ReadonlyStatusInfo extends StatusInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..pp<QueryInfo>(11, 'devs', PbFieldType.PM, QueryInfo.$checkItem, QueryInfo.create)
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

  List<QueryInfo> get devs => $_get(1, 11, null);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<StatusInfo>(11, 'status', PbFieldType.PM, StatusInfo.$checkItem, StatusInfo.create)
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

  List<StatusInfo> get status => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

