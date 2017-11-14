///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library ProductCmdAdd_ProductCmdAdd;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class CmdInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('CmdInfo')
    ..a<int>(13, 'cmdid', PbFieldType.OU3)
    ..a<int>(14, 'cmdType', PbFieldType.OU3)
    ..a<String>(15, 'argV', PbFieldType.OS)
    ..a<String>(16, 'argType', PbFieldType.OS)
    ..a<String>(17, 'argDetailEn', PbFieldType.OS)
    ..a<String>(18, 'argDetailCn', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  CmdInfo() : super();
  CmdInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CmdInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CmdInfo clone() => new CmdInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static CmdInfo create() => new CmdInfo();
  static PbList<CmdInfo> createRepeated() => new PbList<CmdInfo>();
  static CmdInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyCmdInfo();
    return _defaultInstance;
  }
  static CmdInfo _defaultInstance;
  static void $checkItem(CmdInfo v) {
    if (v is! CmdInfo) checkItemFailed(v, 'CmdInfo');
  }

  int get cmdid => $_get(0, 13, 0);
  set cmdid(int v) { $_setUnsignedInt32(0, 13, v); }
  bool hasCmdid() => $_has(0, 13);
  void clearCmdid() => clearField(13);

  int get cmdType => $_get(1, 14, 0);
  set cmdType(int v) { $_setUnsignedInt32(1, 14, v); }
  bool hasCmdType() => $_has(1, 14);
  void clearCmdType() => clearField(14);

  String get argV => $_get(2, 15, '');
  set argV(String v) { $_setString(2, 15, v); }
  bool hasArgV() => $_has(2, 15);
  void clearArgV() => clearField(15);

  String get argType => $_get(3, 16, '');
  set argType(String v) { $_setString(3, 16, v); }
  bool hasArgType() => $_has(3, 16);
  void clearArgType() => clearField(16);

  String get argDetailEn => $_get(4, 17, '');
  set argDetailEn(String v) { $_setString(4, 17, v); }
  bool hasArgDetailEn() => $_has(4, 17);
  void clearArgDetailEn() => clearField(17);

  String get argDetailCn => $_get(5, 18, '');
  set argDetailCn(String v) { $_setString(5, 18, v); }
  bool hasArgDetailCn() => $_has(5, 18);
  void clearArgDetailCn() => clearField(18);
}

class _ReadonlyCmdInfo extends CmdInfo with ReadonlyMessageMixin {}

class CmdAns extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('CmdAns')
    ..a<int>(11, 'cmdid', PbFieldType.OU3)
    ..a<int>(12, 'code', PbFieldType.OU3)
    ..a<String>(13, 'codeMsg', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  CmdAns() : super();
  CmdAns.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CmdAns.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CmdAns clone() => new CmdAns()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static CmdAns create() => new CmdAns();
  static PbList<CmdAns> createRepeated() => new PbList<CmdAns>();
  static CmdAns getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyCmdAns();
    return _defaultInstance;
  }
  static CmdAns _defaultInstance;
  static void $checkItem(CmdAns v) {
    if (v is! CmdAns) checkItemFailed(v, 'CmdAns');
  }

  int get cmdid => $_get(0, 11, 0);
  set cmdid(int v) { $_setUnsignedInt32(0, 11, v); }
  bool hasCmdid() => $_has(0, 11);
  void clearCmdid() => clearField(11);

  int get code => $_get(1, 12, 0);
  set code(int v) { $_setUnsignedInt32(1, 12, v); }
  bool hasCode() => $_has(1, 12);
  void clearCode() => clearField(12);

  String get codeMsg => $_get(2, 13, '');
  set codeMsg(String v) { $_setString(2, 13, v); }
  bool hasCodeMsg() => $_has(2, 13);
  void clearCodeMsg() => clearField(13);
}

class _ReadonlyCmdAns extends CmdAns with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(11, 'productCode', PbFieldType.OS)
    ..a<int>(12, 'romVer', PbFieldType.OU3)
    ..pp<CmdInfo>(13, 'cmds', PbFieldType.PM, CmdInfo.$checkItem, CmdInfo.create)
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

  List<CmdInfo> get cmds => $_get(3, 13, null);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<CmdAns>(11, 'ans', PbFieldType.PM, CmdAns.$checkItem, CmdAns.create)
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

  List<CmdAns> get ans => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

