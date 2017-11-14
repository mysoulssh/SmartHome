///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library ProductCmdEdit_ProductCmdEdit;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(11, 'productCode', PbFieldType.OS)
    ..a<int>(12, 'romVer', PbFieldType.OU3)
    ..a<int>(23, 'cmdid', PbFieldType.OU3)
    ..a<int>(24, 'cmdType', PbFieldType.OU3)
    ..a<String>(25, 'argV', PbFieldType.OS)
    ..a<String>(26, 'argType', PbFieldType.OS)
    ..a<String>(27, 'argDetailEn', PbFieldType.OS)
    ..a<String>(28, 'argDetailCn', PbFieldType.OS)
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

  String get productCode => $_get(1, 11, '');
  set productCode(String v) { $_setString(1, 11, v); }
  bool hasProductCode() => $_has(1, 11);
  void clearProductCode() => clearField(11);

  int get romVer => $_get(2, 12, 0);
  set romVer(int v) { $_setUnsignedInt32(2, 12, v); }
  bool hasRomVer() => $_has(2, 12);
  void clearRomVer() => clearField(12);

  int get cmdid => $_get(3, 23, 0);
  set cmdid(int v) { $_setUnsignedInt32(3, 23, v); }
  bool hasCmdid() => $_has(3, 23);
  void clearCmdid() => clearField(23);

  int get cmdType => $_get(4, 24, 0);
  set cmdType(int v) { $_setUnsignedInt32(4, 24, v); }
  bool hasCmdType() => $_has(4, 24);
  void clearCmdType() => clearField(24);

  String get argV => $_get(5, 25, '');
  set argV(String v) { $_setString(5, 25, v); }
  bool hasArgV() => $_has(5, 25);
  void clearArgV() => clearField(25);

  String get argType => $_get(6, 26, '');
  set argType(String v) { $_setString(6, 26, v); }
  bool hasArgType() => $_has(6, 26);
  void clearArgType() => clearField(26);

  String get argDetailEn => $_get(7, 27, '');
  set argDetailEn(String v) { $_setString(7, 27, v); }
  bool hasArgDetailEn() => $_has(7, 27);
  void clearArgDetailEn() => clearField(27);

  String get argDetailCn => $_get(8, 28, '');
  set argDetailCn(String v) { $_setString(8, 28, v); }
  bool hasArgDetailCn() => $_has(8, 28);
  void clearArgDetailCn() => clearField(28);
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

