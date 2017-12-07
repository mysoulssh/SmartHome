import 'package:watchapp_flutter/deviceItems/models/status_info_model.dart';
import 'package:watchapp_flutter/deviceItems/ai_add_rule_cell.dart';

class TypeJudgment{

  static String judgmentType(String type){
    String jType = '未知设备';

    switch (type){
      case 'YHUB':
        jType = '中控';
        break;
      case 'CHDL':
        jType = '门锁';
        break;
      case 'CHSW':
        jType = '开关';
        break;
      case 'CHLL':
        jType = 'RGB灯';
        break;
      case 'SHHI':
        jType = '体感';
        break;
      case 'SHLI':
        jType = '光照度';
        break;
      case 'SHMC':
        jType = '门磁';
        break;
      case 'BHDB':
        jType = '门铃';
        break;
      case 'BSOS':
        jType = 'SOS';
        break;
      case 'CIRC':
        jType = '红外遥控';
        break;
      case 'CAIR':
        jType = '空调';
        break;
      case 'CHCL':
        jType = '窗帘';
        break;
      case 'SHYG':
        jType = '烟感';
        break;
      case 'SHWG':
        jType = '温度传感器';
        break;
      case 'SHSG':
        jType = '湿度传感器';
        break;
      case 'CHCZ':
        jType = '插座';
        break;
      case 'YSBS':
        jType = '边界服务器';
        break;
      case 'BHSC':
        jType = '情景按钮';
        break;
      case 'BHCC':
        jType = '窗帘按钮';
        break;
      case 'BHSW':
        jType = '开关按钮';
        break;
      case 'YSWO':
        jType = '智能手表';
        break;
    }

    return jType;
  }

  static bool judgmentSwitch(StatusInfoModel status, String type){
    bool switchs = false;

     switch (type){
      case 'CHDL':
//        jType = '门锁';
        break;
      case 'CHSW':
//        jType = '开关';
        {
          if(status.argInt32.length > 0)
          switchs = status.argInt32.last == 1;
        }
        break;
      case 'CHLL':
//        jType = 'RGB灯';
        break;
      case 'SHHI':
//        jType = '体感';
        break;
      case 'SHLI':
//        jType = '光照度';
        break;
      case 'SHMC':
//        jType = '门磁';
      {
        if(status.argInt32.length > 0)
        switchs = status.argInt32.last == 1;
      }
        break;
      case 'BHDB':
//        jType = '门铃';
        break;
      case 'BSOS':
//        jType = 'SOS';
        break;
      case 'CIRC':
//        jType = '红外遥控';
        break;
      case 'CAIR':
//        jType = '空调';
        break;
      case 'CHCL':
//        jType = '窗帘';
        break;
      case 'SHYG':
//        jType = '烟感';
        break;
      case 'SHWG':
//        jType = '温度传感器';
        break;
      case 'SHSG':
//        jType = '湿度传感器';
        break;
      case 'CHCZ':
//        jType = '插座';
        break;
      case 'YSBS':
//        jType = '边界服务器';
        break;
      case 'BHSC':
//        jType = '情景按钮';
        break;
      case 'BHCC':
//        jType = '窗帘按钮';
        break;
      case 'BHSW':
//        jType = '开关按钮';
        break;
      case 'YSWO':
//        jType = '智能手表';
        break;
    }

    return switchs;
  }

  static DeviceRuleType judgmentDeviceRuleType(String type){

    DeviceRuleType deviceRuleType = DeviceRuleType.DeviceRuleTypeScene;

    switch (type){
      case 'YHUB':
//        jType = '中控';
        break;
      case 'CHDL':
//        jType = '门锁';
        break;
      case 'CHSW':
//        jType = '开关';
      deviceRuleType = DeviceRuleType.DeviceRuleTypeSwitch;
        break;
      case 'CHLL':
//        jType = 'RGB灯';
      deviceRuleType = DeviceRuleType.DeviceRuleTypeLight;
        break;
      case 'SHHI':
//        jType = '体感';
        break;
      case 'SHLI':
//        jType = '光照度';
        break;
      case 'SHMC':
//        jType = '门磁';
        break;
      case 'BHDB':
//        jType = '门铃';
        break;
      case 'BSOS':
//        jType = 'SOS';
        break;
      case 'CIRC':
//        jType = '红外遥控';
        break;
      case 'CAIR':
//        jType = '空调';
        break;
      case 'CHCL':
//        jType = '窗帘';
        break;
      case 'SHYG':
//        jType = '烟感';
        break;
      case 'SHWG':
//        jType = '温度传感器';
        break;
      case 'SHSG':
//        jType = '湿度传感器';
        break;
      case 'CHCZ':
//        jType = '插座';
        break;
      case 'YSBS':
//        jType = '边界服务器';
        break;
      case 'BHSC':
//        jType = '情景按钮';
        break;
      case 'BHCC':
//        jType = '窗帘按钮';
        break;
      case 'BHSW':
//        jType = '开关按钮';
        break;
      case 'YSWO':
//        jType = '智能手表';
        break;
    }

    return deviceRuleType;

  }

  static int judgmentDeviceCmdType(String type){

    int cmdId = 0;

    switch (type){
      case 'YHUB':
//        jType = '中控';
        break;
      case 'CHDL':
//        jType = '门锁';
        break;
      case 'CHSW':
//        jType = '开关';
        cmdId = 201;
        break;
      case 'CHLL':
//        jType = 'RGB灯';
      cmdId = 202;
        break;
      case 'SHHI':
//        jType = '体感';
        break;
      case 'SHLI':
//        jType = '光照度';
      cmdId = 203;
        break;
      case 'SHMC':
//        jType = '门磁';
        break;
      case 'BHDB':
//        jType = '门铃';
        break;
      case 'BSOS':
//        jType = 'SOS';
        break;
      case 'CIRC':
//        jType = '红外遥控';
        break;
      case 'CAIR':
//        jType = '空调';
        break;
      case 'CHCL':
//        jType = '窗帘';
        break;
      case 'SHYG':
//        jType = '烟感';
        break;
      case 'SHWG':
//        jType = '温度传感器';
        break;
      case 'SHSG':
//        jType = '湿度传感器';
        break;
      case 'CHCZ':
//        jType = '插座';
        break;
      case 'YSBS':
//        jType = '边界服务器';
        break;
      case 'BHSC':
//        jType = '情景按钮';
        break;
      case 'BHCC':
//        jType = '窗帘按钮';
        break;
      case 'BHSW':
//        jType = '开关按钮';
        break;
      case 'YSWO':
//        jType = '智能手表';
        break;
    }

    return cmdId;

  }

}