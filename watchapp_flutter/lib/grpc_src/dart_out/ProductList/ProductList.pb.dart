///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library ProductList_ProductList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class ProductInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ProductInfo')
    ..a<String>(1, 'productName', PbFieldType.OS)
    ..a<String>(2, 'companyCode', PbFieldType.OS)
    ..a<String>(3, 'pic1', PbFieldType.OS)
    ..a<String>(4, 'pic2', PbFieldType.OS)
    ..a<String>(5, 'remark', PbFieldType.OS)
    ..a<int>(6, 'isReview', PbFieldType.OU3)
    ..a<String>(7, 'reviewMark', PbFieldType.OS)
    ..p<String>(16, 'nbiCode', PbFieldType.PS)
    ..p<String>(17, 'prodtCode', PbFieldType.PS)
    ..hasRequiredFields = false
  ;

  ProductInfo() : super();
  ProductInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ProductInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ProductInfo clone() => new ProductInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ProductInfo create() => new ProductInfo();
  static PbList<ProductInfo> createRepeated() => new PbList<ProductInfo>();
  static ProductInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyProductInfo();
    return _defaultInstance;
  }
  static ProductInfo _defaultInstance;
  static void $checkItem(ProductInfo v) {
    if (v is! ProductInfo) checkItemFailed(v, 'ProductInfo');
  }

  String get productName => $_get(0, 1, '');
  set productName(String v) { $_setString(0, 1, v); }
  bool hasProductName() => $_has(0, 1);
  void clearProductName() => clearField(1);

  String get companyCode => $_get(1, 2, '');
  set companyCode(String v) { $_setString(1, 2, v); }
  bool hasCompanyCode() => $_has(1, 2);
  void clearCompanyCode() => clearField(2);

  String get pic1 => $_get(2, 3, '');
  set pic1(String v) { $_setString(2, 3, v); }
  bool hasPic1() => $_has(2, 3);
  void clearPic1() => clearField(3);

  String get pic2 => $_get(3, 4, '');
  set pic2(String v) { $_setString(3, 4, v); }
  bool hasPic2() => $_has(3, 4);
  void clearPic2() => clearField(4);

  String get remark => $_get(4, 5, '');
  set remark(String v) { $_setString(4, 5, v); }
  bool hasRemark() => $_has(4, 5);
  void clearRemark() => clearField(5);

  int get isReview => $_get(5, 6, 0);
  set isReview(int v) { $_setUnsignedInt32(5, 6, v); }
  bool hasIsReview() => $_has(5, 6);
  void clearIsReview() => clearField(6);

  String get reviewMark => $_get(6, 7, '');
  set reviewMark(String v) { $_setString(6, 7, v); }
  bool hasReviewMark() => $_has(6, 7);
  void clearReviewMark() => clearField(7);

  List<String> get nbiCode => $_get(7, 16, null);

  List<String> get prodtCode => $_get(8, 17, null);
}

class _ReadonlyProductInfo extends ProductInfo with ReadonlyMessageMixin {}

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
    ..pp<ProductInfo>(12, 'products', PbFieldType.PM, ProductInfo.$checkItem, ProductInfo.create)
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

  List<ProductInfo> get products => $_get(1, 12, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

