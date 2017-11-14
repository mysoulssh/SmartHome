///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library UserAttrSet_UserAttrSet;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class Attr extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Attr')
    ..a<int>(1, 'itemId', PbFieldType.O3)
    ..a<String>(2, 'itemVstring', PbFieldType.OS)
    ..a<int>(3, 'itemVint32', PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Attr() : super();
  Attr.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Attr.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Attr clone() => new Attr()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Attr create() => new Attr();
  static PbList<Attr> createRepeated() => new PbList<Attr>();
  static Attr getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyAttr();
    return _defaultInstance;
  }
  static Attr _defaultInstance;
  static void $checkItem(Attr v) {
    if (v is! Attr) checkItemFailed(v, 'Attr');
  }

  int get itemId => $_get(0, 1, 0);
  set itemId(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasItemId() => $_has(0, 1);
  void clearItemId() => clearField(1);

  String get itemVstring => $_get(1, 2, '');
  set itemVstring(String v) { $_setString(1, 2, v); }
  bool hasItemVstring() => $_has(1, 2);
  void clearItemVstring() => clearField(2);

  int get itemVint32 => $_get(2, 3, 0);
  set itemVint32(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasItemVint32() => $_has(2, 3);
  void clearItemVint32() => clearField(3);
}

class _ReadonlyAttr extends Attr with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(11, 'userName', PbFieldType.OS)
    ..pp<Attr>(12, 'attrs', PbFieldType.PM, Attr.$checkItem, Attr.create)
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

  String get userName => $_get(1, 11, '');
  set userName(String v) { $_setString(1, 11, v); }
  bool hasUserName() => $_has(1, 11);
  void clearUserName() => clearField(11);

  List<Attr> get attrs => $_get(2, 12, null);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
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
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

