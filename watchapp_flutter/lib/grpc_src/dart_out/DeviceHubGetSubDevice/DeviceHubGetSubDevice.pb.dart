///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceHubGetSubDevice_DeviceHubGetSubDevice;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class SubDeviceInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('SubDeviceInfo')
    ..a<String>(1, 'subDeviceId', PbFieldType.OS)
    ..a<String>(2, 'deviceName', PbFieldType.OS)
    ..a<String>(3, 'productId', PbFieldType.OS)
    ..a<int>(4, 'createTime', PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  SubDeviceInfo() : super();
  SubDeviceInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SubDeviceInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SubDeviceInfo clone() => new SubDeviceInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static SubDeviceInfo create() => new SubDeviceInfo();
  static PbList<SubDeviceInfo> createRepeated() => new PbList<SubDeviceInfo>();
  static SubDeviceInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySubDeviceInfo();
    return _defaultInstance;
  }
  static SubDeviceInfo _defaultInstance;
  static void $checkItem(SubDeviceInfo v) {
    if (v is! SubDeviceInfo) checkItemFailed(v, 'SubDeviceInfo');
  }

  String get subDeviceId => $_get(0, 1, '');
  set subDeviceId(String v) { $_setString(0, 1, v); }
  bool hasSubDeviceId() => $_has(0, 1);
  void clearSubDeviceId() => clearField(1);

  String get deviceName => $_get(1, 2, '');
  set deviceName(String v) { $_setString(1, 2, v); }
  bool hasDeviceName() => $_has(1, 2);
  void clearDeviceName() => clearField(2);

  String get productId => $_get(2, 3, '');
  set productId(String v) { $_setString(2, 3, v); }
  bool hasProductId() => $_has(2, 3);
  void clearProductId() => clearField(3);

  int get createTime => $_get(3, 4, 0);
  set createTime(int v) { $_setUnsignedInt32(3, 4, v); }
  bool hasCreateTime() => $_has(3, 4);
  void clearCreateTime() => clearField(4);
}

class _ReadonlySubDeviceInfo extends SubDeviceInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'deviceId', PbFieldType.OS)
    ..a<String>(2, 'deviceSeckey', PbFieldType.OS)
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

  String get deviceId => $_get(0, 1, '');
  set deviceId(String v) { $_setString(0, 1, v); }
  bool hasDeviceId() => $_has(0, 1);
  void clearDeviceId() => clearField(1);

  String get deviceSeckey => $_get(1, 2, '');
  set deviceSeckey(String v) { $_setString(1, 2, v); }
  bool hasDeviceSeckey() => $_has(1, 2);
  void clearDeviceSeckey() => clearField(2);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<SubDeviceInfo>(11, 'subDevs', PbFieldType.PM, SubDeviceInfo.$checkItem, SubDeviceInfo.create)
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

  List<SubDeviceInfo> get subDevs => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

