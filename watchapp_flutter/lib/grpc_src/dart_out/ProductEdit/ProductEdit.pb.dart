///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library ProductEdit_ProductEdit;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(10, 'productCode', PbFieldType.OS)
    ..a<String>(11, 'productName', PbFieldType.OS)
    ..a<String>(12, 'companyCode', PbFieldType.OS)
    ..a<String>(13, 'pic1', PbFieldType.OS)
    ..a<String>(14, 'pic2', PbFieldType.OS)
    ..a<String>(15, 'remark', PbFieldType.OS)
    ..p<String>(16, 'nbiCode', PbFieldType.PS)
    ..p<String>(17, 'prodtCode', PbFieldType.PS)
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

  String get productCode => $_get(1, 10, '');
  set productCode(String v) { $_setString(1, 10, v); }
  bool hasProductCode() => $_has(1, 10);
  void clearProductCode() => clearField(10);

  String get productName => $_get(2, 11, '');
  set productName(String v) { $_setString(2, 11, v); }
  bool hasProductName() => $_has(2, 11);
  void clearProductName() => clearField(11);

  String get companyCode => $_get(3, 12, '');
  set companyCode(String v) { $_setString(3, 12, v); }
  bool hasCompanyCode() => $_has(3, 12);
  void clearCompanyCode() => clearField(12);

  String get pic1 => $_get(4, 13, '');
  set pic1(String v) { $_setString(4, 13, v); }
  bool hasPic1() => $_has(4, 13);
  void clearPic1() => clearField(13);

  String get pic2 => $_get(5, 14, '');
  set pic2(String v) { $_setString(5, 14, v); }
  bool hasPic2() => $_has(5, 14);
  void clearPic2() => clearField(14);

  String get remark => $_get(6, 15, '');
  set remark(String v) { $_setString(6, 15, v); }
  bool hasRemark() => $_has(6, 15);
  void clearRemark() => clearField(15);

  List<String> get nbiCode => $_get(7, 16, null);

  List<String> get prodtCode => $_get(8, 17, null);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<String>(11, 'productCode', PbFieldType.OS)
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

  String get productCode => $_get(0, 11, '');
  set productCode(String v) { $_setString(0, 11, v); }
  bool hasProductCode() => $_has(0, 11);
  void clearProductCode() => clearField(11);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

