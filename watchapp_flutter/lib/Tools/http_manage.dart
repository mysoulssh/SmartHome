import 'dart:async';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:crypto/crypto.dart';
import 'user_access_model.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceCmdAdd/DeviceCmdAdd.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceFailcodeGet/DeviceFailcodeGet.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceStatusGet/DeviceStatusGet.pb.dart' show StatusInfo;
import 'package:watchapp_flutter/grpc_src/dart_out/UserAttrSet/UserAttrSet.pb.dart' show Attr;
import 'http_request/send_code_request.dart';
import 'http_request/regist_requset.dart';
import 'http_request/login_request.dart';
import 'http_request/user_info_get_request.dart';
import 'http_request/user_info_set_request.dart';
import 'http_request/device_add_request.dart';
import 'http_request/company_add_request.dart';
import 'http_request/company_del_request.dart';
import 'http_request/company_edit_request.dart';
import 'http_request/company_list_request.dart';
import 'http_request/company_review_request.dart';
import 'http_request/device_cmd_add_request.dart';
import 'http_request/device_cmd_get_request.dart';
import 'http_request/device_cmd_last_request.dart';
import 'http_request/device_del_request.dart';
import 'http_request/device_fail_code_get_request.dart';
import 'http_request/device_fail_code_set_request.dart';
import 'http_request/device_hubdevice_add_request.dart';
import 'http_request/device_hubdevice_del_request.dart';
import 'http_request/device_hubdevice_list_request.dart';
import 'http_request/device_hubdevice_name_request.dart';
import 'http_request/device_hubget_sub_device_request.dart';
import 'http_request/device_info_get_request.dart';
import 'http_request/device_rom_add_request.dart';
import 'http_request/device_rom_del_request.dart';
import 'http_request/device_rom_edit_request.dart';
import 'http_request/device_rom_list_request.dart';
import 'http_request/device_rom_review_request.dart';
import 'http_request/device_run_iot_cmd_request.dart';
import 'http_request/device_status_get_request.dart';
import 'http_request/device_status_set_request.dart';
import 'http_request/device_ver_get_request.dart';
import 'http_request/device_ver_set_request.dart';
import 'http_request/event_rule_add_request.dart';
import 'http_request/event_rule_del_request.dart';
import 'http_request/event_rule_edit_request.dart';
import 'http_request/event_rule_list_request.dart';
import 'http_request/event_rule_set_request.dart';
import 'http_request/house_add_request.dart';
import 'http_request/house_area_add_request.dart';
import 'http_request/house_list_request.dart';
import 'http_request/house_area_list_request.dart';
import 'http_request/house_del_request.dart';
import 'http_request/user_device_add_request.dart';
import 'http_request/user_device_del_request.dart';
import 'http_request/user_device_edit_request.dart';
import 'http_request/user_device_list_request.dart';
import 'http_request/scene_add_request.dart';
import 'http_request/scene_del_request.dart';
import 'http_request/scene_edit_request.dart';
import 'http_request/scene_list_request.dart';
import 'http_request/scene_active_request.dart';
import 'http_request/house_device_list.dart';
import 'http_request/house_area_device_del_request.dart';
import 'http_request/house_area_device_set_requset.dart';
import 'http_request/user_phone_change.dart';
import 'http_request/user_change_pass.dart';


typedef SuccessCallback(Map map);


final HttpManage httpManage = new HttpManage._();

class HttpManage{

  //单利
  HttpManage._();

  ClientChannel channel;

  final String clientId = 'appdev';
  final String client_secret = 'AppdevSecretKey';

  ClientChannel shareChannel(){
    if (channel == null){
      channel = new ClientChannel(
          '120.77.44.71',
          port: 1234,
          options: const ChannelOptions.insecure()
      );
    }
    return channel;
  }
  
  //获取时间戳
  Int64 _getReqTime(){
    final nowDate = new DateTime.now();
    var time = nowDate.millisecondsSinceEpoch/1000;
    int timeStamp = time.toInt();
    return new Int64(timeStamp);
  }

  //获取md5
  String _getMd5(){
    var text = _getReqTime().toString()+client_secret;
    List<int> data = text.runes.toList(growable: false);
    String result = md5.convert(data).toString();
    return result;
  }


