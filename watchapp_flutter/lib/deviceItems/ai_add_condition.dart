import 'package:flutter/material.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'ai_condition_info.dart';

import 'package:watchapp_flutter/Tools/right_btn.dart';

typedef void CellsSelectCallback(int i);
typedef void SaveCallback(ConditonType type, List<String> conditionTextList, List<DecState> conditionStates);


class AiAddCondition extends StatefulWidget{

  AiAddCondition({this.callback,this.decList});

  List<String> decList;

  final SaveCallback callback;

  @override
  _AiAddConditionState createState() => new _AiAddConditionState();
}

class _AiAddConditionState extends State<AiAddCondition>{

  List<Widget> cells = <Widget>[];
  List<String> imageNames = <String>['images/testIcon.jpg','images/testIcon.jpg','images/testIcon.jpg'];
  List<String> texts = <String>['传感器','时间'];

  @override
  void initState(){
    super.initState();
    for (int i = 0; i<2; i++){
      cells.add(this.createList(imageNames[i], texts[i], i,(int i){
        print('$i');

        if (i == 0){
          AiConditionInfo info = new AiConditionInfo(ConditonType.ConditionDec);
          info.setConditionText(widget.decList);
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(info, texts[i],
                actions: <Widget>[
                  new RightBtnItem('保存', (){
                    print('保存条件');
                    if (info.conditonType == ConditonType.ConditionDec){
                      if (widget.callback != null){
                        widget.callback(info.conditonType, info.infoState.conditionText, info.infoState.states);
                      }
                    }
                    Navigator.of(context).pop();
                  })
                ],
              )
          ));
        }else{
          showTimePicker(context: context, initialTime: new TimeOfDay.fromDateTime(new DateTime.now())).then((TimeOfDay value){

          });
        }
      }));
    }
  }

  Widget createList(String imageName,String text,int index,CellsSelectCallback callback){
    return new GestureDetector(
      onTap: (){
        callback(index);
      },
      child: new Container(
        padding: const EdgeInsets.only(bottom: 1.0),
        color: new Color.fromRGBO(214, 214, 214, 1.0),
        child: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new SizedBox(
                  width: 45.0,
                  height: 45.0,
                  child: new Image(image: new AssetImage(imageName)),
                ),
              ),
              new Expanded(child: new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Text(text,style: const TextStyle(fontSize: 16.0),),
              ),),
              new Padding(padding: const EdgeInsets.all(8.0),
                child: new SizedBox(
                  width: 18.0,
                  height: 18.0,
                  child: new Image(image: const AssetImage('images/btn_next2_n.png')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new ListView(
        children: cells,
      ),
    );
  }
}