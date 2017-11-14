///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library HouseEdit_HouseEdit;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..a<String>(10, 'houseGuid', PbFieldType.OS)
    ..a<String>(11, 'houseName', PbFieldType.OS)
    ..a<String>(12, 'addrName', PbFieldType.OS)
    ..a<int>(13, 'longitude', PbFieldType.O3)
    ..a<int>(14, 'latitude', PbFieldType.O3)
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

  String get houseGuid => $_get(1, 10, '');
  set houseGuid(String v) { $_setString(1, 10, v); }
  bool hasHouseGuid() => $_has(1, 10);
  void clearHouseGuid() => clearField(10);

  String get houseName => $_get(2, 11, '');
  set houseName(String v) { $_setString(2, 11, v); }
  bool hasHouseName() => $_has(2, 11);
  void clearHouseName() => clearField(11);

  String get addrName => $_get(3, 12, '');
  set addrName(String v) { $_setString(3, 12, v); }
  bool hasAddrName() => $_has(3, 12);
  void clearAddrName() => clearField(12);

  int get longitude => $_get(4, 13, 0);
  set longitude(int v) { $_setUnsignedInt32(4, 13, v); }
  bool hasLongitude() => $_has(4, 13);
  void clearLongitude() => clearField(13);

  int get latitude => $_get(5, 14, 0);
  set latitude(int v) { $_setUnsignedInt32(5, 14, v); }
  bool hasLatitude() => $_has(5, 14);
  void clearLatitude() => clearField(14);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<String>(6, 'houseGuid', PbFieldType.OS)
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

  String get houseGuid => $_get(0, 6, '');
  set houseGuid(String v) { $_setString(0, 6, v); }
  bool hasHouseGuid() => $_has(0, 6);
  void clearHouseGuid() => clearField(6);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

