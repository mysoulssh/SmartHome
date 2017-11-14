///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceRomAdd_DeviceRomAdd;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(11, 'productCode', PbFieldType.OS)
    ..a<int>(12, 'romVer', PbFieldType.OU3)
    ..a<String>(13, 'romMd5', PbFieldType.OS)
    ..a<String>(14, 'fileId', PbFieldType.OS)
    ..a<String>(15, 'changeLog', PbFieldType.OS)
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

  String get romMd5 => $_get(3, 13, '');
  set romMd5(String v) { $_setString(3, 13, v); }
  bool hasRomMd5() => $_has(3, 13);
  void clearRomMd5() => clearField(13);

  String get fileId => $_get(4, 14, '');
  set fileId(String v) { $_setString(4, 14, v); }
  bool hasFileId() => $_has(4, 14);
  void clearFileId() => clearField(14);

  String get changeLog => $_get(5, 15, '');
  set changeLog(String v) { $_setString(5, 15, v); }
  bool hasChangeLog() => $_has(5, 15);
  void clearChangeLog() => clearField(15);
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

