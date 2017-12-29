import 'package:flutter/material.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/deviceItems/models/subdevice_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';

enum ConditonType{
  ConditionDec,     //传感器
  ConditionTime,    //时间
}

class AiConditionInfo extends StatefulWidget{

  AiConditionInfo(this.conditonType,{this.deviceId,this.existExps});

  final ConditonType conditonType;
  final String deviceId;
  final List<ExprInfo> existExps;

  _AiConditionInfoState infoState = new _AiConditionInfoState();

  @override
  _AiConditionInfoState createState() => infoState;
}

class _AiConditionInfoState extends State<AiConditionInfo>{

  List<String> conditionText  = <String>[];
  List<Widget> cells          = <Widget>[];
  List<DecState> states       = <DecState>[];
  //条件定义
  List<ExprInfo> exprInfos    = <ExprInfo>[];
  List<String> conditions     = <String>[];
  List<int> conditionsValue   = <int>[];
  List<SubDeviceInfoModel> subDeviceInfoModels;

  void setConditionText(List<SubDeviceInfoModel> models){
    conditionText.removeRange(0, conditionText.length);

    for (var v in models){
      String type = v.subDeviceId.substring(3,4);
      if(type != 'C'){
        bool isShow = true;
        for (var exp in widget.existExps){
          if(exp.subDeviceId == v.subDeviceId){
            isShow = false;
            break;
          }
        }
        if (isShow){
          conditionText.add(TypeJudgment.judgmentType(v.subDeviceId.substring(4,8)));
          conditions.add('==');
          conditionsValue.add(0);
        }
      }
    }

    reloadList();
  }


  void reloadList(){
    states = <DecState>[];
    cells = <Widget>[];

    List<SubDeviceInfoModel> tmpList = <SubDeviceInfoModel>[];
    for (var v in subDeviceInfoModels){
      String type = v.subDeviceId.substring(3,4);
      if (type != 'C'){
        tmpList.add(v);
      }
    }

    int i = 0;
    for (String tmp in conditionText){
      states.add(DecState.DecNormal);
      if (tmp == '门磁'){
        createCell(i, tmp, '开启', '关闭', tmpList);
      }else if (tmp == '门铃' || tmp == '情景按钮'){
        createCell(i, tmp, '触发', '', tmpList);
      }else if(tmp == '光感'|| tmp == '温度' || tmp == '湿度'){
        cells.add(new InductionCell(tmp, i, tmpList, conditions, conditionsValue, states, exprInfos, widget.deviceId));
      }else{
        createCell(i, tmp, '有人', '无人', tmpList);
      }

      i++;
    }
    


    setState((){});
  }


  void createCell(int i, String tmp,String openStr, String closeStr, List<SubDeviceInfoModel> tmpList){
    cells.add(new DecCell(tmp,DecState.DecNormal,i,stateChanged: (int index,DecState state){
      states[index] = state;
      exprInfos = <ExprInfo>[];

      for (var j=0; j<states.length; j++){
        DecState exState = states[j];
        if(exState != DecState.DecNormal){

          if (exState == DecState.DecPeople || exState == DecState.DecNobody){
            ExprInfo info     = new ExprInfo();
            info.deviceId     = widget.deviceId;
            info.subDeviceId  = tmpList[j].subDeviceId;
            info.class_2      = 1;
            info.itemType     = 1;
            info.itemIndex    = 2;
            info.expr         = '==';
            info.value        = exState==DecState.DecPeople?1:0;
            exprInfos.add(info);
          }else{

            ExprInfo info     = new ExprInfo();
            if (exState == DecState.DecLight){        //光感
              info.deviceId     = widget.deviceId;
              info.subDeviceId  = tmpList[j].subDeviceId;
              info.class_2      = 1;
              info.itemType     = 1;
              info.itemIndex    = 3;
              info.expr         = conditions[j];
              info.value        = conditionsValue[j];
              exprInfos.add(info);
            }else if (exState == DecState.Dectemperature){  //温度
              info.deviceId     = widget.deviceId;
              info.subDeviceId  = tmpList[j].subDeviceId;
              info.class_2      = 1;
              info.itemType     = 1;
              info.itemIndex    = 3;
              info.expr         = conditions[j];
              info.value        = conditionsValue[j]*10;
              exprInfos.add(info);
            }else if (exState == DecState.DecHumidity){   //湿度
              info.deviceId     = widget.deviceId;
              info.subDeviceId  = tmpList[j].subDeviceId;
              info.class_2      = 1;
              info.itemType     = 1;
              info.itemIndex    = 4;
              info.expr         = conditions[j];
              info.value        = conditionsValue[j]*100;
              exprInfos.add(info);
            }
          }

        }
      }

    },openStr: openStr, closeStr: closeStr,));
  }

