///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library UserAttrGet_UserAttrGet;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class UserAttr extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('UserAttr')
    ..a<int>(1, 'userId', PbFieldType.OU3)
    ..a<String>(2, 'userName', PbFieldType.OS)
    ..a<String>(4, 'likeName', PbFieldType.OS)
    ..a<String>(5, 'sign', PbFieldType.OS)
    ..a<String>(6, 'picFileid', PbFieldType.OS)
    ..a<int>(11, 'birthYear', PbFieldType.O3)
    ..a<int>(12, 'birthMonth', PbFieldType.O3)
    ..a<int>(13, 'birthDay', PbFieldType.O3)
    ..a<int>(14, 'sex', PbFieldType.O3)
    ..a<String>(15, 'companyCode', PbFieldType.OS)
    ..a<int>(21, 'height', PbFieldType.O3)
    ..a<int>(22, 'weight', PbFieldType.O3)
    ..a<int>(23, 'targetStep', PbFieldType.O3)
    ..a<String>(24, 'cardId', PbFieldType.OS)
    ..a<int>(31, 'longitude', PbFieldType.O3)
    ..a<int>(32, 'latitude', PbFieldType.O3)
    ..a<String>(33, 'siteName', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  UserAttr() : super();
  UserAttr.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UserAttr.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UserAttr clone() => new UserAttr()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static UserAttr create() => new UserAttr();
  static PbList<UserAttr> createRepeated() => new PbList<UserAttr>();
  static UserAttr getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyUserAttr();
    return _defaultInstance;
  }
  static UserAttr _defaultInstance;
  static void $checkItem(UserAttr v) {
    if (v is! UserAttr) checkItemFailed(v, 'UserAttr');
  }

  int get userId => $_get(0, 1, 0);
  set userId(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasUserId() => $_has(0, 1);
  void clearUserId() => clearField(1);

  String get userName => $_get(1, 2, '');
  set userName(String v) { $_setString(1, 2, v); }
  bool hasUserName() => $_has(1, 2);
  void clearUserName() => clearField(2);

  String get likeName => $_get(2, 4, '');
  set likeName(String v) { $_setString(2, 4, v); }
  bool hasLikeName() => $_has(2, 4);
  void clearLikeName() => clearField(4);

  String get sign => $_get(3, 5, '');
  set sign(String v) { $_setString(3, 5, v); }
  bool hasSign() => $_has(3, 5);
  void clearSign() => clearField(5);

  String get picFileid => $_get(4, 6, '');
  set picFileid(String v) { $_setString(4, 6, v); }
  bool hasPicFileid() => $_has(4, 6);
  void clearPicFileid() => clearField(6);

  int get birthYear => $_get(5, 11, 0);
  set birthYear(int v) { $_setUnsignedInt32(5, 11, v); }
  bool hasBirthYear() => $_has(5, 11);
  void clearBirthYear() => clearField(11);

  int get birthMonth => $_get(6, 12, 0);
  set birthMonth(int v) { $_setUnsignedInt32(6, 12, v); }
  bool hasBirthMonth() => $_has(6, 12);
  void clearBirthMonth() => clearField(12);

  int get birthDay => $_get(7, 13, 0);
  set birthDay(int v) { $_setUnsignedInt32(7, 13, v); }
  bool hasBirthDay() => $_has(7, 13);
  void clearBirthDay() => clearField(13);

  int get sex => $_get(8, 14, 0);
  set sex(int v) { $_setUnsignedInt32(8, 14, v); }
  bool hasSex() => $_has(8, 14);
  void clearSex() => clearField(14);

  String get companyCode => $_get(9, 15, '');
  set companyCode(String v) { $_setString(9, 15, v); }
  bool hasCompanyCode() => $_has(9, 15);
  void clearCompanyCode() => clearField(15);

  int get height => $_get(10, 21, 0);
  set height(int v) { $_setUnsignedInt32(10, 21, v); }
  bool hasHeight() => $_has(10, 21);
  void clearHeight() => clearField(21);

  int get weight => $_get(11, 22, 0);
  set weight(int v) { $_setUnsignedInt32(11, 22, v); }
  bool hasWeight() => $_has(11, 22);
  void clearWeight() => clearField(22);

  int get targetStep => $_get(12, 23, 0);
  set targetStep(int v) { $_setUnsignedInt32(12, 23, v); }
  bool hasTargetStep() => $_has(12, 23);
  void clearTargetStep() => clearField(23);

  String get cardId => $_get(13, 24, '');
  set cardId(String v) { $_setString(13, 24, v); }
  bool hasCardId() => $_has(13, 24);
  void clearCardId() => clearField(24);

  int get longitude => $_get(14, 31, 0);
  set longitude(int v) { $_setUnsignedInt32(14, 31, v); }
  bool hasLongitude() => $_has(14, 31);
  void clearLongitude() => clearField(31);

  int get latitude => $_get(15, 32, 0);
  set latitude(int v) { $_setUnsignedInt32(15, 32, v); }
  bool hasLatitude() => $_has(15, 32);
  void clearLatitude() => clearField(32);

  String get siteName => $_get(16, 33, '');
  set siteName(String v) { $_setString(16, 33, v); }
  bool hasSiteName() => $_has(16, 33);
  void clearSiteName() => clearField(33);
}

class _ReadonlyUserAttr extends UserAttr with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'accessToken', PbFieldType.OS)
    ..p<String>(11, 'userName', PbFieldType.PS)
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

  List<String> get userName => $_get(1, 11, null);
}

class _ReadonlyRpcRequest extends RpcRequest with ReadonlyMessageMixin {}

class RpcResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcResponse')
    ..pp<UserAttr>(11, 'attrs', PbFieldType.PM, UserAttr.$checkItem, UserAttr.create)
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

  List<UserAttr> get attrs => $_get(0, 11, null);
}

class _ReadonlyRpcResponse extends RpcResponse with ReadonlyMessageMixin {}

