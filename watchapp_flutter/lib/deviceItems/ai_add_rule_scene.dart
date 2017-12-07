import 'package:flutter/material.dart';
import 'cells/ai_action_cell.dart';

class AiAddRuleScene extends StatefulWidget{

  _AiAddRuleSceneState ruleScene = new _AiAddRuleSceneState();
  @override
  _AiAddRuleSceneState createState() => ruleScene;
}

class _AiAddRuleSceneState extends State<AiAddRuleScene>{

  List<AiActionCell> cell = <AiActionCell>[];
  List<String> sceneList = <String>['回家', '离家', '起床', '睡觉'];
  List<bool> switchList = <bool>[true,false,false,false];

  @override
  void initState(){
    super.initState();
    int i = 0;
    for (String tmp in sceneList){
      cell.add(new AiActionCell(tmp, switchList[i], index: i, switchClickCallback: (int index,bool isTurnOn){
        for (int j=0;j<cell.length;j++){
          AiActionCell tmpCell = cell[j];
          tmpCell.isTurnOn = false;
          tmpCell.reloadList();
          switchList[j] = false;
        }
        switchList[index] = isTurnOn;

      },));
      i ++;
    }
  }


  @override
  Widget build(BuildContext context){
    return new Container(
      child: new ListView.builder(
        itemBuilder: (_,int index) => cell[index],
        itemCount: cell.length,
      ),
    );
  }
}