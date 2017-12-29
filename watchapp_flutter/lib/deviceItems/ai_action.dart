import 'package:flutter/material.dart';
import 'cells/ai_action_cell.dart';
import 'ai_add_rule.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';



class AiAction extends StatefulWidget{

  AiAction({this.houseGuid});

  String houseGuid;

  @override
  _AiActionState createState() => new _AiActionState();
}

class _AiActionState extends State<AiAction>{

  List<AiActionCell> cell = <AiActionCell>[];

  @override
  void initState(){
    super.initState();

    loadAiActionList(widget.houseGuid);
  }


  void loadAiActionList(String houseGuid){
    if (houseGuid == null) return;
    httpManage.eventRuleList(UserAccessModel.accessModel.accessToken, 1, 20, houseGuid, (Map map){
      List<RuleInfo> rules = map['models'];
      print('$rules');

      for (var v in rules){
        cell.add(new AiActionCell(v.etName, v.enable==1?true:false,selectCellCallback: (){
          print('编辑规则');
          AiAddRule addRule = new AiAddRule(isEditRule: true,ruleName: v.etName, ruleInfo: v,);
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(addRule, '编辑规则',
                actions: <Widget>[
                  new GestureDetector(      //智能联动界面添加规则按钮
                    onTap: (){
                      print('添加规则保存');
                      Navigator.of(context).pop();
                    },
                    child: new Container(
                        padding: const EdgeInsets.all(8.0),
                        child: new Center(
                          child: new Text('保存',style: new TextStyle(color: Colors.black,fontSize: 15.0),
                          ),
                        )
                    ),
                  )
                ],))
          );
        }, switchClickCallback: (int index,bool isTurnOn){
          v.enable = isTurnOn?1:2;
          httpManage.eventRuleSet(UserAccessModel.accessModel.accessToken, v.etId, 1, v.enable, (Map map){

          }, (String errorMsg){
            print('设置规则开关错误信息:$errorMsg');
          });
        },
          deleteCallback: (onValue){
            cell.remove(onValue);
            httpManage.eventRuleDel(UserAccessModel.accessModel.accessToken, v.etId, (Map map){

            }, (String errorMsg){

            });
          },
        ));
      }

      setState((){});
    }, (String errorMsg){

    });
  }


  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(child: new Container(
                color: const Color.fromRGBO(181, 180, 185, 1.0),
                padding: const EdgeInsets.only(bottom: 1.0),
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: new Text(
                    '根据用户设定的联动规则，自动触发场景模式或设备控制',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ))
            ],
          ),
          new Expanded(child: new Container(
            child: new ListView.builder(
              itemBuilder: (_,int index) => cell[index],
              itemCount: cell.length,
            ),
          )),
        ],
      ),
    );
  }
}


