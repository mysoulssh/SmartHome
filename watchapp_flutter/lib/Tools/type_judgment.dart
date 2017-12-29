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
        cmdId = 401;
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
      cmdId = 201;
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
        cmdId = 201;
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
        cmdId = 201;
        break;
      case 'BHCC':
//        jType = '窗帘按钮';
        cmdId = 201;
        break;
      case 'BHSW':
//        jType = '开关按钮';
        cmdId = 201;
        break;
      case 'YSWO':
//        jType = '智能手表';
        break;
    }

    return cmdId;

  }

  //返回房间图片
  static String judgmentAreaImage(String area){

    String image = 'images/icon_bedroom.png';

    switch (area){
      case '书房':
        image = 'images/icon_study.png';
        break;
      case '卧室':
        image = 'images/icon_bedroom.png';
        break;
      case '厨房':
        image = 'images/icon_kitchen.png';
        break;
      case '客厅':
        image = 'images/icon_livingroom.png';
        break;
    }

    return image;

  }

  //设备图片
  static String judgmentDeviceImage(String device){
    String image = 'images/icon_inductor.png';
    switch (device){
      case 'YHUB':
//        jType = '中控';
      image = 'images/icon_centercontrol.png';
        break;
      case 'CHDL':
//        jType = '门锁';
        break;
      case 'CHSW':
//        jType = '开关';
        break;
      case 'CHLL':
//        jType = 'RGB灯';
      image = 'images/icon_light.png';
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
      image = 'images/icon_doorbell.png';
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
    return image;
  }

  static String judgmentRelation(int code){
    String relation = '其他';

    switch (code){
      case 8001:
        relation = '父亲';
        break;
      case 8002:
        relation = '母亲';
        break;
      case 8003:
        relation = '爷爷';
        break;
      case 8004:
        relation = '奶奶';
        break;
      case 8005:
        relation = '外公';
        break;
      case 8006:
        relation = '外婆';
        break;
      case 8007:
        relation = '哥哥';
        break;
      case 8008:
        relation = '姐姐';
        break;
      case 8009:
        relation = '弟弟';
        break;
      case 8010:
        relation = '妹妹';
        break;
      case 8011:
        relation = '儿子';
        break;
      case 8012:
        relation = '女儿';
        break;
      case 8013:
        relation = '孙子';
        break;
      case 8014:
        relation = '孙女';
        break;
      case 8015:
        relation = '外孙子';
        break;
      case 8016:
        relation = '外孙女';
        break;
      case 8017:
        relation = '老公';
        break;
      case 8018:
        relation = '老婆';
        break;
      case 8888:
        relation = '其他';
        break;
    }

    return relation;
  }

}