  //发送验证码
  Future<Null> sendCode(String phoneNum, int type, SendCodeFailureCallback failureCallback) async{
    SendCodeRequest request = new SendCodeRequest(shareChannel(),clientId: clientId,reqTime: _getReqTime(),md5Str: _getMd5());
    request.sendVcode(phoneNum, type, failureCallback);
  }

  //注册账号
  void registCode(String phoneNum, String code, String pwd, SuccessCallback callback, RegistFailureCallback failureCallback){
    RegistRequest request = new RegistRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),
    );
    request.registAccount(phoneNum, code, pwd,(String message){
      if (failureCallback != null){
        failureCallback(message);
      }
    }).then((onValue){
      if (onValue == null) return;
      int userid = onValue.userId;
      print('registCode = $userid');
      callback({'user_id':userid});
    });
  }

  //登录
  void loginCode(String phoneNum, String pwd,SuccessCallback callback,LoginFailureCallback failureCallback){
    LoginRequest request = new LoginRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),
    );

    request.loginAccount(phoneNum, pwd, failureCallback).then((onValue){
      if (onValue == null) return;
      UserAccessModel accessModel = UserAccessModel.shareModel();
      accessModel.userId = onValue.userId;
      accessModel.accessToken = onValue.accessToken;
      accessModel.refreshToken = onValue.refreshToken;
      accessModel.expiredTime = onValue.expiredTime.toInt();

      callback({
        'accessModel':accessModel
      });
    });

  }

  //获取个人信息
  void getUserInfo(String accessToken, String userName, SuccessCallback callback,InfoGetFailureCallback failureCallback){
    UserInfoGetRequest request = new UserInfoGetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),
    );

    request.infoGet(accessToken, userName, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'UserInfoModel':onValue
      });
    });
  }

  //设置个人信息
  void setUserInfo(String accessToken, String userName, List<Attr> attr, SuccessCallback callback, InfoSetFailureCallback failureCallback){
    UserInfoSetRequest request = new UserInfoSetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),
    );

    request.infoSet(accessToken, userName, attr, failureCallback).then((onValue){
      print('$onValue');
      if(callback != null){
        callback(null);
      }
    });
  }

  //添加设备ID
  void deviceAdd(String productCode,SuccessCallback callback, DeviceAddFailureCallback failureCallback){
    DeviceAddRequest request = new DeviceAddRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceAdd(productCode, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }


  //获取设备


  //添加公司信息
  void companyAdd(String accessToken, String name, String addr, String agencyCode, String fileIds, SuccessCallback callback, CompanyAddFailureCallback failureCallback){
    CompanyAddRequest request = new CompanyAddRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.companyAdd(accessToken, name, addr, agencyCode, fileIds, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //删除公司
  void companyDel(String accessToken, String companyCode, SuccessCallback callback, DeviceAddFailureCallback failureCallback){
    CompanyDelRequest request = new CompanyDelRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.companyDel(accessToken, companyCode, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //编辑公司
  void companyEdit(String accessToken, String name, String addr, String companyCode, String agencyCode, String fileIds,  SuccessCallback callback, CompanyEditFailureCallback failureCallback){
    CompanyEditRequest request = new CompanyEditRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.companyEdit(accessToken,name,addr,companyCode,agencyCode,fileIds,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //获取公司信息
  void companyList(String accessToken, String companyCode, int page, int pageSize, String name, SuccessCallback callback, CompanyListFailureCallback failureCallback){
    CompanyListRequest request = new CompanyListRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.companyList(accessToken,companyCode,name,page,pageSize,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //公司审核
  void companyReview(String accessToken, String companyCode, int isReview, String reviewMark, SuccessCallback callback, CompanyReviewFailureCallback failureCallback){
    CompanyReviewRequest request = new CompanyReviewRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.companyReview(accessToken,companyCode, isReview, reviewMark,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //设备执行命令上报
  void deviceCmdAdd(String deviceId, String deviceSeckey, String subDeviceId, List<ReportCmd> repCmds,SuccessCallback callback, DeviceCmdAddFailureCallback failureCallback){
    DeviceCmdAddRequest request = new DeviceCmdAddRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceCmdAdd(deviceId, deviceSeckey, subDeviceId, repCmds, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //用戶获取设备执行的命令记录
  void deviceCmdGet(String accessToken, String deviceId, String subDeviceId, int page, int pageSize, SuccessCallback callback, DeviceCmdGetFailureCallback failureCallback){
    DeviceCmdGetRequest request = new DeviceCmdGetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceCmdGet(accessToken, deviceId, subDeviceId, page, pageSize, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //用戶获取设备的最后一个命令记录
  void deviceCmdLast(String accessToken, String deviceId, String subDeviceId, SuccessCallback callback,DeviceCmdLastFailureCallback failureCallback){
    DeviceCmdLastRequest request = new DeviceCmdLastRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceCmdLast(accessToken, deviceId, subDeviceId, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //删除设备
  void deviceDel(String accessToken, String deviceId, String subDeviceId, SuccessCallback callback, DeviceDelFailureCallback failureCallback){
    DeviceDelRequest request = new DeviceDelRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

      request.deviceDel(accessToken, deviceId, subDeviceId, failureCallback).then((onValue){
        if (onValue == null) return;
        callback({

        });
    });
  }

  //用戶获取设备的故障码
  void deviceFailCodeGet(String accessToken, List<QueryInfo> query, SuccessCallback callback, DeviceFailCodeGetFailureCallback failureCallback){
    DeviceFailCodeGetRequest request = new DeviceFailCodeGetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceFailCodeGet(accessToken, query, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //设置设备故障码
  void deviceFailCodeSet(String deviceSeckey, String deviceId, String subDeviceId, int failCode, int timeStamp, SuccessCallback callback, DeviceFailCodeSetFailureCallback failureCallback){
    DeviceFailCodeSetRequest request = new DeviceFailCodeSetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceFailCodeSet(deviceSeckey, deviceId, subDeviceId, failCode, timeStamp, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //添加子设备
  void deviceHubDeviceAdd(String deviceSeckey, String deviceId, List<String> subDeviceId, SuccessCallback callback, DeviceHubDeviceAddFailureCallback failureCallback){
    DeviceHubDeviceAddRequest request = new DeviceHubDeviceAddRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceHubDeviceAdd(deviceSeckey, deviceId, subDeviceId, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //删除子设备
  void deviceHubDeviceDel(String deviceSeckey, String deviceId, List<String> subDeviceId, SuccessCallback callback, DeviceHubDeviceDelFailureCallback failureCallback){
    DeviceHubDeviceDelRequest request = new DeviceHubDeviceDelRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceHubDeviceDel(deviceSeckey, deviceId, subDeviceId, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //获取子设备列表
  void deviceHubDeviceList(String accessToken, String deviceId, SuccessCallback callback, DeviceHubDeviceListFailureCallback failureCallback){
    DeviceHubDeviceListRequest request = new DeviceHubDeviceListRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceHubDeviceList(accessToken, deviceId, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'models':onValue
      });
    });
  }

  //设置子设备的名称
  void deviceHubDeviceName(String accessToken, String deviceId, String subDeviceId, String deviceName, SuccessCallback callback, DeviceHubDeviceNameFailureCallback failureCallback){
    DeviceHubDeviceNameRequest request = new DeviceHubDeviceNameRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceHubDeviceName(accessToken,deviceId,subDeviceId,deviceName,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //设备端获取自己的子设备列表
  void deviceHubGetSubDevice(String deviceId, String deviceSeckey, SuccessCallback callback, DeviceHubGetSubDeviceFailureCallback failureCallback){
    DeviceHubGetSubDeviceRequest request = new DeviceHubGetSubDeviceRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceHubGetSubDevice(deviceId, deviceSeckey,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //获取设备基本信息(不包含子设备)
  void deviceInfoGet(List<String> deviceId, String accessToken, SuccessCallback callback, DeviceInfoGetFailureCallback failureCallback){
    DeviceInfoGetRequest request = new DeviceInfoGetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceInfoGet(deviceId, accessToken,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'models':onValue
      });
    });
  }


  //添加设备固件
  void deviceRomAdd(String accessToken, String productCode, int romVer, String romMd5, String fileId, String changeLog, SuccessCallback callback, DeviceRomAddFailureCallback failureCallback){
    DeviceRomAddRequest request = new DeviceRomAddRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceRomAdd(accessToken,productCode,romVer,romMd5,fileId,changeLog,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //删除设备固件
  void deviceRomDel(String accessToken, String productCode, int romVer, SuccessCallback callback, DeviceRomDelFailureCallback failureCallback){
    DeviceRomDelRequest request = new DeviceRomDelRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceRomDel(accessToken,productCode,romVer,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //编辑设备固件
  void deviceRomEdit(String accessToken, String productCode, int romVer, String romMd5, String fileId, String changeLog, SuccessCallback callback, DeviceRomEditFailureCallback failureCallback){
    DeviceRomEditRequest request = new DeviceRomEditRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceRomEdit(accessToken,productCode,romVer,romMd5, fileId, changeLog,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //获得设备固件
  void deviceRomList(String accessToken, String productCode, int romVer, int page, int pageSize, SuccessCallback callback, DeviceRomListFailureCallback failureCallback){
    DeviceRomListRequest request = new DeviceRomListRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceRomList(accessToken,productCode,romVer, page, pageSize, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //设备固件审核
  void deviceRomReview(String accessToken, String productCode, int romVer, int isReview, String reviewMark, SuccessCallback callback, DeviceRomReviewFailureCallback failureCallback){
    DeviceRomReviewRequest request = new DeviceRomReviewRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceRomReview(accessToken,productCode,romVer, isReview, reviewMark, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //向设备发送控制命令
  void deviceRunTOTCmd(String accessToken, IOTCMD cmd, SuccessCallback callback, DeviceRunIOTCmdFailureCallback failureCallback){
    DeviceRunIOTCmdRequest request = new DeviceRunIOTCmdRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceRunIOTCmd(accessToken,cmd,failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //设备在离线信息设置 (HUB下的子设备),独立设备的在离线情况也可使用此接口 (重名  DeviceFailCode)
  void deviceStatusGet(String accessToken, List query, SuccessCallback callback, DeviceStatusGetFailureCallback failureCallback){
    DeviceStatusGetRequest request = new DeviceStatusGetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceStatusGet(accessToken, query, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'models':onValue
      });
    });
  }


  //设备在离线信息设置 (HUB下的子设备),独立设备的在离线情况也可使用此接口 (重名)
  void deviceStatusSet(String deviceId, String deviceSeckey, List<StatusInfo> statusInfo, SuccessCallback callback, DeviceStatusSetFailureCallback failureCallback){
    DeviceStatusSetRequest request = new DeviceStatusSetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceStatusSet(deviceId, deviceSeckey, null, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //用戶获取设备的版本号
  void deviceVerGet(String accessToken, List<QueryInfo> query, SuccessCallback callback, DeviceVerGetFailureCallback failureCallback){
    DeviceVerGetRequest request = new DeviceVerGetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceVerGet(accessToken, null, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //设备设置自己的版本号
  void deviceVerSet(String deviceId, String deviceSeckey, String subDeviceId, int swVer, int hwVer, SuccessCallback callback, DeviceVerSetFailureCallback failureCallback){
    DeviceVerSetRequest request = new DeviceVerSetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.deviceVerSet(deviceId, deviceSeckey, subDeviceId, swVer, hwVer, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }


  //添加智能联动
  void eventRuleAdd(
      String deviceId,
      String accessToken,
      String houseGuid,
      String etName,
      int prio,
      int enable,
      int onlyTime,
      String lhs,
      int isEnd,
      List<ExprInfo> exprs,
      List<RhsInfo> rhs,
      SuccessCallback callback,
      EventRuleAddFailureCallback failureCallback
      ){
      EventRuleAddRequest request = new EventRuleAddRequest(shareChannel(),
        clientId: clientId,
        reqTime: _getReqTime(),
        signKey: _getMd5(),);

      request.eventRuleAdd(deviceId, accessToken, houseGuid, etName, prio, enable, onlyTime, lhs, isEnd, exprs, rhs, failureCallback).then((onValue){
        if (onValue == null) return;
        callback({
          'etId':onValue.etId
        });
      });
  }

  //删除智能联动
  void eventRuleDel(String accessToken, String etId, SuccessCallback callback, EventRuleDelFailureCallback failureCallback){
    EventRuleDelRequest request = new EventRuleDelRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.eventRuleDel(accessToken, etId, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //编辑智能联动
  void eventRuleEdit(
      String accessToken,
      String etId,
      String deviceId,
      String etName,
      int onlyTime,
      String lhs,
      int isEnd,
      List<ExprInfo> exprs,
      List<RhsInfo> rhs,
      SuccessCallback callback,
      EventRuleEditFailureCallback failureCallback
      ){
    EventRuleEditRequest request = new EventRuleEditRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.eventRuleEdit(accessToken, etId, deviceId, etName, onlyTime, lhs, isEnd, exprs, rhs, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //获取智能联动
  void eventRuleList(String accessToken, int page, int pageSize, String houseGuid, SuccessCallback callback, EventRuleListFailureCallback failureCallback){
    EventRuleListRequest request = new EventRuleListRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.eventRuleList(accessToken, page, pageSize, houseGuid, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'models':onValue
      });
    });
  }

  //设置智能联动
  void eventRuleSet(String accessToken, String etId, int setType, int setValue, SuccessCallback callback, EventRuleSetFailureCallback failureCallback){
    EventRuleSetRequest request = new EventRuleSetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.eventRuleSet(accessToken, etId, setType, setValue, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'models':onValue
      });
    });
  }

  //用户添加House
  void houseAdd(String accessToken, String houseName, SuccessCallback callback, HouseAddFailureCallback failureCallback){
    HouseAddRequest request = new HouseAddRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.houseAdd(accessToken, houseName, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'houseGuid':onValue.houseGuid
      });
    });
  }

  //添加区域
  void houseAreaAdd(String accessToken, String houseGuid, String areaName,  SuccessCallback callback, HouseAreaAddFailureCallback failureCallback){
    HouseAreaAddRequest request = new HouseAreaAddRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.houseAreaAdd(accessToken, houseGuid, areaName, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'areaGuid':onValue.areaGuid
      });
    });
  }

  //获取House列表
  void houseList(String accessToken, String houseGuid, SuccessCallback callback, HouseListFailureCallback failureCallback){
    HouseListRequest request = new HouseListRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.houseList(accessToken, houseGuid, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'houses':onValue
      });
    });
  }

  //获取区域列表
  void houseAreaList(String accessToken, String houseGuid, SuccessCallback callback, HouseAreaListFailureCallback failureCallback){
    HouseAreaListRequest request = new HouseAreaListRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.houseAreaList(accessToken, houseGuid, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'areas':onValue
      });
    });
  }

  //删除家庭
  void houseDel(String accessToken, String houseGuid, SuccessCallback callback, HouseDelFailureCallback failureCallback){
    HouseDelRequest request = new HouseDelRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.houseDel(accessToken, houseGuid, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'houseGuid':onValue
      });
    });
  }

  //用户添加设备
  void userDeviceAdd(String accessToken, String deviceId, String deviceName, SuccessCallback callback, UserDeviceAddFailureCallback failureCallback){
    UserDeviceAddRequest request = new UserDeviceAddRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.userDeviceAdd(accessToken, deviceId, deviceName, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //用户删除设备
  void userDeviceDel(String accessToken, String deviceId, SuccessCallback callback, UserDeviceDelFailureCallback failureCallback){
    UserDeviceDelRequest request = new UserDeviceDelRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.userDeviceDel(accessToken, deviceId, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //用户编辑设备
  void userDeviceEdit(String accessToken, String deviceId, String deviceName, SuccessCallback callback, UserDeviceEditFailureCallback failureCallback){
    UserDeviceEditRequest request = new UserDeviceEditRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.userDeviceEdit(accessToken, deviceId, deviceName, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //用户设备列表
  void userDeviceList(String accessToken, int page, int pageSize, SuccessCallback callback, UserDeviceListFailureCallback failureCallback){
    UserDeviceListRequest request = new UserDeviceListRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.userDeviceList(accessToken, page, pageSize, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'models':onValue
      });
    });
  }

  //添加场景
  void sceneAdd(String accessToken, String houseGuid, String sceneName, String sceneId, IOTCMD cmd, SuccessCallback callback, SceneAddFailureCallback failureCallback){
    SceneAddRequest request = new SceneAddRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.sceneAdd(accessToken, houseGuid, sceneName, sceneId, cmd, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //删除场景
  void sceneDel(String accessToken, String sceneId, SuccessCallback callback, SceneDelFailureCallback failureCallback){
    SceneDelRequest request = new SceneDelRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.sceneDel(accessToken, sceneId, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //编辑场景
  void sceneEdit(String accessToken,  String sceneName, String sceneId, IOTCMD cmd, SuccessCallback callback, SceneAddFailureCallback failureCallback){
    SceneEditRequest request = new SceneEditRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.sceneEdit(accessToken,  sceneName, sceneId, cmd, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //获取场景
  void sceneList(String accessToken, String houseGuid, int page, int pageSize, SuccessCallback callback, SceneListFailureCallback failureCallback){
    SceneListRequest request = new SceneListRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.sceneList(accessToken,  houseGuid, page, pageSize, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({
        'models':onValue
      });
    });
  }

  //开启场景
  void sceneActive(String accessToken, String houseGuid, String sceneId, SuccessCallback callback, SceneActiveFailureCallback failureCallback){
    SceneActiveRequest request = new SceneActiveRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.sceneActive(accessToken,  houseGuid, sceneId, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //获取家庭设备
  void houseDeviceList(
      String accessToken,
      String houseGuid,
      int page,
      int pageSize,
      SuccessCallback callback,
      HouseDeviceListFailureCallback failureCallback,
      {
        String prodtType='',
        String areaGuid,
      }){
    HouseDeviceListRequest request = new HouseDeviceListRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.houseDeviceList(
        accessToken,
        houseGuid,
        page,
        pageSize,
        failureCallback,
        prodtType: prodtType,
        areaGuid: areaGuid
    ).then((onValue){
      if (onValue == null) return;
      callback({
        'models':onValue
      });
    });
  }

  //删除区域设备
  void houseAreaDeviceDel(String accessToken, String houseGuid, String areaGuid, String deviceId, String subDeviceId, SuccessCallback callback, HouseAreaDeviceDelFailureCallback failureCallback){
    HouseAreaDeviceDelRequest request = new HouseAreaDeviceDelRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.houseAreaDeviceDel(
        accessToken,
        houseGuid,
        areaGuid,
        deviceId,
        subDeviceId='',
        failureCallback,
    ).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //添加（编辑）区域设备
  void houseAreaDeviceSet(String accessToken, String houseGuid, String areaGuid, String deviceId, String subDeviceId, SuccessCallback callback, HouseAreaDeviceDelFailureCallback failureCallback){
    HouseAreaDeviceSetRequest request = new HouseAreaDeviceSetRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.houseAreaDeviceSet(
      accessToken,
      houseGuid,
      areaGuid,
      deviceId,
      subDeviceId,
      failureCallback,
    ).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //用户修改手机号
  void userPhoneChange(
      String accessToken,
      String oldPhone,
      String oldVcode,
      String newPhone,
      String newVcode,
      SuccessCallback callback,
      UserPhoneChangeFailureCallback failureCallback){
    UserPhoneChangeRequest request = new UserPhoneChangeRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.userPhoneChange(
      accessToken,
      oldPhone,
      oldVcode,
      newPhone,
      newVcode,
      failureCallback,
    ).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }

  //修改密码
  void userChangePass(String accessToken, String newPass, SuccessCallback callback, UserChangePassFailureCallback failureCallback){
    UserChangePassRequest request = new UserChangePassRequest(shareChannel(),
      clientId: clientId,
      reqTime: _getReqTime(),
      signKey: _getMd5(),);

    request.userChangePass(accessToken, newPass, failureCallback).then((onValue){
      if (onValue == null) return;
      callback({

      });
    });
  }


}