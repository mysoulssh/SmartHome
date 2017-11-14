///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library CompanyAdd_CompanyAdd;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(11, 'name', PbFieldType.OS)
    ..a<String>(12, 'addr', PbFieldType.OS)
    ..a<String>(13, 'agencyCode', PbFieldType.OS)
    ..a<String>(14, 'fileIds', PbFieldType.OS)
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

  String get name => $_get(1, 11, '');
  set name(String v) { $_setString(1, 11, v); }
  bool hasName() => $_has(1, 11);
  void clearName() => clearField(11);

  String get addr => $_get(2, 12, '');
  set addr(String v) { $_setString(2, 12, v); }
  bool hasAddr() => $_has(2, 12);
  void clearAddr() => clearField(12);

  String get agencyCode => $_get(3, 13, '');
  set agencyCode(String v) { $_setString(3, 13, v); }
  bool hasAgencyCode() => $_has(3, 13);
  void clearAgencyCode() => clearField(13);

  String get fileIds => $_get(4, 14, '');
  set fileIds(String v) { $_setString(4, 14, v); }
  bool hasFileIds() => $_has(4, 14);
  void clearFileIds() => clearField(14);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<String>(11, 'companyCode', PbFieldType.OS)
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

  String get companyCode => $_get(0, 11, '');
  set companyCode(String v) { $_setString(0, 11, v); }
  bool hasCompanyCode() => $_has(0, 11);
  void clearCompanyCode() => clearField(11);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

