///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library iot_comm;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

class SIOTCMD extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('SIOTCMD')
    ..a<int>(1, 'cmdType', PbFieldType.O3)
    ..a<String>(5, 'deviceId', PbFieldType.OS)
    ..a<String>(6, 'subDeviceId', PbFieldType.OS)
    ..a<int>(11, 'cmdid', PbFieldType.O3)
    ..p<int>(12, 'argInt32', PbFieldType.P3)
    ..p<String>(13, 'argString', PbFieldType.PS)
    ..a<List<int>>(14, 'argBytes', PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SIOTCMD() : super();
  SIOTCMD.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SIOTCMD.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SIOTCMD clone() => new SIOTCMD()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static SIOTCMD create() => new SIOTCMD();
  static PbList<SIOTCMD> createRepeated() => new PbList<SIOTCMD>();
  static SIOTCMD getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySIOTCMD();
    return _defaultInstance;
  }
  static SIOTCMD _defaultInstance;
  static void $checkItem(SIOTCMD v) {
    if (v is! SIOTCMD) checkItemFailed(v, 'SIOTCMD');
  }

  int get cmdType => $_get(0, 1, 0);
  set cmdType(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasCmdType() => $_has(0, 1);
  void clearCmdType() => clearField(1);

  String get deviceId => $_get(1, 5, '');
  set deviceId(String v) { $_setString(1, 5, v); }
  bool hasDeviceId() => $_has(1, 5);
  void clearDeviceId() => clearField(5);

  String get subDeviceId => $_get(2, 6, '');
  set subDeviceId(String v) { $_setString(2, 6, v); }
  bool hasSubDeviceId() => $_has(2, 6);
  void clearSubDeviceId() => clearField(6);

  int get cmdid => $_get(3, 11, 0);
  set cmdid(int v) { $_setUnsignedInt32(3, 11, v); }
  bool hasCmdid() => $_has(3, 11);
  void clearCmdid() => clearField(11);

  List<int> get argInt32 => $_get(4, 12, null);

  List<String> get argString => $_get(5, 13, null);

  List<int> get argBytes => $_get(6, 14, null);
  set argBytes(List<int> v) { $_setBytes(6, 14, v); }
  bool hasArgBytes() => $_has(6, 14);
  void clearArgBytes() => clearField(14);
}

class _ReadonlySIOTCMD extends SIOTCMD with ReadonlyMessageMixin {}

class IOTCMD extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('IOTCMD')
    ..pp<SIOTCMD>(1, 'cmd', PbFieldType.PM, SIOTCMD.$checkItem, SIOTCMD.create)
    ..hasRequiredFields = false
  ;

  IOTCMD() : super();
  IOTCMD.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  IOTCMD.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  IOTCMD clone() => new IOTCMD()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static IOTCMD create() => new IOTCMD();
  static PbList<IOTCMD> createRepeated() => new PbList<IOTCMD>();
  static IOTCMD getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyIOTCMD();
    return _defaultInstance;
  }
  static IOTCMD _defaultInstance;
  static void $checkItem(IOTCMD v) {
    if (v is! IOTCMD) checkItemFailed(v, 'IOTCMD');
  }

  List<SIOTCMD> get cmd => $_get(0, 1, null);
}

class _ReadonlyIOTCMD extends IOTCMD with ReadonlyMessageMixin {}

