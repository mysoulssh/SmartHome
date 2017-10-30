import 'package:flutter/material.dart';
import 'cells/ai_action_cell.dart';

enum ConditonType{
  ConditionDec,     //传感器
  ConditionTime,    //时间
}

class AiConditionInfo extends StatefulWidget{

  AiConditionInfo(this.conditonType);

  final ConditonType conditonType;

  void setConditionText(List<String> list){
    infoState.conditionText = list;
    infoState.reloadList();
  }

  _AiConditionInfoState infoState = new _AiConditionInfoState();

  @override
  _AiConditionInfoState createState() => infoState;
}

class _AiConditionInfoState extends State<AiConditionInfo>{

  List<String> conditionText = <String>[];
  List<Widget> cells = <Widget>[];
  List<DecState> states = <DecState>[];


  void reloadList(){
    states = <DecState>[];
    cells = <Widget>[];

    int i = 0;
    for (String tmp in conditionText){
      states.add(DecState.DecNormal);
      cells.add(new DecCell(tmp,DecState.DecNormal,i,stateChanged: (int index,DecState state){
        states[index] = state;
      },));
      i++;
    }
  }

  @override
  void initState(){
    super.initState();

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
  DecPeople,    //有人状态
  DecNobody,    //无人状态
}

class DecCell extends StatefulWidget{

  DecCell(this.decName,this.decState,this.index,{this.stateChanged});
  //传感器名字
  final String decName;
  //第几行
  final int index;
  //传感器状态
  DecState decState;
  //回调
  final StateChanged stateChanged;

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
                    new Text('有人',style: new TextStyle(fontSize: 16.0)),
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
            new Padding(
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
                    new Text('无人',style: new TextStyle(fontSize: 16.0)),
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
