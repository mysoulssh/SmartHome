///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library DeviceCmdAdd_DeviceCmdAdd;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

//import 'iot_comm.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';

class ReportCmd extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ReportCmd')
    ..a<int>(1, 'cmdSrc', PbFieldType.O3)
    ..a<SIOTCMD>(2, 'cmd', PbFieldType.OM, SIOTCMD.getDefault, SIOTCMD.create)
    ..a<Int64>(3, 'timeStamp', PbFieldType.O6, Int64.ZERO)
    ..a<String>(4, 'msgId', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  ReportCmd() : super();
  ReportCmd.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ReportCmd.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ReportCmd clone() => new ReportCmd()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ReportCmd create() => new ReportCmd();
  static PbList<ReportCmd> createRepeated() => new PbList<ReportCmd>();
  static ReportCmd getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyReportCmd();
    return _defaultInstance;
  }
  static ReportCmd _defaultInstance;
  static void $checkItem(ReportCmd v) {
    if (v is! ReportCmd) checkItemFailed(v, 'ReportCmd');
  }

  int get cmdSrc => $_get(0, 1, 0);
  set cmdSrc(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasCmdSrc() => $_has(0, 1);
  void clearCmdSrc() => clearField(1);

  SIOTCMD get cmd => $_get(1, 2, null);
  set cmd(SIOTCMD v) { setField(2, v); }
  bool hasCmd() => $_has(1, 2);
  void clearCmd() => clearField(2);

  Int64 get timeStamp => $_get(2, 3, null);
  set timeStamp(Int64 v) { $_setInt64(2, 3, v); }
  bool hasTimeStamp() => $_has(2, 3);
  void clearTimeStamp() => clearField(3);

  String get msgId => $_get(3, 4, '');
  set msgId(String v) { $_setString(3, 4, v); }
  bool hasMsgId() => $_has(3, 4);
  void clearMsgId() => clearField(4);
}

class _ReadonlyReportCmd extends ReportCmd with ReadonlyMessageMixin {}

class RpcRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('RpcRequest')
    ..a<String>(1, 'deviceId', PbFieldType.OS)
    ..a<String>(2, 'deviceSeckey', PbFieldType.OS)
    ..a<String>(3, 'subDeviceId', PbFieldType.OS)
    ..pp<ReportCmd>(11, 'repCmds', PbFieldType.PM, ReportCmd.$checkItem, ReportCmd.create)
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

  String get subDeviceId => $_get(2, 3, '');
  set subDeviceId(String v) { $_setString(2, 3, v); }
  bool hasSubDeviceId() => $_has(2, 3);
  void clearSubDeviceId() => clearField(3);

  List<ReportCmd> get repCmds => $_get(3, 11, null);
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

