///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library UserDeviceShareList_UserDeviceShareList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class ShareInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ShareInfo')
    ..a<int>(1, 'userId', PbFieldType.OU3)
    ..a<int>(2, 'shareUserId', PbFieldType.OU3)
    ..a<String>(3, 'deviceId', PbFieldType.OS)
    ..a<String>(4, 'deviceName', PbFieldType.OS)
    ..a<int>(5, 'createTime', PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ShareInfo() : super();
  ShareInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ShareInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ShareInfo clone() => new ShareInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ShareInfo create() => new ShareInfo();
  static PbList<ShareInfo> createRepeated() => new PbList<ShareInfo>();
  static ShareInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyShareInfo();
    return _defaultInstance;
  }
  static ShareInfo _defaultInstance;
  static void $checkItem(ShareInfo v) {
    if (v is! ShareInfo) checkItemFailed(v, 'ShareInfo');
  }

  int get userId => $_get(0, 1, 0);
  set userId(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasUserId() => $_has(0, 1);
  void clearUserId() => clearField(1);

  int get shareUserId => $_get(1, 2, 0);
  set shareUserId(int v) { $_setUnsignedInt32(1, 2, v); }
  bool hasShareUserId() => $_has(1, 2);
  void clearShareUserId() => clearField(2);

  String get deviceId => $_get(2, 3, '');
  set deviceId(String v) { $_setString(2, 3, v); }
  bool hasDeviceId() => $_has(2, 3);
  void clearDeviceId() => clearField(3);

  String get deviceName => $_get(3, 4, '');
  set deviceName(String v) { $_setString(3, 4, v); }
  bool hasDeviceName() => $_has(3, 4);
  void clearDeviceName() => clearField(4);

  int get createTime => $_get(4, 5, 0);
  set createTime(int v) { $_setUnsignedInt32(4, 5, v); }
  bool hasCreateTime() => $_has(4, 5);
  void clearCreateTime() => clearField(5);
}

class _ReadonlyShareInfo extends ShareInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<int>(11, 'page', PbFieldType.OU3)
    ..a<int>(12, 'pageSize', PbFieldType.OU3)
    ..a<int>(21, 'shareUserId', PbFieldType.OU3)
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

  int get page => $_get(1, 11, 0);
  set page(int v) { $_setUnsignedInt32(1, 11, v); }
  bool hasPage() => $_has(1, 11);
  void clearPage() => clearField(11);

  int get pageSize => $_get(2, 12, 0);
  set pageSize(int v) { $_setUnsignedInt32(2, 12, v); }
  bool hasPageSize() => $_has(2, 12);
  void clearPageSize() => clearField(12);

  int get shareUserId => $_get(3, 21, 0);
  set shareUserId(int v) { $_setUnsignedInt32(3, 21, v); }
  bool hasShareUserId() => $_has(3, 21);
  void clearShareUserId() => clearField(21);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<int>(1, 'total', PbFieldType.OU3)
    ..pp<ShareInfo>(2, 'shares', PbFieldType.PM, ShareInfo.$checkItem, ShareInfo.create)
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

  List<ShareInfo> get shares => $_get(1, 2, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

