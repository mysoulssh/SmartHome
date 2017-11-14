///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library ProductCmdList_ProductCmdList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class CmdList extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('CmdList')
    ..a<String>(11, 'productCode', PbFieldType.OS)
    ..a<int>(12, 'romVer', PbFieldType.OU3)
    ..a<int>(13, 'cmdid', PbFieldType.OU3)
    ..a<int>(14, 'cmdType', PbFieldType.OU3)
    ..a<String>(15, 'argV', PbFieldType.OS)
    ..a<String>(16, 'argType', PbFieldType.OS)
    ..a<String>(17, 'argDetailEn', PbFieldType.OS)
    ..a<String>(18, 'argDetailCn', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  CmdList() : super();
  CmdList.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CmdList.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CmdList clone() => new CmdList()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static CmdList create() => new CmdList();
  static PbList<CmdList> createRepeated() => new PbList<CmdList>();
  static CmdList getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyCmdList();
    return _defaultInstance;
  }
  static CmdList _defaultInstance;
  static void $checkItem(CmdList v) {
    if (v is! CmdList) checkItemFailed(v, 'CmdList');
  }

  String get productCode => $_get(0, 11, '');
  set productCode(String v) { $_setString(0, 11, v); }
  bool hasProductCode() => $_has(0, 11);
  void clearProductCode() => clearField(11);

  int get romVer => $_get(1, 12, 0);
  set romVer(int v) { $_setUnsignedInt32(1, 12, v); }
  bool hasRomVer() => $_has(1, 12);
  void clearRomVer() => clearField(12);

  int get cmdid => $_get(2, 13, 0);
  set cmdid(int v) { $_setUnsignedInt32(2, 13, v); }
  bool hasCmdid() => $_has(2, 13);
  void clearCmdid() => clearField(13);

  int get cmdType => $_get(3, 14, 0);
  set cmdType(int v) { $_setUnsignedInt32(3, 14, v); }
  bool hasCmdType() => $_has(3, 14);
  void clearCmdType() => clearField(14);

  String get argV => $_get(4, 15, '');
  set argV(String v) { $_setString(4, 15, v); }
  bool hasArgV() => $_has(4, 15);
  void clearArgV() => clearField(15);

  String get argType => $_get(5, 16, '');
  set argType(String v) { $_setString(5, 16, v); }
  bool hasArgType() => $_has(5, 16);
  void clearArgType() => clearField(16);

  String get argDetailEn => $_get(6, 17, '');
  set argDetailEn(String v) { $_setString(6, 17, v); }
  bool hasArgDetailEn() => $_has(6, 17);
  void clearArgDetailEn() => clearField(17);

  String get argDetailCn => $_get(7, 18, '');
  set argDetailCn(String v) { $_setString(7, 18, v); }
  bool hasArgDetailCn() => $_has(7, 18);
  void clearArgDetailCn() => clearField(18);
}

class _ReadonlyCmdList extends CmdList with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<int>(11, 'page', PbFieldType.OU3)
    ..a<int>(12, 'pageSize', PbFieldType.OU3)
    ..a<String>(21, 'productCode', PbFieldType.OS)
    ..a<int>(22, 'romVer', PbFieldType.OU3)
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

  String get productCode => $_get(3, 21, '');
  set productCode(String v) { $_setString(3, 21, v); }
  bool hasProductCode() => $_has(3, 21);
  void clearProductCode() => clearField(21);

  int get romVer => $_get(4, 22, 0);
  set romVer(int v) { $_setUnsignedInt32(4, 22, v); }
  bool hasRomVer() => $_has(4, 22);
  void clearRomVer() => clearField(22);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<int>(11, 'total', PbFieldType.OU3)
    ..pp<CmdList>(12, 'cmds', PbFieldType.PM, CmdList.$checkItem, CmdList.create)
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

  List<CmdList> get cmds => $_get(1, 12, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

