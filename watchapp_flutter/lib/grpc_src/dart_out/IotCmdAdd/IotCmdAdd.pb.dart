///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library IotCmdAdd_IotCmdAdd;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(10, 'prodtCode', PbFieldType.OS)
    ..a<int>(11, 'cmdid', PbFieldType.OU3)
    ..a<int>(12, 'cmdType', PbFieldType.OU3)
    ..a<String>(13, 'detailEn', PbFieldType.OS)
    ..a<String>(14, 'detailCn', PbFieldType.OS)
    ..a<String>(15, 'argType', PbFieldType.OS)
    ..a<String>(16, 'argV', PbFieldType.OS)
    ..a<String>(17, 'argDetailEn', PbFieldType.OS)
    ..a<String>(18, 'argDetailCn', PbFieldType.OS)
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

  String get prodtCode => $_get(1, 10, '');
  set prodtCode(String v) { $_setString(1, 10, v); }
  bool hasProdtCode() => $_has(1, 10);
  void clearProdtCode() => clearField(10);

  int get cmdid => $_get(2, 11, 0);
  set cmdid(int v) { $_setUnsignedInt32(2, 11, v); }
  bool hasCmdid() => $_has(2, 11);
  void clearCmdid() => clearField(11);

  int get cmdType => $_get(3, 12, 0);
  set cmdType(int v) { $_setUnsignedInt32(3, 12, v); }
  bool hasCmdType() => $_has(3, 12);
  void clearCmdType() => clearField(12);

  String get detailEn => $_get(4, 13, '');
  set detailEn(String v) { $_setString(4, 13, v); }
  bool hasDetailEn() => $_has(4, 13);
  void clearDetailEn() => clearField(13);

  String get detailCn => $_get(5, 14, '');
  set detailCn(String v) { $_setString(5, 14, v); }
  bool hasDetailCn() => $_has(5, 14);
  void clearDetailCn() => clearField(14);

  String get argType => $_get(6, 15, '');
  set argType(String v) { $_setString(6, 15, v); }
  bool hasArgType() => $_has(6, 15);
  void clearArgType() => clearField(15);

  String get argV => $_get(7, 16, '');
  set argV(String v) { $_setString(7, 16, v); }
  bool hasArgV() => $_has(7, 16);
  void clearArgV() => clearField(16);

  String get argDetailEn => $_get(8, 17, '');
  set argDetailEn(String v) { $_setString(8, 17, v); }
  bool hasArgDetailEn() => $_has(8, 17);
  void clearArgDetailEn() => clearField(17);

  String get argDetailCn => $_get(9, 18, '');
  set argDetailCn(String v) { $_setString(9, 18, v); }
  bool hasArgDetailCn() => $_has(9, 18);
  void clearArgDetailCn() => clearField(18);
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

