///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceFailcodeGet_DeviceFailcodeGet;

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

class FailcodeInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('FailcodeInfo')
    ..a<String>(1, 'deviceId', PbFieldType.OS)
    ..a<String>(2, 'subDeviceId', PbFieldType.OS)
    ..a<int>(3, 'failCode', PbFieldType.OU3)
    ..a<int>(4, 'timeStamp', PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  FailcodeInfo() : super();
  FailcodeInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  FailcodeInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  FailcodeInfo clone() => new FailcodeInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static FailcodeInfo create() => new FailcodeInfo();
  static PbList<FailcodeInfo> createRepeated() => new PbList<FailcodeInfo>();
  static FailcodeInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyFailcodeInfo();
    return _defaultInstance;
  }
  static FailcodeInfo _defaultInstance;
  static void $checkItem(FailcodeInfo v) {
    if (v is! FailcodeInfo) checkItemFailed(v, 'FailcodeInfo');
  }

  String get deviceId => $_get(0, 1, '');
  set deviceId(String v) { $_setString(0, 1, v); }
  bool hasDeviceId() => $_has(0, 1);
  void clearDeviceId() => clearField(1);

  String get subDeviceId => $_get(1, 2, '');
  set subDeviceId(String v) { $_setString(1, 2, v); }
  bool hasSubDeviceId() => $_has(1, 2);
  void clearSubDeviceId() => clearField(2);

  int get failCode => $_get(2, 3, 0);
  set failCode(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasFailCode() => $_has(2, 3);
  void clearFailCode() => clearField(3);

  int get timeStamp => $_get(3, 4, 0);
  set timeStamp(int v) { $_setUnsignedInt32(3, 4, v); }
  bool hasTimeStamp() => $_has(3, 4);
  void clearTimeStamp() => clearField(4);
}

class _ReadonlyFailcodeInfo extends FailcodeInfo with ReadonlyMessageMixin {}

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
    ..pp<FailcodeInfo>(11, 'failcodes', PbFieldType.PM, FailcodeInfo.$checkItem, FailcodeInfo.create)
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

  List<FailcodeInfo> get failcodes => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

