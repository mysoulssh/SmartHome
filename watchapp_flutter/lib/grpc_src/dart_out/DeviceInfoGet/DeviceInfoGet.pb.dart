///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceInfoGet_DeviceInfoGet;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class DeviceInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DeviceInfo')
    ..a<String>(1, 'deviceId', PbFieldType.OS)
    ..a<int>(3, 'swVer', PbFieldType.O3)
    ..a<int>(4, 'hwVer', PbFieldType.O3)
    ..p<String>(5, 'prodtCode', PbFieldType.PS)
    ..p<int>(6, 'nbiCode', PbFieldType.P3)
    ..a<String>(7, 'productCode', PbFieldType.OS)
    ..a<String>(8, 'productName', PbFieldType.OS)
    ..a<String>(9, 'companyCode', PbFieldType.OS)
    ..a<String>(12, 'pic1Fileid', PbFieldType.OS)
    ..a<String>(13, 'pic2Fileid', PbFieldType.OS)
    ..a<String>(14, 'pic3Fileid', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  DeviceInfo() : super();
  DeviceInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DeviceInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DeviceInfo clone() => new DeviceInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static DeviceInfo create() => new DeviceInfo();
  static PbList<DeviceInfo> createRepeated() => new PbList<DeviceInfo>();
  static DeviceInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDeviceInfo();
    return _defaultInstance;
  }
  static DeviceInfo _defaultInstance;
  static void $checkItem(DeviceInfo v) {
    if (v is! DeviceInfo) checkItemFailed(v, 'DeviceInfo');
  }

  String get deviceId => $_get(0, 1, '');
  set deviceId(String v) { $_setString(0, 1, v); }
  bool hasDeviceId() => $_has(0, 1);
  void clearDeviceId() => clearField(1);

  int get swVer => $_get(1, 3, 0);
  set swVer(int v) { $_setUnsignedInt32(1, 3, v); }
  bool hasSwVer() => $_has(1, 3);
  void clearSwVer() => clearField(3);

  int get hwVer => $_get(2, 4, 0);
  set hwVer(int v) { $_setUnsignedInt32(2, 4, v); }
  bool hasHwVer() => $_has(2, 4);
  void clearHwVer() => clearField(4);

  List<String> get prodtCode => $_get(3, 5, null);

  List<int> get nbiCode => $_get(4, 6, null);

  String get productCode => $_get(5, 7, '');
  set productCode(String v) { $_setString(5, 7, v); }
  bool hasProductCode() => $_has(5, 7);
  void clearProductCode() => clearField(7);

  String get productName => $_get(6, 8, '');
  set productName(String v) { $_setString(6, 8, v); }
  bool hasProductName() => $_has(6, 8);
  void clearProductName() => clearField(8);

  String get companyCode => $_get(7, 9, '');
  set companyCode(String v) { $_setString(7, 9, v); }
  bool hasCompanyCode() => $_has(7, 9);
  void clearCompanyCode() => clearField(9);

  String get pic1Fileid => $_get(8, 12, '');
  set pic1Fileid(String v) { $_setString(8, 12, v); }
  bool hasPic1Fileid() => $_has(8, 12);
  void clearPic1Fileid() => clearField(12);

  String get pic2Fileid => $_get(9, 13, '');
  set pic2Fileid(String v) { $_setString(9, 13, v); }
  bool hasPic2Fileid() => $_has(9, 13);
  void clearPic2Fileid() => clearField(13);

  String get pic3Fileid => $_get(10, 14, '');
  set pic3Fileid(String v) { $_setString(10, 14, v); }
  bool hasPic3Fileid() => $_has(10, 14);
  void clearPic3Fileid() => clearField(14);
}

class _ReadonlyDeviceInfo extends DeviceInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..p<String>(11, 'deviceId', PbFieldType.PS)
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

  List<String> get deviceId => $_get(1, 11, null);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<DeviceInfo>(11, 'vers', PbFieldType.PM, DeviceInfo.$checkItem, DeviceInfo.create)
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

  List<DeviceInfo> get vers => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

