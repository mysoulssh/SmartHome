///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library ProdtList_ProdtList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class CompanyInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('CompanyInfo')
    ..a<String>(1, 'name', PbFieldType.OS)
    ..a<String>(2, 'companyCode', PbFieldType.OS)
    ..a<String>(3, 'addr', PbFieldType.OS)
    ..a<String>(4, 'agencyCode', PbFieldType.OS)
    ..a<String>(5, 'fileIds', PbFieldType.OS)
    ..a<int>(6, 'isReview', PbFieldType.OU3)
    ..a<String>(7, 'reviewMark', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  CompanyInfo() : super();
  CompanyInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CompanyInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CompanyInfo clone() => new CompanyInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static CompanyInfo create() => new CompanyInfo();
  static PbList<CompanyInfo> createRepeated() => new PbList<CompanyInfo>();
  static CompanyInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyCompanyInfo();
    return _defaultInstance;
  }
  static CompanyInfo _defaultInstance;
  static void $checkItem(CompanyInfo v) {
    if (v is! CompanyInfo) checkItemFailed(v, 'CompanyInfo');
  }

  String get name => $_get(0, 1, '');
  set name(String v) { $_setString(0, 1, v); }
  bool hasName() => $_has(0, 1);
  void clearName() => clearField(1);

  String get companyCode => $_get(1, 2, '');
  set companyCode(String v) { $_setString(1, 2, v); }
  bool hasCompanyCode() => $_has(1, 2);
  void clearCompanyCode() => clearField(2);

  String get addr => $_get(2, 3, '');
  set addr(String v) { $_setString(2, 3, v); }
  bool hasAddr() => $_has(2, 3);
  void clearAddr() => clearField(3);

  String get agencyCode => $_get(3, 4, '');
  set agencyCode(String v) { $_setString(3, 4, v); }
  bool hasAgencyCode() => $_has(3, 4);
  void clearAgencyCode() => clearField(4);

  String get fileIds => $_get(4, 5, '');
  set fileIds(String v) { $_setString(4, 5, v); }
  bool hasFileIds() => $_has(4, 5);
  void clearFileIds() => clearField(5);

  int get isReview => $_get(5, 6, 0);
  set isReview(int v) { $_setUnsignedInt32(5, 6, v); }
  bool hasIsReview() => $_has(5, 6);
  void clearIsReview() => clearField(6);

  String get reviewMark => $_get(6, 7, '');
  set reviewMark(String v) { $_setString(6, 7, v); }
  bool hasReviewMark() => $_has(6, 7);
  void clearReviewMark() => clearField(7);
}

class _ReadonlyCompanyInfo extends CompanyInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<int>(11, 'page', PbFieldType.OU3)
    ..a<int>(12, 'pageSize', PbFieldType.OU3)
    ..a<String>(21, 'companyCode', PbFieldType.OS)
    ..a<String>(22, 'name', PbFieldType.OS)
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

  String get companyCode => $_get(3, 21, '');
  set companyCode(String v) { $_setString(3, 21, v); }
  bool hasCompanyCode() => $_has(3, 21);
  void clearCompanyCode() => clearField(21);

  String get name => $_get(4, 22, '');
  set name(String v) { $_setString(4, 22, v); }
  bool hasName() => $_has(4, 22);
  void clearName() => clearField(22);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<int>(11, 'total', PbFieldType.OU3)
    ..pp<CompanyInfo>(12, 'companys', PbFieldType.PM, CompanyInfo.$checkItem, CompanyInfo.create)
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

  int get total => $_get(0, 11, 0);
  set total(int v) { $_setUnsignedInt32(0, 11, v); }
  bool hasTotal() => $_has(0, 11);
  void clearTotal() => clearField(11);

  List<CompanyInfo> get companys => $_get(1, 12, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

