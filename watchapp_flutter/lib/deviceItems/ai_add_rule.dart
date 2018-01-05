import 'package:flutter/material.dart';
import 'ai_add_condition.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'ai_condition_info.dart';
import 'device_add_action.dart';
import 'device_add_centercontrol.dart';
import 'cells/action_scene_cell_model.dart';
import 'ai_add_rule_cell.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';
import 'package:watchapp_flutter/deviceItems/models/subdevice_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/DeviceStatusGet/DeviceStatusGet.pb.dart';
import 'package:watchapp_flutter/deviceItems/models/status_info_model.dart';

import 'ai_add_rule_scene.dart';
import 'ai_ligth_scene.dart';
import 'ai_switch_scene.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';

class AiAddRule extends StatefulWidget{

  AiAddRule({this.isEditRule,this.ruleName,this.ruleInfo});

  bool isEditRule;
  String ruleName;

  RuleInfo ruleInfo;

  @override
  _AiAddRuleState createState() => new _AiAddRuleState();
}

class _AiAddRuleState extends State<AiAddRule>{

  final TextEditingController _controller = new TextEditingController();
  final List<AiConditionModel> modelList = <AiConditionModel>[];
  final List<Widget> conditionList = <Widget>[];
  final List<ConditonType> conditionListType = <ConditonType>[];

  final List<String> decNameList = <String>[];

  final List<AiAddRuleCell> ruleActionCell = <AiAddRuleCell>[];

  int insetIndex;

