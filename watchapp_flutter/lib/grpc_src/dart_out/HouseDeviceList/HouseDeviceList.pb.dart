///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library HouseDeviceList_HouseDeviceList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class DeviceInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DeviceInfo')
    ..a<String>(1, 'deviceId', PbFieldType.OS)
    ..a<String>(2, 'deviceName', PbFieldType.OS)
    ..a<String>(3, 'subDeviceId', PbFieldType.OS)
    ..a<String>(4, 'houseGuid', PbFieldType.OS)
    ..a<String>(5, 'areaGuid', PbFieldType.OS)
    ..p<String>(6, 'prodtType', PbFieldType.PS)
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

  String get deviceName => $_get(1, 2, '');
  set deviceName(String v) { $_setString(1, 2, v); }
  bool hasDeviceName() => $_has(1, 2);
  void clearDeviceName() => clearField(2);

  String get subDeviceId => $_get(2, 3, '');
  set subDeviceId(String v) { $_setString(2, 3, v); }
  bool hasSubDeviceId() => $_has(2, 3);
  void clearSubDeviceId() => clearField(3);

  String get houseGuid => $_get(3, 4, '');
  set houseGuid(String v) { $_setString(3, 4, v); }
  bool hasHouseGuid() => $_has(3, 4);
  void clearHouseGuid() => clearField(4);

  String get areaGuid => $_get(4, 5, '');
  set areaGuid(String v) { $_setString(4, 5, v); }
  bool hasAreaGuid() => $_has(4, 5);
  void clearAreaGuid() => clearField(5);

  List<String> get prodtType => $_get(5, 6, null);
}

class _ReadonlyDeviceInfo extends DeviceInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<int>(11, 'page', PbFieldType.OU3)
    ..a<int>(12, 'pageSize', PbFieldType.OU3)
    ..a<String>(13, 'houseGuid', PbFieldType.OS)
    ..a<String>(14, 'areaGuid', PbFieldType.OS)
    ..a<String>(15, 'prodtType', PbFieldType.OS)
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

  String get houseGuid => $_get(3, 13, '');
  set houseGuid(String v) { $_setString(3, 13, v); }
  bool hasHouseGuid() => $_has(3, 13);
  void clearHouseGuid() => clearField(13);

  String get areaGuid => $_get(4, 14, '');
  set areaGuid(String v) { $_setString(4, 14, v); }
  bool hasAreaGuid() => $_has(4, 14);
  void clearAreaGuid() => clearField(14);

  String get prodtType => $_get(5, 15, '');
  set prodtType(String v) { $_setString(5, 15, v); }
  bool hasProdtType() => $_has(5, 15);
  void clearProdtType() => clearField(15);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<DeviceInfo>(11, 'devs', PbFieldType.PM, DeviceInfo.$checkItem, DeviceInfo.create)
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

  List<DeviceInfo> get devs => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

