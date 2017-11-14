///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library HouseMemberList_HouseMemberList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class MemberInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('MemberInfo')
    ..a<int>(1, 'userId', PbFieldType.OU3)
    ..a<int>(2, 'role', PbFieldType.O3)
    ..a<int>(3, 'isConfirm', PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  MemberInfo() : super();
  MemberInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  MemberInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  MemberInfo clone() => new MemberInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static MemberInfo create() => new MemberInfo();
  static PbList<MemberInfo> createRepeated() => new PbList<MemberInfo>();
  static MemberInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyMemberInfo();
    return _defaultInstance;
  }
  static MemberInfo _defaultInstance;
  static void $checkItem(MemberInfo v) {
    if (v is! MemberInfo) checkItemFailed(v, 'MemberInfo');
  }

  int get userId => $_get(0, 1, 0);
  set userId(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasUserId() => $_has(0, 1);
  void clearUserId() => clearField(1);

  int get role => $_get(1, 2, 0);
  set role(int v) { $_setUnsignedInt32(1, 2, v); }
  bool hasRole() => $_has(1, 2);
  void clearRole() => clearField(2);

  int get isConfirm => $_get(2, 3, 0);
  set isConfirm(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasIsConfirm() => $_has(2, 3);
  void clearIsConfirm() => clearField(3);
}

class _ReadonlyMemberInfo extends MemberInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(11, 'houseGuid', PbFieldType.OS)
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

  String get houseGuid => $_get(1, 11, '');
  set houseGuid(String v) { $_setString(1, 11, v); }
  bool hasHouseGuid() => $_has(1, 11);
  void clearHouseGuid() => clearField(11);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<MemberInfo>(2, 'users', PbFieldType.PM, MemberInfo.$checkItem, MemberInfo.create)
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

  List<MemberInfo> get users => $_get(0, 2, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

