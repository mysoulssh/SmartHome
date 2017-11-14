///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library RelationList_RelationList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class RelationInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RelationInfo')
    ..a<int>(1, 'relationCode', PbFieldType.OU3)
    ..a<String>(2, 'relationDesc', PbFieldType.OS)
    ..a<int>(3, 'isDel', PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  RelationInfo() : super();
  RelationInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RelationInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RelationInfo clone() => new RelationInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static RelationInfo create() => new RelationInfo();
  static PbList<RelationInfo> createRepeated() => new PbList<RelationInfo>();
  static RelationInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyRelationInfo();
    return _defaultInstance;
  }
  static RelationInfo _defaultInstance;
  static void $checkItem(RelationInfo v) {
    if (v is! RelationInfo) checkItemFailed(v, 'RelationInfo');
  }

  int get relationCode => $_get(0, 1, 0);
  set relationCode(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasRelationCode() => $_has(0, 1);
  void clearRelationCode() => clearField(1);

  String get relationDesc => $_get(1, 2, '');
  set relationDesc(String v) { $_setString(1, 2, v); }
  bool hasRelationDesc() => $_has(1, 2);
  void clearRelationDesc() => clearField(2);

  int get isDel => $_get(2, 3, 0);
  set isDel(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasIsDel() => $_has(2, 3);
  void clearIsDel() => clearField(3);
}

class _ReadonlyRelationInfo extends RelationInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<int>(11, 'page', PbFieldType.OU3)
    ..a<int>(12, 'pageSize', PbFieldType.OU3)
    ..a<int>(21, 'relationCode', PbFieldType.OU3)
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

  int get relationCode => $_get(3, 21, 0);
  set relationCode(int v) { $_setUnsignedInt32(3, 21, v); }
  bool hasRelationCode() => $_has(3, 21);
  void clearRelationCode() => clearField(21);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<int>(1, 'total', PbFieldType.OU3)
    ..pp<RelationInfo>(11, 'ris', PbFieldType.PM, RelationInfo.$checkItem, RelationInfo.create)
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

  List<RelationInfo> get ris => $_get(1, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

