///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library HouseAreaList_HouseAreaList;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class AreaInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('AreaInfo')
    ..a<String>(1, 'houseGuid', PbFieldType.OS)
    ..a<String>(2, 'areaGuid', PbFieldType.OS)
    ..a<String>(3, 'areaName', PbFieldType.OS)
    ..a<int>(4, 'isDefault', PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  AreaInfo() : super();
  AreaInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AreaInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AreaInfo clone() => new AreaInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static AreaInfo create() => new AreaInfo();
  static PbList<AreaInfo> createRepeated() => new PbList<AreaInfo>();
  static AreaInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyAreaInfo();
    return _defaultInstance;
  }
  static AreaInfo _defaultInstance;
  static void $checkItem(AreaInfo v) {
    if (v is! AreaInfo) checkItemFailed(v, 'AreaInfo');
  }

  String get houseGuid => $_get(0, 1, '');
  set houseGuid(String v) { $_setString(0, 1, v); }
  bool hasHouseGuid() => $_has(0, 1);
  void clearHouseGuid() => clearField(1);

  String get areaGuid => $_get(1, 2, '');
  set areaGuid(String v) { $_setString(1, 2, v); }
  bool hasAreaGuid() => $_has(1, 2);
  void clearAreaGuid() => clearField(2);

  String get areaName => $_get(2, 3, '');
  set areaName(String v) { $_setString(2, 3, v); }
  bool hasAreaName() => $_has(2, 3);
  void clearAreaName() => clearField(3);

  int get isDefault => $_get(3, 4, 0);
  set isDefault(int v) { $_setUnsignedInt32(3, 4, v); }
  bool hasIsDefault() => $_has(3, 4);
  void clearIsDefault() => clearField(4);
}

class _ReadonlyAreaInfo extends AreaInfo with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(21, 'houseGuid', PbFieldType.OS)
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

  String get houseGuid => $_get(1, 21, '');
  set houseGuid(String v) { $_setString(1, 21, v); }
  bool hasHouseGuid() => $_has(1, 21);
  void clearHouseGuid() => clearField(21);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<AreaInfo>(11, 'areas', PbFieldType.PM, AreaInfo.$checkItem, AreaInfo.create)
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

  List<AreaInfo> get areas => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

