///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library IotCmdEdit_IotCmdEdit;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<int>(11, 'cmdid', PbFieldType.OU3)
    ..a<String>(21, 'prodtCode', PbFieldType.OS)
    ..a<int>(22, 'cmdType', PbFieldType.OU3)
    ..a<String>(23, 'detailEn', PbFieldType.OS)
    ..a<String>(24, 'detailCn', PbFieldType.OS)
    ..a<String>(25, 'argType', PbFieldType.OS)
    ..a<String>(26, 'argV', PbFieldType.OS)
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

  int get cmdid => $_get(1, 11, 0);
  set cmdid(int v) { $_setUnsignedInt32(1, 11, v); }
  bool hasCmdid() => $_has(1, 11);
  void clearCmdid() => clearField(11);

  String get prodtCode => $_get(2, 21, '');
  set prodtCode(String v) { $_setString(2, 21, v); }
  bool hasProdtCode() => $_has(2, 21);
  void clearProdtCode() => clearField(21);

  int get cmdType => $_get(3, 22, 0);
  set cmdType(int v) { $_setUnsignedInt32(3, 22, v); }
  bool hasCmdType() => $_has(3, 22);
  void clearCmdType() => clearField(22);

  String get detailEn => $_get(4, 23, '');
  set detailEn(String v) { $_setString(4, 23, v); }
  bool hasDetailEn() => $_has(4, 23);
  void clearDetailEn() => clearField(23);

  String get detailCn => $_get(5, 24, '');
  set detailCn(String v) { $_setString(5, 24, v); }
  bool hasDetailCn() => $_has(5, 24);
  void clearDetailCn() => clearField(24);

  String get argType => $_get(6, 25, '');
  set argType(String v) { $_setString(6, 25, v); }
  bool hasArgType() => $_has(6, 25);
  void clearArgType() => clearField(25);

  String get argV => $_get(7, 26, '');
  set argV(String v) { $_setString(7, 26, v); }
  bool hasArgV() => $_has(7, 26);
  void clearArgV() => clearField(26);

  String get argDetailEn => $_get(8, 27, '');
  set argDetailEn(String v) { $_setString(8, 27, v); }
  bool hasArgDetailEn() => $_has(8, 27);
  void clearArgDetailEn() => clearField(27);

  String get argDetailCn => $_get(9, 28, '');
  set argDetailCn(String v) { $_setString(9, 28, v); }
  bool hasArgDetailCn() => $_has(9, 28);
  void clearArgDetailCn() => clearField(28);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<int>(11, 'cmdid', PbFieldType.OU3)
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

  int get cmdid => $_get(0, 11, 0);
  set cmdid(int v) { $_setUnsignedInt32(0, 11, v); }
  bool hasCmdid() => $_has(0, 11);
  void clearCmdid() => clearField(11);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

