import 'package:flutter/material.dart';
import 'ai_add_condition.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'ai_condition_info.dart';
import 'device_add_action.dart';
import 'device_add_centercontrol.dart';
import 'cells/action_scene_cell_model.dart';
import 'ai_add_rule_cell.dart';

class AiAddRule extends StatefulWidget{

  AiAddRule({this.isEditRule,this.ruleName});

  bool isEditRule;
  String ruleName;

  final _AiAddRuleState ruleState = new _AiAddRuleState();
  @override
  _AiAddRuleState createState() => ruleState;
}

class _AiAddRuleState extends State<AiAddRule>{

  final TextEditingController _controller = new TextEditingController();
  final List<AiConditionModel> modelList = <AiConditionModel>[];
  final List<Widget> conditionList = <Widget>[];
  final List<ConditonType> conditionListType = <ConditonType>[];

  final List<String> decNameList = <String>[];

  List<String> _conditionText = <String>['传感器1', '传感器2', '传感器3', '传感器4'];

  final List<AiAddRuleCell> ruleActionCell = <AiAddRuleCell>[];

  int insetIndex;

  @override
  void initState(){
    super.initState();
    if (widget.isEditRule){
      _controller.text = widget.ruleName;
      ruleActionCell.add(new AiAddRuleCell(text1: '场景模式',text2: '回家-开启',text3: '一直开启',deviceRuleType: DeviceRuleType.DeviceRuleTypeScene,));
      ruleActionCell.add(new AiAddRuleCell(text1: '节能灯（卧室）',text2: '50%-开启',text3: '持续30\'40\'\'',deviceRuleType: DeviceRuleType.DeviceRuleTypeLight,));
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
    conditionList.add(new GestureDetector(
      onTap: (){
        print('添加条件');
        AiAddCondition addCondition = new AiAddCondition(decList: _conditionText,callback: (ConditonType type, List<String> conditionTextList, List<DecState> conditionStates){
          print('\ntype = $type  \nconditionTextList = $conditionTextList \nconditionSelectList = $conditionStates');
          if (type == ConditonType.ConditionDec){         //传感器
            List<String> tmpList = <String>[];
            for (int i=0;i<conditionStates.length;i++){
              DecState state = conditionStates[i];
              if (state != DecState.DecNormal){
                tmpList.add(conditionTextList[i]);
                decNameList.insert(insetIndex-2, conditionTextList[i]);
                conditionList.insert(insetIndex, createDecCondition(conditionTextList[i], state==DecState.DecPeople?true:false));
                insetIndex++;
                setState((){});
              }
            }

            for (String tmp in tmpList){
              conditionTextList.remove(tmp);
            }
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

  Widget createDecCondition(String decName, bool isTurnOn){
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
              child: new Text(isTurnOn?'有人':'无人',style: const TextStyle(fontSize: 16.0)),
            )
          ],
        ),
      ),
    );
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
              DeviceAddAction actionScene = new DeviceAddAction(isRule: true,callback: (ActionSceneCellModel model){

              },);
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context){
                    return new NavigationBar(actionScene, '添加动作');
                  }
              ));
            }else{                        //添加规则
              DeviceCenterControl centerScene = new DeviceCenterControl(isRule: true,callback: (ActionSceneCellModel model){
                setState((){
                  ruleActionCell.add(new AiAddRuleCell(text1: '场景模式',text2: '回家-开启',text3: '一直开启',deviceRuleType: DeviceRuleType.DeviceRuleTypeScene,));
                  if (ruleActionCell.length == 1){
                    conditionList.removeLast();
                  }
                  for (AiAddRuleCell cell in ruleActionCell){
                    conditionList.add(cell);
                  }
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