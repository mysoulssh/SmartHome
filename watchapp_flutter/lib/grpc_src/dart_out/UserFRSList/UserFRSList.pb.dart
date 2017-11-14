///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library UserFRSList_UserFRSList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class FRSInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('FRSInfo')
    ..a<String>(1, 'userName', PbFieldType.OS)
    ..a<int>(2, 'relationCode', PbFieldType.OU3)
    ..a<int>(3, 'isConfirm', PbFieldType.OU3)
    ..a<int>(4, 'createTime', PbFieldType.OU3)
    ..a<int>(6, 'userId', PbFieldType.OU3)
    ..a<int>(7, 'relationUserId', PbFieldType.OU3)
    ..a<String>(9, 'remark', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  FRSInfo() : super();
  FRSInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  FRSInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  FRSInfo clone() => new FRSInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static FRSInfo create() => new FRSInfo();
  static PbList<FRSInfo> createRepeated() => new PbList<FRSInfo>();
  static FRSInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyFRSInfo();
    return _defaultInstance;
  }
  static FRSInfo _defaultInstance;
  static void $checkItem(FRSInfo v) {
    if (v is! FRSInfo) checkItemFailed(v, 'FRSInfo');
  }

  String get userName => $_get(0, 1, '');
  set userName(String v) { $_setString(0, 1, v); }
  bool hasUserName() => $_has(0, 1);
  void clearUserName() => clearField(1);

  int get relationCode => $_get(1, 2, 0);
  set relationCode(int v) { $_setUnsignedInt32(1, 2, v); }
  bool hasRelationCode() => $_has(1, 2);
  void clearRelationCode() => clearField(2);

  int get isConfirm => $_get(2, 3, 0);
  set isConfirm(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasIsConfirm() => $_has(2, 3);
  void clearIsConfirm() => clearField(3);

  int get createTime => $_get(3, 4, 0);
  set createTime(int v) { $_setUnsignedInt32(3, 4, v); }
  bool hasCreateTime() => $_has(3, 4);
  void clearCreateTime() => clearField(4);

  int get userId => $_get(4, 6, 0);
  set userId(int v) { $_setUnsignedInt32(4, 6, v); }
  bool hasUserId() => $_has(4, 6);
  void clearUserId() => clearField(6);

  int get relationUserId => $_get(5, 7, 0);
  set relationUserId(int v) { $_setUnsignedInt32(5, 7, v); }
  bool hasRelationUserId() => $_has(5, 7);
  void clearRelationUserId() => clearField(7);

  String get remark => $_get(6, 9, '');
  set remark(String v) { $_setString(6, 9, v); }
  bool hasRemark() => $_has(6, 9);
  void clearRemark() => clearField(9);
}

class _ReadonlyFRSInfo extends FRSInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
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
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<FRSInfo>(11, 'frs', PbFieldType.PM, FRSInfo.$checkItem, FRSInfo.create)
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

  List<FRSInfo> get frs => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

