///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceRomList_DeviceRomList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class RomInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RomInfo')
    ..a<String>(11, 'productCode', PbFieldType.OS)
    ..a<int>(12, 'romVer', PbFieldType.OU3)
    ..a<String>(13, 'romMd5', PbFieldType.OS)
    ..a<String>(14, 'fileId', PbFieldType.OS)
    ..a<String>(15, 'changeLog', PbFieldType.OS)
    ..a<int>(21, 'isReview', PbFieldType.OU3)
    ..a<String>(22, 'reviewMark', PbFieldType.OS)
    ..a<int>(23, 'reviewUid', PbFieldType.OU3)
    ..a<int>(24, 'reviewTime', PbFieldType.OU3)
    ..a<int>(25, 'isLast', PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  RomInfo() : super();
  RomInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RomInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RomInfo clone() => new RomInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static RomInfo create() => new RomInfo();
  static PbList<RomInfo> createRepeated() => new PbList<RomInfo>();
  static RomInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyRomInfo();
    return _defaultInstance;
  }
  static RomInfo _defaultInstance;
  static void $checkItem(RomInfo v) {
    if (v is! RomInfo) checkItemFailed(v, 'RomInfo');
  }

  String get productCode => $_get(0, 11, '');
  set productCode(String v) { $_setString(0, 11, v); }
  bool hasProductCode() => $_has(0, 11);
  void clearProductCode() => clearField(11);

  int get romVer => $_get(1, 12, 0);
  set romVer(int v) { $_setUnsignedInt32(1, 12, v); }
  bool hasRomVer() => $_has(1, 12);
  void clearRomVer() => clearField(12);

  String get romMd5 => $_get(2, 13, '');
  set romMd5(String v) { $_setString(2, 13, v); }
  bool hasRomMd5() => $_has(2, 13);
  void clearRomMd5() => clearField(13);

  String get fileId => $_get(3, 14, '');
  set fileId(String v) { $_setString(3, 14, v); }
  bool hasFileId() => $_has(3, 14);
  void clearFileId() => clearField(14);

  String get changeLog => $_get(4, 15, '');
  set changeLog(String v) { $_setString(4, 15, v); }
  bool hasChangeLog() => $_has(4, 15);
  void clearChangeLog() => clearField(15);

  int get isReview => $_get(5, 21, 0);
  set isReview(int v) { $_setUnsignedInt32(5, 21, v); }
  bool hasIsReview() => $_has(5, 21);
  void clearIsReview() => clearField(21);

  String get reviewMark => $_get(6, 22, '');
  set reviewMark(String v) { $_setString(6, 22, v); }
  bool hasReviewMark() => $_has(6, 22);
  void clearReviewMark() => clearField(22);

  int get reviewUid => $_get(7, 23, 0);
  set reviewUid(int v) { $_setUnsignedInt32(7, 23, v); }
  bool hasReviewUid() => $_has(7, 23);
  void clearReviewUid() => clearField(23);

  int get reviewTime => $_get(8, 24, 0);
  set reviewTime(int v) { $_setUnsignedInt32(8, 24, v); }
  bool hasReviewTime() => $_has(8, 24);
  void clearReviewTime() => clearField(24);

  int get isLast => $_get(9, 25, 0);
  set isLast(int v) { $_setUnsignedInt32(9, 25, v); }
  bool hasIsLast() => $_has(9, 25);
  void clearIsLast() => clearField(25);
}

class _ReadonlyRomInfo extends RomInfo with ReadonlyMessageMixin {}

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
    ..pp<RomInfo>(12, 'roms', PbFieldType.PM, RomInfo.$checkItem, RomInfo.create)
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

  List<RomInfo> get roms => $_get(1, 12, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