  @override
  void initState(){
    super.initState();

    loadDeviceList();
  }

  //带条件控制的设备（IOTS、IOTB）
  void loadDeviceList(){
    httpManage.deviceHubDeviceList(UserAccessModel.accessModel.accessToken, widget.deviceId, (Map map){
      List<SubDeviceInfoModel> models = map['models'];
      subDeviceInfoModels = models;
      setConditionText(models);

    }, (String errorMsg){

    });

  }


  @override
  Widget build(BuildContext context){
    return new Container(
      child: new ListView.builder(
        itemBuilder: (_,int index) => cells[index],
        itemCount: cells.length,
      )
    );
  }
}

typedef void StateChanged(int i,DecState state);

enum DecState{
  DecNormal,    //探测器默认状态
  DecPeople,    //有人状态 （开启）
  DecNobody,    //无人状态 （关闭）
  DecLight,     //探测器状态(光感)
  Dectemperature, //温度
  DecHumidity,    //湿度
}

class DecCell extends StatefulWidget{

  DecCell(this.decName,this.decState,this.index,{this.stateChanged,this.openStr = '有人',this.closeStr = '没人'});
  //传感器名字
  final String decName;
  //第几行
  final int index;
  //传感器状态
  DecState decState;
  //回调
  final StateChanged stateChanged;

  final String openStr;
  final String closeStr;

  _DecCellState cell = new _DecCellState();
  @override
  _DecCellState createState() => cell;
}