  @override
  void initState(){
    super.initState();

    if (widget.ruleInfo == null){
      widget.ruleInfo = new RuleInfo();
    }

    if (widget.isEditRule){
//      _controller.text = widget.ruleName;
//
//      for (var v in widget.ruleInfo.rhs){     //遍历动作
//
//        String text1 = TypeJudgment.judgmentType(v.cmd.subDeviceId!=null||v.cmd.subDeviceId!=''?v.cmd.subDeviceId.substring(4,8):v.cmd.deviceId.substring(4,8));
//
//        String text2 = '';
//        if (v.cmd.argInt32.length != 0 && v.cmd.argInt32 != null){    //数值动作
//          text2 = v.cmd.argInt32.first == 1?'开启':'关闭';
//        }
//
//        DeviceRuleType ruleType = TypeJudgment.judgmentDeviceRuleType(v.cmd.subDeviceId!=null||v.cmd.subDeviceId!=''?v.cmd.subDeviceId.substring(4,8):v.cmd.deviceId.substring(4,8));
//
//        AiAddRuleCell ruleCell = new AiAddRuleCell(
//          text1: text1,
//          text2: text2,
//          text3: '一直持续',
//          deviceRuleType: ruleType,
//          controlCallback: (){
//            switch (ruleType){
//              case DeviceRuleType.DeviceRuleTypeSwitch:     //开关
//                {
//                  AiSwitchScene switchScene = new AiSwitchScene(isSwitchOn: v.cmd.argInt32.first == 1, callback: (bool isOpen){
//                    SIOTCMD cmd = new SIOTCMD()
//                      ..deviceId = v.cmd.deviceId
//                      ..subDeviceId = v.cmd.subDeviceId
//                      ..cmdid = 201
//                      ..argInt32.add(isOpen?1:0);
//
//                    v.actionType = 1;
//                    v.cmd = cmd;
//
//                  },);
//                  Navigator.of(context).push(new MaterialPageRoute(
//                      builder: (BuildContext context) => new NavigationBar(switchScene, text1,
//                        actions: <Widget>[
//                          new RightBtnItem('设置', (){
//                            print('设置');
//                          })
//                        ],)
//                  ));
//                }
//                break;
//              case DeviceRuleType.DeviceRuleTypeScene:      //场景
//                break;
//              case DeviceRuleType.DeviceRuleTypeLight:      //灯光
//                {
//                  AiLightScene lightScene = new AiLightScene(isSwitchOn: v.cmd.argInt32.first == 1, changeColorsCallback: (int r, int g, int b){
//                    print('r = $r   g = $g   b = $b');
//                    SIOTCMD cmd = new SIOTCMD()
//                      ..deviceId = v.cmd.deviceId
//                      ..subDeviceId = v.cmd.subDeviceId
//                      ..cmdid = 201
//                      ..argInt32.add(1);
//
//                    v.actionType = 1;
//                    v.cmd = cmd;
//
//                  },);
//                  Navigator.of(context).push(new MaterialPageRoute(
//                      builder: (BuildContext context) => new NavigationBar(lightScene, text1,
//                        actions: <Widget>[
//                          new RightBtnItem('设置', (){
//                            print('设置');
//                          })
//                        ],)
//                  ));
//                }
//                break;
//              case DeviceRuleType.DeviceRuleTypeCommon:     //大众
//                break;
//            }
//          },
//          timeCallback: (){
//            print('时间回调');
//          },
//        );
//
//        ruleActionCell.add(ruleCell);
//        print('$v');
//      }

      riActions();
    }

    insetIndex = 2;
    conditionList.add(new Container(
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Padding(
                padding: const EdgeInsets.all(13.0),
                child: new Text('规则名称',style: new TextStyle(fontSize: 16.0),),
              )
          ),
          new Expanded(
            child: new Container(
              padding: const EdgeInsets.fromLTRB(10.0, 13.0, 10.0, 13.0),
              child: new TextField(
                controller: _controller,
                onChanged: (String value){
                  widget.ruleInfo.etName = value;
                },
                textAlign: TextAlign.end,
                decoration: new InputDecoration.collapsed(
                    hintText: '请添加规则名称'
                ),
              ),
            ),
          )
        ],
      ),
    ));
    conditionList.add(new Container(
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(13.0, 8.0, 8.0, 8.0),
        child: new Text(
          '设置触发条件',
          style: new TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
      ),
    ));

    if (widget.ruleInfo.exprs != null){
      for (var v in widget.ruleInfo.exprs){

        if (v.deviceId == '' && v.subDeviceId == ''){   //时间

          int startHours = (v.startTime~/3600).toInt();
          int startMins  = (v.startTime%3600~/60).toInt();

          int endHours = (v.endTime~/3600).toInt();
          int endMins  = (v.endTime%3600~/60).toInt();

          conditionList.add(createDecCondition('时间', true, '$startHours:$startMins 至 $endHours:$endMins', ''));

          decNameList.add('时间');
        }else{                                          //事件
          String devName = TypeJudgment.judgmentType(v.subDeviceId != null||v.subDeviceId != ''?v.subDeviceId.substring(4,8):v.deviceId.substring(4,8));

          String openStr = '有人';
          String closeStr = '无人';

          if (devName == '门磁'){
            openStr = '打开';
            closeStr = '关闭';
          }else if (devName == '门铃' || devName == '情景按钮'){
            openStr = '触发';
            closeStr = '';
          }

          conditionList.add(createDecCondition(devName, v.value==1, openStr, closeStr));
          decNameList.add(devName);
        }
        insetIndex ++;
      }
    }

    conditionList.add(new GestureDetector(
      onTap: (){
        print('添加条件');

        print('${widget.ruleInfo.exprs}');

        AiAddCondition addCondition = new AiAddCondition(existExps: widget.ruleInfo.exprs,callback: (ConditonType type, List<String> conditionTextList, List<DecState> conditionStates, List<ExprInfo> exprInfos){

          for (var v in exprInfos){
            widget.ruleInfo.exprs.add(v);
          }

          print('\ntype = $type  \nconditionTextList = $conditionTextList \nconditionSelectList = $conditionStates');

          if (ruleActionCell.length > 0){
            conditionList.removeRange(conditionList.length-ruleActionCell.length, conditionList.length);
          }

          if (type == ConditonType.ConditionDec){         //传感器
            List<String> tmpList = <String>[];
            for (int i=0;i<conditionStates.length;i++){
              DecState state = conditionStates[i];
              if (state != DecState.DecNormal){
                tmpList.add(conditionTextList[i]);
                decNameList.insert(insetIndex-2, conditionTextList[i]);
                String openStr = '有人';
                String closeStr = '没人';

                if (conditionTextList[i] == '门磁'){
                  openStr = '开启';
                  closeStr = '关闭';
                }else if (conditionTextList[i] == '门铃' || conditionTextList[i] == '情景按钮'){
                  openStr = '触发';
                  closeStr = '';
                }

                conditionList.insert(insetIndex, createDecCondition(conditionTextList[i], state==DecState.DecPeople?true:false, openStr, closeStr));
                insetIndex++;

              }
            }

            for (String tmp in tmpList){
              conditionTextList.remove(tmp);
            }
          }else if (type == ConditonType.ConditionTime){

            int startHour   = (exprInfos.first.startTime~/3600).toInt();
            int startMinute = (exprInfos.first.startTime%3600~/60).toInt();

            int endHour   = (exprInfos.first.endTime~/3600).toInt();
            int endMinute = (exprInfos.first.endTime%3600~/60).toInt();

            conditionList.insert(insetIndex, createDecCondition('时间', true, '$startHour:$startMinute 至 $endHour:$endMinute', ''));

            Navigator.of(context).pop();
          }

          riActions();

          for (AiAddRuleCell cell in ruleActionCell){
            conditionList.add(new AiAddRuleCell(
              text1: cell.text1,
              text2: cell.text2,
              text3: cell.text3,
              deviceRuleType: cell.deviceRuleType,
              subDeviceInfoModel: cell.subDeviceInfoModel,
              statusInfoModel: cell.statusInfoModel,
              controlCallback: cell.controlCallback,
              timeCallback: cell.timeCallback,
            ));
          }

        },);
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new NavigationBar(addCondition, '添加条件')
        ));
      },
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: new Text('添加条件',style: new TextStyle(fontSize: 16.0),),
                )
            ),
            new Container(
              padding: const EdgeInsets.all(8.0),
              child: new SizedBox(
                width: 18.0,
                height: 18.0,
                child: new Image(image: new AssetImage('images/btn_next2_n.png'),),
              ),
            )
          ],
        ),
      ),
    ));
    conditionList.add(new Row(
      children: <Widget>[
        new Expanded(child: new Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
          child: new Container(
            padding: const EdgeInsets.all(13.0),
            color: Colors.white,
            child: new Text(
              '达到设置条件后执行以下动作',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 16.0),
            ),
          ),
        ))
      ],
    ));
    if (ruleActionCell.length == 0) {
      conditionList.add(new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new SizedBox(
              width: 250.0,
              height: 250.0,
              child: new Padding(
                padding: const EdgeInsets.all(50.0),
                child: new Image(image: new AssetImage('images/img_clock.png')),
              ),
            ),
          )
        ],
      ));
    }else{
      for (AiAddRuleCell cell in ruleActionCell){
        conditionList.add(cell);
      }
    }

  }

  void riActions(){
    _controller.text = widget.ruleName;

    ruleActionCell.removeRange(0, ruleActionCell.length);

    for (var v in widget.ruleInfo.rhs){     //遍历动作

      String text1 = TypeJudgment.judgmentType(v.cmd.subDeviceId!=null||v.cmd.subDeviceId!=''?v.cmd.subDeviceId.substring(4,8):v.cmd.deviceId.substring(4,8));

      String text2 = '';
      if (v.cmd.argInt32.length != 0 && v.cmd.argInt32 != null){    //数值动作
        text2 = v.cmd.argInt32.first == 1?'开启':'关闭';
      }

      DeviceRuleType ruleType = TypeJudgment.judgmentDeviceRuleType(v.cmd.subDeviceId!=null||v.cmd.subDeviceId!=''?v.cmd.subDeviceId.substring(4,8):v.cmd.deviceId.substring(4,8));

      AiAddRuleCell ruleCell = new AiAddRuleCell(
        text1: text1,
        text2: text2,
        text3: '一直持续',
        deviceRuleType: ruleType,
        controlCallback: (){
          switch (ruleType){
            case DeviceRuleType.DeviceRuleTypeSwitch:     //开关
              {
                AiSwitchScene switchScene = new AiSwitchScene(isSwitchOn: v.cmd.argInt32.first == 1, callback: (bool isOpen){
                  SIOTCMD cmd = new SIOTCMD()
                    ..deviceId = v.cmd.deviceId
                    ..subDeviceId = v.cmd.subDeviceId
                    ..cmdid = 201
                    ..argInt32.add(isOpen?1:0);

                  v.actionType = 1;
                  v.cmd = cmd;

                },);
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new NavigationBar(switchScene, text1,
                      actions: <Widget>[
                        new RightBtnItem('设置', (){
                          print('设置');
                        })
                      ],)
                ));
              }
              break;
            case DeviceRuleType.DeviceRuleTypeScene:      //场景
              break;
            case DeviceRuleType.DeviceRuleTypeLight:      //灯光
              {
                AiLightScene lightScene = new AiLightScene(isSwitchOn: v.cmd.argInt32.first == 1, changeColorsCallback: (int r, int g, int b){
                  print('r = $r   g = $g   b = $b');
                  SIOTCMD cmd = new SIOTCMD()
                    ..deviceId = v.cmd.deviceId
                    ..subDeviceId = v.cmd.subDeviceId
                    ..cmdid = 201
                    ..argInt32.add(1);

                  v.actionType = 1;
                  v.cmd = cmd;

                },);
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new NavigationBar(lightScene, text1,
                      actions: <Widget>[
                        new RightBtnItem('设置', (){
                          print('设置');
                        })
                      ],)
                ));
              }
              break;
            case DeviceRuleType.DeviceRuleTypeCommon:     //大众
              break;
          }
        },
        timeCallback: (){
          print('时间回调');
        },
      );

      ruleActionCell.add(ruleCell);
      print('$v');
    }
  }

  Widget createDecCondition(String decName, bool isTurnOn, String openStr, String closeStr){
    return new Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      color: new Color.fromRGBO(214, 214, 214, 1.0),
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Expanded(child: new Padding(
              padding: const EdgeInsets.all(13.0),
              child: new Text(decName,style: const TextStyle(fontSize: 16.0)),
            )),
            new Padding(
              padding: const EdgeInsets.all(13.0),
              child: new Text(isTurnOn?openStr:closeStr,style: const TextStyle(fontSize: 16.0)),
            )
          ],
        ),
      ),
    );
  }

  void resetConditionRuleCell(){
    for(var v in ruleActionCell){
      conditionList.removeLast();
    }

    for(var v in ruleActionCell){
      conditionList.add(v);
    }
    setState((){});
  }

  @override
  Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        new Expanded(child: new ListView.builder(
          itemBuilder: (_,int index) => conditionList[index],
          itemCount: conditionList.length,
        )),
        new GestureDetector(
          onTap: (){
            print('添加动作');

            if (widget.isEditRule){      //修改规则
              String tmpId = widget.ruleInfo.rhs.first.cmd.deviceId;
              print('$tmpId');
              DeviceAddAction actionScene = new DeviceAddAction(isRule: true, deviceId: widget.ruleInfo.rhs.first.cmd.deviceId,callback: (ActionSceneCellModel model, SubDeviceInfoModel subDeviceInfoModel){

              },);
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context){
                    return new NavigationBar(actionScene, '添加动作');
                  }
              ));
            }else{                        //添加规则
              DeviceCenterControl centerScene = new DeviceCenterControl(isRule: true,callback: (ActionSceneCellModel model, SubDeviceInfoModel subDeviceInfoModel){
                print('$subDeviceInfoModel');

                List<QueryInfo> queryInfos = <QueryInfo>[
                  new QueryInfo()
                    ..subDeviceId = subDeviceInfoModel.subDeviceId
                    ..deviceId    = model.deviceId,
                ];

                RhsInfo rhsInfo = new RhsInfo();
                bool existInfo = false;
                for (var v in widget.ruleInfo.rhs){
                  if(v.cmd.deviceId == model.deviceId && v.cmd.subDeviceId == subDeviceInfoModel.subDeviceId){
                    existInfo = true;
                    rhsInfo = v;
                    break;
                  }
                }

                if (!existInfo){
                  if (subDeviceInfoModel.subDeviceId.substring(4,8) == 'CHSW'){  //开关命令
                    rhsInfo.actionType = 1;
                    rhsInfo.cmd = new SIOTCMD()
                      ..argInt32.add(0)
                      ..deviceId = model.deviceId
                      ..subDeviceId = subDeviceInfoModel.subDeviceId
                      ..cmdid = 201;
                  }

                  widget.ruleInfo.rhs.add(rhsInfo);
                }

                httpManage.deviceStatusGet(UserAccessModel.accessModel.accessToken, queryInfos, (Map map){
                  List<StatusInfoModel> statusInfoModels = map['models'];
                  StatusInfoModel statusInfoModel = statusInfoModels.first;

                  String typeStr = TypeJudgment.judgmentType(subDeviceInfoModel.subDeviceId.substring(4,8));
                  String tmpStr = '关闭';

                  AiAddRuleCell ruleCell = new AiAddRuleCell(
                    text1: typeStr,
                    text2: tmpStr,
                    text3: '一直持续',
                    deviceRuleType: TypeJudgment.judgmentDeviceRuleType(subDeviceInfoModel.subDeviceId.substring(4,8)),
                    subDeviceInfoModel: subDeviceInfoModel,
                    statusInfoModel: statusInfoModel,
                    controlCallback: (){
                      switch(TypeJudgment.judgmentDeviceRuleType(subDeviceInfoModel.subDeviceId.substring(4,8))){
                        case DeviceRuleType.DeviceRuleTypeScene:      //场景模式
                          {
                            AiAddRuleScene ruleScene = new AiAddRuleScene();
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new NavigationBar(ruleScene, typeStr,
                                  actions: <Widget>[
                                    new RightBtnItem('保存', (){
                                      print('保存');
                                      var list = ruleScene.ruleScene.switchList;
                                      print('$list');
                                      Navigator.of(context).pop();
                                    })
                                  ],
                                )
                            ));
                          }
                          break;
                        case DeviceRuleType.DeviceRuleTypeLight:      //灯光模式
                          {
                            AiLightScene lightScene = new AiLightScene(isSwitchOn: statusInfoModel.online==1,);
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new NavigationBar(lightScene, typeStr,
                                  actions: <Widget>[
                                    new RightBtnItem('设置', (){
                                      print('设置');
                                    })
                                  ],)
                            ));
                          }
                          break;
                        case DeviceRuleType.DeviceRuleTypeSwitch:     //开关模式
                          {
                            AiSwitchScene switchScene = new AiSwitchScene(isSwitchOn: statusInfoModel.online==1, callback: (bool isOpen){
                              SIOTCMD cmd = new SIOTCMD()
                                ..deviceId = model.deviceId
                                ..subDeviceId = subDeviceInfoModel.subDeviceId
                                ..cmdid = 201
                                ..argInt32.add(isOpen?1:0);

                              rhsInfo.actionType = 1;
                              rhsInfo.cmd = cmd;

                              tmpStr = cmd.argInt32.first == 1?'开启':'关闭';

                              resetConditionRuleCell();

                            },);
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new NavigationBar(switchScene, typeStr,
                                  actions: <Widget>[
                                    new RightBtnItem('设置', (){
                                      print('设置');
                                    })
                                  ],)
                            ));
                          }
                          break;
                        case DeviceRuleType.DeviceRuleTypeCommon:     //大众模式
                          break;
                      }
                    },
                    timeCallback: (){
                      showTimePicker(context: context, initialTime: new TimeOfDay.fromDateTime(new DateTime.now())).then((TimeOfDay value){
                        resetConditionRuleCell();
                      });
                    },
                  );

                  ruleActionCell.add(ruleCell);
                  if (ruleActionCell.length == 1){
                    conditionList.removeLast();
                  }

                  conditionList.add(ruleActionCell.last);


                  setState((){});
                }, (String errorMsg){

                });


              },);
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context){
                    return new NavigationBar(centerScene, '选择中控器');
                  }
              ));
            }

          },
          child: new Container(
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Image(image: const AssetImage('images/icon_phone_gold.png')),
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                  child: new Text(
                    '添加动作',
                    style: new TextStyle(
                        color: new Color.fromRGBO(160, 122, 82, 1.0),
                        fontSize: 16.0
                    ),),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }




}

class AiConditionModel{
  ConditonType type;
  String condition;
  bool isTurnOn;
}