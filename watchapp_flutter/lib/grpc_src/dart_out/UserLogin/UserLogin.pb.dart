///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library UserLogin_UserLogin;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'clientId', PbFieldType.OS)
    ..a<Int64>(2, 'reqTime', PbFieldType.O6, Int64.ZERO)
    ..a<String>(3, 'signKey', PbFieldType.OS)
    ..a<String>(5, 'userName', PbFieldType.OS)
    ..a<int>(6, 'userId', PbFieldType.OU3)
    ..a<String>(7, 'password', PbFieldType.OS)
    ..a<List<int>>(8, 'finger', PbFieldType.OY)
    ..a<int>(11, 'loginType', PbFieldType.OU3)
    ..a<String>(12, 'loginDeviceid', PbFieldType.OS)
    ..a<String>(13, 'loginLang', PbFieldType.OS)
    ..a<int>(14, 'loginOs', PbFieldType.OU3)
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

  String get clientId => $_get(0, 1, '');
  set clientId(String v) { $_setString(0, 1, v); }
  bool hasClientId() => $_has(0, 1);
  void clearClientId() => clearField(1);

  Int64 get reqTime => $_get(1, 2, null);
  set reqTime(Int64 v) { $_setInt64(1, 2, v); }
  bool hasReqTime() => $_has(1, 2);
  void clearReqTime() => clearField(2);

  String get signKey => $_get(2, 3, '');
  set signKey(String v) { $_setString(2, 3, v); }
  bool hasSignKey() => $_has(2, 3);
  void clearSignKey() => clearField(3);

  String get userName => $_get(3, 5, '');
  set userName(String v) { $_setString(3, 5, v); }
  bool hasUserName() => $_has(3, 5);
  void clearUserName() => clearField(5);

  int get userId => $_get(4, 6, 0);
  set userId(int v) { $_setUnsignedInt32(4, 6, v); }
  bool hasUserId() => $_has(4, 6);
  void clearUserId() => clearField(6);

  String get password => $_get(5, 7, '');
  set password(String v) { $_setString(5, 7, v); }
  bool hasPassword() => $_has(5, 7);
  void clearPassword() => clearField(7);

  List<int> get finger => $_get(6, 8, null);
  set finger(List<int> v) { $_setBytes(6, 8, v); }
  bool hasFinger() => $_has(6, 8);
  void clearFinger() => clearField(8);

  int get loginType => $_get(7, 11, 0);
  set loginType(int v) { $_setUnsignedInt32(7, 11, v); }
  bool hasLoginType() => $_has(7, 11);
  void clearLoginType() => clearField(11);

  String get loginDeviceid => $_get(8, 12, '');
  set loginDeviceid(String v) { $_setString(8, 12, v); }
  bool hasLoginDeviceid() => $_has(8, 12);
  void clearLoginDeviceid() => clearField(12);

  String get loginLang => $_get(9, 13, '');
  set loginLang(String v) { $_setString(9, 13, v); }
  bool hasLoginLang() => $_has(9, 13);
  void clearLoginLang() => clearField(13);

  int get loginOs => $_get(10, 14, 0);
  set loginOs(int v) { $_setUnsignedInt32(10, 14, v); }
  bool hasLoginOs() => $_has(10, 14);
  void clearLoginOs() => clearField(14);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..a<int>(1, 'userId', PbFieldType.OU3)
    ..a<String>(2, 'accessToken', PbFieldType.OS)
    ..a<String>(3, 'refreshToken', PbFieldType.OS)
    ..a<Int64>(4, 'expiredTime', PbFieldType.O6, Int64.ZERO)
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

  int get userId => $_get(0, 1, 0);
  set userId(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasUserId() => $_has(0, 1);
  void clearUserId() => clearField(1);

  String get accessToken => $_get(1, 2, '');
  set accessToken(String v) { $_setString(1, 2, v); }
  bool hasAccessToken() => $_has(1, 2);
  void clearAccessToken() => clearField(2);

  String get refreshToken => $_get(2, 3, '');
  set refreshToken(String v) { $_setString(2, 3, v); }
  bool hasRefreshToken() => $_has(2, 3);
  void clearRefreshToken() => clearField(3);

  Int64 get expiredTime => $_get(3, 4, null);
  set expiredTime(Int64 v) { $_setInt64(3, 4, v); }
  bool hasExpiredTime() => $_has(3, 4);
  void clearExpiredTime() => clearField(4);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

