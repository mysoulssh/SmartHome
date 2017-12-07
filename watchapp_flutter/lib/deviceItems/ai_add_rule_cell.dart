import 'package:flutter/material.dart';
import 'package:watchapp_flutter/deviceItems/models/subdevice_info_model.dart';
import 'package:watchapp_flutter/deviceItems/models/status_info_model.dart';

enum DeviceRuleType{
  DeviceRuleTypeScene,    //场景模式规则
  DeviceRuleTypeLight,    //灯规则
  DeviceRuleTypeSwitch,   //开关规则
  DeviceRuleTypeCommon,   //大众规则
}

typedef CellControlCallback();
typedef CellTimeCallback();


class AiAddRuleCell extends StatefulWidget{

  AiAddRuleCell({
    this.text1,
    this.text2,
    this.text3,
    this.deviceRuleType,
    this.subDeviceInfoModel,
    this.statusInfoModel,
    this.controlCallback,
    this.timeCallback
  });

  final DeviceRuleType deviceRuleType;

  String text1;
  String text2;
  String text3;

  SubDeviceInfoModel subDeviceInfoModel;
  StatusInfoModel statusInfoModel;
  CellControlCallback controlCallback;
  CellTimeCallback    timeCallback;

  _AiAddRuleCellState cellState = new  _AiAddRuleCellState();

  @override
  _AiAddRuleCellState createState() => cellState;
}

class _AiAddRuleCellState extends State<AiAddRuleCell>{

  void reload(){
    setState((){});
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.white,
      child: new Container(
        child: new Stack(
          children: <Widget>[
            new Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 15.0),
              child: new Container(
                color: const Color.fromRGBO(214, 214, 214, 1.0),
                padding: const EdgeInsets.only(left: 1.0),
                child: new Container(
                  color: Colors.white,
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Expanded(child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                                child: new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
                                      child: new Text(widget.text1,style: new TextStyle(fontSize: 16.5),),
                                    ),
                                  ],
                                )
                            ),
                            new Container(
                              child: new Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                                    child: new SizedBox(
                                      width: 95.0,
                                      height: 26.0,
                                      child: new Container(
                                        padding: const EdgeInsets.all(1.0),
                                        decoration: new BoxDecoration(
                                          color: const Color.fromRGBO(249, 189, 165, 1.0),
                                          borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                                        ),
                                        child: new Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                                          ),
                                          child: new FlatButton(onPressed: (){
                                            if (widget.controlCallback != null){
                                              widget.controlCallback();
                                            }
                                          },child: new Text(widget.text2,style: const TextStyle(color: const Color.fromRGBO(249, 189, 165, 1.0)),),
                                          ),),
                                      ),
                                    ),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 10.0),
                                    child: new SizedBox(
                                      width: 105.0,
                                      height: 26.0,
                                      child: new Container(
                                        padding: const EdgeInsets.all(1.0),
                                        decoration: new BoxDecoration(
                                          color: const Color.fromRGBO(249, 189, 165, 1.0),
                                          borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                                        ),
                                        child: new Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                                          ),
                                          child: new FlatButton(onPressed: (){
                                            if (widget.timeCallback != null){
                                              widget.timeCallback();
                                            }
                                          },child: new Text(widget.text3, style: const TextStyle(color: const Color.fromRGBO(249, 189, 165, 1.0), fontSize: 12.0),),
                                          ),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),flex: 5,),
                      new Expanded(child: new Container(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        color: const Color.fromRGBO(214, 214, 214, 1.0),
                        child: new Container(
                          color: Colors.white,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(11.5, 13.0, 0.0, 0.0),
              child: new SizedBox(
                width: 8.0,
                height: 8.0,
                child: new Container(
                  decoration: new BoxDecoration(
                    color: const Color.fromRGBO(116, 118, 131, 1.0),
                    borderRadius: const BorderRadius.all(const Radius.circular(5.0))
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}