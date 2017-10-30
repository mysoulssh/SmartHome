import 'package:flutter/material.dart';
import 'cells/ai_action_cell.dart';
import 'ai_add_rule.dart';
import 'package:watchapp_flutter/main_navbar.dart';


class AiAction extends StatefulWidget{
  @override
  _AiActionState createState() => new _AiActionState();
}

class _AiActionState extends State<AiAction>{

  List<AiActionCell> cell = <AiActionCell>[];

  List<String> aiName = <String>['回家','离家','起床','睡觉'];
  List<bool> switchList = <bool>[true,false,false,false];

  @override
  void initState(){
    super.initState();
    int i = 0;
    for(String tmp in aiName){
      cell.add(new AiActionCell(tmp, switchList[i],selectCellCallback: (int index){
        print('编辑规则');
        AiAddRule addRule = new AiAddRule(isEditRule: true,ruleName: tmp,);
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new NavigationBar(addRule, '添加规则',
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
      },));
      i++;
    }
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