class CmdRecord extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('CmdRecord')
    ..a<String>(1, 'deviceId', PbFieldType.OS)
    ..a<String>(2, 'subDeviceId', PbFieldType.OS)
    ..a<int>(3, 'cmdid', PbFieldType.O3)
    ..p<int>(4, 'argInt32', PbFieldType.P3)
    ..p<String>(5, 'argString', PbFieldType.PS)
    ..a<List<int>>(6, 'argBytes', PbFieldType.OY)
    ..a<int>(7, 'cmdSrc', PbFieldType.O3)
    ..a<int>(8, 'isRun', PbFieldType.O3)
    ..a<Int64>(9, 'createTime', PbFieldType.O6, Int64.ZERO)
    ..a<Int64>(10, 'runTime', PbFieldType.O6, Int64.ZERO)
    ..a<int>(11, 'userId', PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  CmdRecord() : super();
  CmdRecord.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CmdRecord.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CmdRecord clone() => new CmdRecord()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static CmdRecord create() => new CmdRecord();
  static PbList<CmdRecord> createRepeated() => new PbList<CmdRecord>();
  static CmdRecord getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyCmdRecord();
    return _defaultInstance;
  }
  static CmdRecord _defaultInstance;
  static void $checkItem(CmdRecord v) {
    if (v is! CmdRecord) checkItemFailed(v, 'CmdRecord');
  }

  String get deviceId => $_get(0, 1, '');
  set deviceId(String v) { $_setString(0, 1, v); }
  bool hasDeviceId() => $_has(0, 1);
  void clearDeviceId() => clearField(1);

  String get subDeviceId => $_get(1, 2, '');
  set subDeviceId(String v) { $_setString(1, 2, v); }
  bool hasSubDeviceId() => $_has(1, 2);
  void clearSubDeviceId() => clearField(2);

  int get cmdid => $_get(2, 3, 0);
  set cmdid(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasCmdid() => $_has(2, 3);
  void clearCmdid() => clearField(3);

  List<int> get argInt32 => $_get(3, 4, null);

  List<String> get argString => $_get(4, 5, null);

  List<int> get argBytes => $_get(5, 6, null);
  set argBytes(List<int> v) { $_setBytes(5, 6, v); }
  bool hasArgBytes() => $_has(5, 6);
  void clearArgBytes() => clearField(6);

  int get cmdSrc => $_get(6, 7, 0);
  set cmdSrc(int v) { $_setUnsignedInt32(6, 7, v); }
  bool hasCmdSrc() => $_has(6, 7);
  void clearCmdSrc() => clearField(7);

  int get isRun => $_get(7, 8, 0);
  set isRun(int v) { $_setUnsignedInt32(7, 8, v); }
  bool hasIsRun() => $_has(7, 8);
  void clearIsRun() => clearField(8);

  Int64 get createTime => $_get(8, 9, null);
  set createTime(Int64 v) { $_setInt64(8, 9, v); }
  bool hasCreateTime() => $_has(8, 9);
  void clearCreateTime() => clearField(9);

  Int64 get runTime => $_get(9, 10, null);
  set runTime(Int64 v) { $_setInt64(9, 10, v); }
  bool hasRunTime() => $_has(9, 10);
  void clearRunTime() => clearField(10);

  int get userId => $_get(10, 11, 0);
  set userId(int v) { $_setUnsignedInt32(10, 11, v); }
  bool hasUserId() => $_has(10, 11);
  void clearUserId() => clearField(11);
}

class _ReadonlyCmdRecord extends CmdRecord with ReadonlyMessageMixin {}

class ExprInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ExprInfo')
    ..a<int>(1, 'exprId', PbFieldType.O3)
    ..a<int>(2, 'class_2', PbFieldType.O3)
    ..a<int>(3, 'startTime', PbFieldType.O3)
    ..a<int>(4, 'endTime', PbFieldType.O3)
    ..a<String>(5, 'deviceId', PbFieldType.OS)
    ..a<String>(6, 'subDeviceId', PbFieldType.OS)
    ..a<int>(7, 'itemType', PbFieldType.O3)
    ..a<int>(8, 'itemIndex', PbFieldType.O3)
    ..a<String>(9, 'expr', PbFieldType.OS)
    ..a<int>(10, 'value', PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ExprInfo() : super();
  ExprInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ExprInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ExprInfo clone() => new ExprInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ExprInfo create() => new ExprInfo();
  static PbList<ExprInfo> createRepeated() => new PbList<ExprInfo>();
  static ExprInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyExprInfo();
    return _defaultInstance;
  }
  static ExprInfo _defaultInstance;
  static void $checkItem(ExprInfo v) {
    if (v is! ExprInfo) checkItemFailed(v, 'ExprInfo');
  }

  int get exprId => $_get(0, 1, 0);
  set exprId(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasExprId() => $_has(0, 1);
  void clearExprId() => clearField(1);

  int get class_2 => $_get(1, 2, 0);
  set class_2(int v) { $_setUnsignedInt32(1, 2, v); }
  bool hasClass_2() => $_has(1, 2);
  void clearClass_2() => clearField(2);

  int get startTime => $_get(2, 3, 0);
  set startTime(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasStartTime() => $_has(2, 3);
  void clearStartTime() => clearField(3);

  int get endTime => $_get(3, 4, 0);
  set endTime(int v) { $_setUnsignedInt32(3, 4, v); }
  bool hasEndTime() => $_has(3, 4);
  void clearEndTime() => clearField(4);

  String get deviceId => $_get(4, 5, '');
  set deviceId(String v) { $_setString(4, 5, v); }
  bool hasDeviceId() => $_has(4, 5);
  void clearDeviceId() => clearField(5);

  String get subDeviceId => $_get(5, 6, '');
  set subDeviceId(String v) { $_setString(5, 6, v); }
  bool hasSubDeviceId() => $_has(5, 6);
  void clearSubDeviceId() => clearField(6);

  int get itemType => $_get(6, 7, 0);
  set itemType(int v) { $_setUnsignedInt32(6, 7, v); }
  bool hasItemType() => $_has(6, 7);
  void clearItemType() => clearField(7);

  int get itemIndex => $_get(7, 8, 0);
  set itemIndex(int v) { $_setUnsignedInt32(7, 8, v); }
  bool hasItemIndex() => $_has(7, 8);
  void clearItemIndex() => clearField(8);

  String get expr => $_get(8, 9, '');
  set expr(String v) { $_setString(8, 9, v); }
  bool hasExpr() => $_has(8, 9);
  void clearExpr() => clearField(9);

  int get value => $_get(9, 10, 0);
  set value(int v) { $_setUnsignedInt32(9, 10, v); }
  bool hasValue() => $_has(9, 10);
  void clearValue() => clearField(10);
}

class _ReadonlyExprInfo extends ExprInfo with ReadonlyMessageMixin {}

class RhsInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RhsInfo')
    ..a<int>(1, 'actionType', PbFieldType.O3)
    ..a<String>(11, 'sceneId', PbFieldType.OS)
    ..a<int>(12, 'delaySec', PbFieldType.O3)
    ..a<SIOTCMD>(13, 'cmd', PbFieldType.OM, SIOTCMD.getDefault, SIOTCMD.create)
    ..hasRequiredFields = false
  ;

  RhsInfo() : super();
  RhsInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RhsInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RhsInfo clone() => new RhsInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static RhsInfo create() => new RhsInfo();
  static PbList<RhsInfo> createRepeated() => new PbList<RhsInfo>();
  static RhsInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyRhsInfo();
    return _defaultInstance;
  }
  static RhsInfo _defaultInstance;
  static void $checkItem(RhsInfo v) {
    if (v is! RhsInfo) checkItemFailed(v, 'RhsInfo');
  }

  int get actionType => $_get(0, 1, 0);
  set actionType(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasActionType() => $_has(0, 1);
  void clearActionType() => clearField(1);

  String get sceneId => $_get(1, 11, '');
  set sceneId(String v) { $_setString(1, 11, v); }
  bool hasSceneId() => $_has(1, 11);
  void clearSceneId() => clearField(11);

  int get delaySec => $_get(2, 12, 0);
  set delaySec(int v) { $_setUnsignedInt32(2, 12, v); }
  bool hasDelaySec() => $_has(2, 12);
  void clearDelaySec() => clearField(12);

  SIOTCMD get cmd => $_get(3, 13, null);
  set cmd(SIOTCMD v) { setField(13, v); }
  bool hasCmd() => $_has(3, 13);
  void clearCmd() => clearField(13);
}

class _ReadonlyRhsInfo extends RhsInfo with ReadonlyMessageMixin {}

class RuleInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RuleInfo')
    ..a<String>(1, 'etId', PbFieldType.OS)
    ..a<String>(2, 'deviceId', PbFieldType.OS)
    ..a<String>(3, 'etName', PbFieldType.OS)
    ..a<int>(4, 'prio', PbFieldType.O3)
    ..a<int>(5, 'enable', PbFieldType.O3)
    ..a<int>(6, 'onlyTime', PbFieldType.O3)
    ..a<String>(7, 'lhs', PbFieldType.OS)
    ..pp<ExprInfo>(8, 'exprs', PbFieldType.PM, ExprInfo.$checkItem, ExprInfo.create)
    ..pp<RhsInfo>(9, 'rhs', PbFieldType.PM, RhsInfo.$checkItem, RhsInfo.create)
    ..a<int>(10, 'isEnd', PbFieldType.O3)
    ..a<int>(11, 'etType', PbFieldType.O3)
    ..a<String>(12, 'houseGuid', PbFieldType.OS)
    ..a<int>(13, 'userId', PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  RuleInfo() : super();
  RuleInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RuleInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RuleInfo clone() => new RuleInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static RuleInfo create() => new RuleInfo();
  static PbList<RuleInfo> createRepeated() => new PbList<RuleInfo>();
  static RuleInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyRuleInfo();
    return _defaultInstance;
  }
  static RuleInfo _defaultInstance;
  static void $checkItem(RuleInfo v) {
    if (v is! RuleInfo) checkItemFailed(v, 'RuleInfo');
  }

  String get etId => $_get(0, 1, '');
  set etId(String v) { $_setString(0, 1, v); }
  bool hasEtId() => $_has(0, 1);
  void clearEtId() => clearField(1);

  String get deviceId => $_get(1, 2, '');
  set deviceId(String v) { $_setString(1, 2, v); }
  bool hasDeviceId() => $_has(1, 2);
  void clearDeviceId() => clearField(2);

  String get etName => $_get(2, 3, '');
  set etName(String v) { $_setString(2, 3, v); }
  bool hasEtName() => $_has(2, 3);
  void clearEtName() => clearField(3);

  int get prio => $_get(3, 4, 0);
  set prio(int v) { $_setUnsignedInt32(3, 4, v); }
  bool hasPrio() => $_has(3, 4);
  void clearPrio() => clearField(4);

  int get enable => $_get(4, 5, 0);
  set enable(int v) { $_setUnsignedInt32(4, 5, v); }
  bool hasEnable() => $_has(4, 5);
  void clearEnable() => clearField(5);

  int get onlyTime => $_get(5, 6, 0);
  set onlyTime(int v) { $_setUnsignedInt32(5, 6, v); }
  bool hasOnlyTime() => $_has(5, 6);
  void clearOnlyTime() => clearField(6);

  String get lhs => $_get(6, 7, '');
  set lhs(String v) { $_setString(6, 7, v); }
  bool hasLhs() => $_has(6, 7);
  void clearLhs() => clearField(7);

  List<ExprInfo> get exprs => $_get(7, 8, null);

  List<RhsInfo> get rhs => $_get(8, 9, null);

  int get isEnd => $_get(9, 10, 0);
  set isEnd(int v) { $_setUnsignedInt32(9, 10, v); }
  bool hasIsEnd() => $_has(9, 10);
  void clearIsEnd() => clearField(10);

  int get etType => $_get(10, 11, 0);
  set etType(int v) { $_setUnsignedInt32(10, 11, v); }
  bool hasEtType() => $_has(10, 11);
  void clearEtType() => clearField(11);

  String get houseGuid => $_get(11, 12, '');
  set houseGuid(String v) { $_setString(11, 12, v); }
  bool hasHouseGuid() => $_has(11, 12);
  void clearHouseGuid() => clearField(12);

  int get userId => $_get(12, 13, 0);
  set userId(int v) { $_setUnsignedInt32(12, 13, v); }
  bool hasUserId() => $_has(12, 13);
  void clearUserId() => clearField(13);
}

class _ReadonlyRuleInfo extends RuleInfo with ReadonlyMessageMixin {}

class SceneInfo extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('SceneInfo')
    ..a<String>(1, 'sceneId', PbFieldType.OS)
    ..a<int>(3, 'sceneType', PbFieldType.O3)
    ..a<int>(4, 'enable', PbFieldType.O3)
    ..a<String>(5, 'houseGuid', PbFieldType.OS)
    ..a<String>(11, 'sceneName', PbFieldType.OS)
    ..a<IOTCMD>(12, 'cmd', PbFieldType.OM, IOTCMD.getDefault, IOTCMD.create)
    ..hasRequiredFields = false
  ;

  SceneInfo() : super();
  SceneInfo.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SceneInfo.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SceneInfo clone() => new SceneInfo()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static SceneInfo create() => new SceneInfo();
  static PbList<SceneInfo> createRepeated() => new PbList<SceneInfo>();
  static SceneInfo getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySceneInfo();
    return _defaultInstance;
  }
  static SceneInfo _defaultInstance;
  static void $checkItem(SceneInfo v) {
    if (v is! SceneInfo) checkItemFailed(v, 'SceneInfo');
  }

  String get sceneId => $_get(0, 1, '');
  set sceneId(String v) { $_setString(0, 1, v); }
  bool hasSceneId() => $_has(0, 1);
  void clearSceneId() => clearField(1);

  int get sceneType => $_get(1, 3, 0);
  set sceneType(int v) { $_setUnsignedInt32(1, 3, v); }
  bool hasSceneType() => $_has(1, 3);
  void clearSceneType() => clearField(3);

  int get enable => $_get(2, 4, 0);
  set enable(int v) { $_setUnsignedInt32(2, 4, v); }
  bool hasEnable() => $_has(2, 4);
  void clearEnable() => clearField(4);

  String get houseGuid => $_get(3, 5, '');
  set houseGuid(String v) { $_setString(3, 5, v); }
  bool hasHouseGuid() => $_has(3, 5);
  void clearHouseGuid() => clearField(5);

  String get sceneName => $_get(4, 11, '');
  set sceneName(String v) { $_setString(4, 11, v); }
  bool hasSceneName() => $_has(4, 11);
  void clearSceneName() => clearField(11);

  IOTCMD get cmd => $_get(5, 12, null);
  set cmd(IOTCMD v) { setField(12, v); }
  bool hasCmd() => $_has(5, 12);
  void clearCmd() => clearField(12);
}

class _ReadonlySceneInfo extends SceneInfo with ReadonlyMessageMixin {}