class _DecCellState extends State<DecCell>{
  @override
  Widget build(BuildContext context){
    return new Container(
      color: const Color.fromRGBO(214, 214, 214, 1.0),
      padding: const EdgeInsets.only(bottom: 1.0),
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Expanded(
              flex: 4,
              child: new Padding(
                padding: const EdgeInsets.all(13.0),
                child: new Text(widget.decName,style: new TextStyle(fontSize: 16.0)),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: new GestureDetector(
                onTap: (){
                  widget.stateChanged(widget.index,DecState.DecPeople);
                  setState((){
                    widget.decState = DecState.DecPeople;
                  });
                },
                child: new Row(
                  children: <Widget>[
                    new Text(widget.openStr,style: new TextStyle(fontSize: 16.0)),
                    new Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: new SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: new Image(image: new AssetImage(widget.decState == DecState.DecPeople?'images/btn_round2.png':'images/btn_round1.png')),
                      ),
                    )
                  ],
                ),
              ),
            ),
            widget.closeStr==''?new Container():new Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: new GestureDetector(
                onTap: (){
                  widget.stateChanged(widget.index,DecState.DecNobody);
                  setState((){
                    widget.decState = DecState.DecNobody;
                  });
                },
                child: new Row(
                  children: <Widget>[
                    new Text(widget.closeStr,style: new TextStyle(fontSize: 16.0)),
                    new Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: new SizedBox(
                        width: 22.0,
                        height: 22.0,
                        child: new Image(image: new AssetImage(widget.decState == DecState.DecNobody?'images/btn_round2.png':'images/btn_round1.png')),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class InductionCell extends StatefulWidget{
  
  InductionCell(
      this.decName,
      this.i,
      this.tmpList,
      this.conditions,
      this.conditionsValue,
      this.states,
      this.exprInfos,
      this.deviceId
      );
  
  final String decName;
  final int i;
  final List<SubDeviceInfoModel> tmpList;
  final List<String> conditions;
  final List<int>    conditionsValue;
  final List<DecState> states;
  List<ExprInfo> exprInfos;
  final String deviceId;

  
  @override
  _InductionCellState createState() => new _InductionCellState();
}

class _InductionCellState extends State<InductionCell>{

 String conditionFormula = '==';
 TextEditingController conditionNumController;

  @override
  Widget build(BuildContext context){

    void change(DecState state, int index){
      widget.states[index] = state;
      widget.exprInfos = <ExprInfo>[];

      for (var j=0; j<widget.states.length; j++){
        DecState exState = widget.states[j];
        if(exState != DecState.DecNormal){

          if (exState == DecState.DecPeople || exState == DecState.DecNobody){
            ExprInfo info     = new ExprInfo();
            info.deviceId     = widget.deviceId;
            info.subDeviceId  = widget.tmpList[j].subDeviceId;
            info.class_2      = 1;
            info.itemType     = 1;
            info.itemIndex    = 2;
            info.expr         = '==';
            info.value        = exState==DecState.DecPeople?1:0;
            widget.exprInfos.add(info);
          }else{

            ExprInfo info     = new ExprInfo();
            if (exState == DecState.DecLight){        //光感
              info.deviceId     = widget.deviceId;
              info.subDeviceId  = widget.tmpList[j].subDeviceId;
              info.class_2      = 1;
              info.itemType     = 1;
              info.itemIndex    = 3;
              info.expr         = widget.conditions[j];
              info.value        = widget.conditionsValue[j];
              widget.exprInfos.add(info);
            }else if (exState == DecState.Dectemperature){  //温度
              info.deviceId     = widget.deviceId;
              info.subDeviceId  = widget.tmpList[j].subDeviceId;
              info.class_2      = 1;
              info.itemType     = 1;
              info.itemIndex    = 3;
              info.expr         = widget.conditions[j];
              info.value        = widget.conditionsValue[j]*10;
              widget.exprInfos.add(info);
            }else if (exState == DecState.DecHumidity){   //湿度
              info.deviceId     = widget.deviceId;
              info.subDeviceId  = widget.tmpList[j].subDeviceId;
              info.class_2      = 1;
              info.itemType     = 1;
              info.itemIndex    = 4;
              info.expr         = widget.conditions[j];
              info.value        = widget.conditionsValue[j]*100;
              widget.exprInfos.add(info);
            }
          }

        }
      }
    }


    return new Container(
        color: const Color.fromRGBO(214, 214, 214, 1.0),
        padding: const EdgeInsets.only(bottom: 1.0),
        child: new Container(
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: new Text(widget.decName,style: new TextStyle(fontSize: 16.0)),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(13.0),
                  child: new PopupMenuButton<String>(itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    new PopupMenuItem(child: new Text('>'),  value: '>',),
                    new PopupMenuItem(child: new Text('>='), value: '>=',),
                    new PopupMenuItem(child: new Text('=='), value: '==',),
                    new PopupMenuItem(child: new Text('<='), value: '<=',),
                    new PopupMenuItem(child: new Text('<'),  value: '<',),
                  ],
                  onSelected: (String onValue){
                    conditionFormula = onValue;
                    widget.conditions[widget.i] = conditionFormula;

                    if (widget.decName == '光感'){
                      change(DecState.DecLight, widget.i);
                    }else if (widget.decName == '温度'){
                      change(DecState.Dectemperature, widget.i);
                    }else if (widget.decName == '湿度'){
                      change(DecState.DecHumidity, widget.i);
                    }

                    setState((){});
                  },
                  child: new Text(conditionFormula, style: new TextStyle(fontSize: 18.0),),),
                ),
                new Container(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: new SizedBox(
                      width: 100.0,
                      height: 40.0,
                      child: new Center(
                        child: new TextField(
                          controller: conditionNumController,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration.collapsed(hintText: '条件值0-100'),
                          onChanged: (String value){
                            if (value.length > 3){
                              conditionNumController.text = value;
                              widget.conditions[widget.i] = conditionFormula;
                              widget.conditionsValue[widget.i] = int.parse(value);

                              if (widget.decName == '光感'){
                                change(DecState.DecLight, widget.i);
                              }else if (widget.decName == '温度'){
                                change(DecState.Dectemperature, widget.i);
                              }else if (widget.decName == '湿度'){
                                change(DecState.DecHumidity, widget.i);
                              }
                            }
                          },
                        ),
                      ),
                    ),
                )
              ],
            )
        )
    );
  }
}
