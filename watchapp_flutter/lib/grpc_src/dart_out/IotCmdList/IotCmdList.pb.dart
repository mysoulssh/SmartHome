///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library IotCmdList_IotCmdList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class IotCmd extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('IotCmd')
    ..a<int>(1, 'cmdid', PbFieldType.OU3)
    ..a<int>(2, 'cmdType', PbFieldType.OU3)
    ..a<String>(3, 'detailEn', PbFieldType.OS)
    ..a<String>(4, 'detailCn', PbFieldType.OS)
    ..a<String>(5, 'argType', PbFieldType.OS)
    ..a<String>(6, 'argV', PbFieldType.OS)
    ..a<String>(7, 'argDetailEn', PbFieldType.OS)
    ..a<String>(8, 'argDetailCn', PbFieldType.OS)
    ..a<String>(9, 'prodtCode', PbFieldType.OS)
    ..a<int>(11, 'isReview', PbFieldType.OU3)
    ..a<String>(12, 'reviewMark', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  IotCmd() : super();
  IotCmd.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  IotCmd.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  IotCmd clone() => new IotCmd()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static IotCmd create() => new IotCmd();
  static PbList<IotCmd> createRepeated() => new PbList<IotCmd>();
  static IotCmd getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyIotCmd();
    return _defaultInstance;
  }
  static IotCmd _defaultInstance;
  static void $checkItem(IotCmd v) {
    if (v is! IotCmd) checkItemFailed(v, 'IotCmd');
  }

  int get cmdid => $_get(0, 1, 0);
  set cmdid(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasCmdid() => $_has(0, 1);
  void clearCmdid() => clearField(1);

  int get cmdType => $_get(1, 2, 0);
  set cmdType(int v) { $_setUnsignedInt32(1, 2, v); }
  bool hasCmdType() => $_has(1, 2);
  void clearCmdType() => clearField(2);

  String get detailEn => $_get(2, 3, '');
  set detailEn(String v) { $_setString(2, 3, v); }
  bool hasDetailEn() => $_has(2, 3);
  void clearDetailEn() => clearField(3);

  String get detailCn => $_get(3, 4, '');
  set detailCn(String v) { $_setString(3, 4, v); }
  bool hasDetailCn() => $_has(3, 4);
  void clearDetailCn() => clearField(4);

  String get argType => $_get(4, 5, '');
  set argType(String v) { $_setString(4, 5, v); }
  bool hasArgType() => $_has(4, 5);
  void clearArgType() => clearField(5);

  String get argV => $_get(5, 6, '');
  set argV(String v) { $_setString(5, 6, v); }
  bool hasArgV() => $_has(5, 6);
  void clearArgV() => clearField(6);

  String get argDetailEn => $_get(6, 7, '');
  set argDetailEn(String v) { $_setString(6, 7, v); }
  bool hasArgDetailEn() => $_has(6, 7);
  void clearArgDetailEn() => clearField(7);

  String get argDetailCn => $_get(7, 8, '');
  set argDetailCn(String v) { $_setString(7, 8, v); }
  bool hasArgDetailCn() => $_has(7, 8);
  void clearArgDetailCn() => clearField(8);

  String get prodtCode => $_get(8, 9, '');
  set prodtCode(String v) { $_setString(8, 9, v); }
  bool hasProdtCode() => $_has(8, 9);
  void clearProdtCode() => clearField(9);

  int get isReview => $_get(9, 11, 0);
  set isReview(int v) { $_setUnsignedInt32(9, 11, v); }
  bool hasIsReview() => $_has(9, 11);
  void clearIsReview() => clearField(11);

  String get reviewMark => $_get(10, 12, '');
  set reviewMark(String v) { $_setString(10, 12, v); }
  bool hasReviewMark() => $_has(10, 12);
  void clearReviewMark() => clearField(12);
}

class _ReadonlyIotCmd extends IotCmd with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<int>(11, 'page', PbFieldType.OU3)
    ..a<int>(12, 'pageSize', PbFieldType.OU3)
    ..a<int>(22, 'cmdid', PbFieldType.OU3)
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

  int get cmdid => $_get(3, 22, 0);
  set cmdid(int v) { $_setUnsignedInt32(3, 22, v); }
  bool hasCmdid() => $_has(3, 22);
  void clearCmdid() => clearField(22);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<int>(11, 'total', PbFieldType.OU3)
    ..pp<IotCmd>(12, 'cmds', PbFieldType.PM, IotCmd.$checkItem, IotCmd.create)
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

  List<IotCmd> get cmds => $_get(1, 12, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

