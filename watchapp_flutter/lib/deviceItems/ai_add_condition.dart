import 'package:flutter/material.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'ai_condition_info.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/right_btn.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/deviceItems/models/device_info_model.dart';
import 'package:watchapp_flutter/deviceItems/models/device_detail_info_model.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/iot_comm/iot_comm.pb.dart';
import 'package:watchapp_flutter/Tools/show_infos_tool.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';

typedef void CellsSelectCallback(int i);
typedef void SaveCallback(ConditonType type, List<String> conditionTextList, List<DecState> conditionStates, List<ExprInfo> exprInfos);


class AiAddCondition extends StatefulWidget{

  AiAddCondition({this.existExps,this.callback});

  final SaveCallback callback;
  final List<ExprInfo> existExps;

  @override
  _AiAddConditionState createState() => new _AiAddConditionState();
}

class _AiAddConditionState extends State<AiAddCondition>{

  List<Widget> cells = <Widget>[];

  @override
  void initState(){
    super.initState();

    loadConditonList();
  }

  void loadConditonList(){
    httpManage.userDeviceList(UserAccessModel.accessModel.accessToken, 1, 20, (Map map){
      List<DeviceInfoModel> models = map['models'];
      List<String> deviceIds = <String>[];
      if (models.length > 0){
        for (var v in models){
          deviceIds.add(v.deviceId);
        }
        httpManage.deviceInfoGet(deviceIds, UserAccessModel.accessModel.accessToken, (Map map){
          List<DeviceDetailInfoModel> detailInfoModels = map['models'];
          for (int i=0; i<detailInfoModels.length; i++){

            DeviceInfoModel deviceInfoModel             = models[i];
            DeviceDetailInfoModel deviceDetailInfoModel = detailInfoModels[i];

            if (deviceInfoModel.deviceId.substring(3,4) != 'C'){
              cells.add(createList(TypeJudgment.judgmentDeviceImage(deviceDetailInfoModel.prodtCode.first), deviceInfoModel.deviceName, 1, (int index){
                String id = deviceDetailInfoModel.deviceId;
                String type = deviceDetailInfoModel.prodtCode.first;
                print('id = $id \ntype = $type');

                AiConditionInfo info = new AiConditionInfo(ConditonType.ConditionDec,deviceId: id, existExps: widget.existExps,);
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new NavigationBar(info, deviceInfoModel.deviceName,
                      actions: <Widget>[
                        new RightBtnItem('保存', (){
                          if (info.conditonType == ConditonType.ConditionDec){
                            if (widget.callback != null){
                              widget.callback(info.conditonType, info.infoState.conditionText, info.infoState.states, info.infoState.exprInfos);
                            }
                          }
                          Navigator.of(context).pop();
                        })
                      ],
                    )
                ));

              }));
            }
          }

          cells.add(createList('images/img_clock.png', '时间', -1, (int index){
            print('$index 选择时间');

            TextEditingController startController = new TextEditingController();
            TextEditingController endController   = new TextEditingController();

            int startTime = 0;
            int endTime   = 0;

            showDialog(context: context, child: new AlertDialog(
              title: new Text('请选择时间',textAlign: TextAlign.center,),
              content: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      padding: const EdgeInsets.only(right: 3.0),
                    child: new SizedBox(
                      width: 100.0,
                      height: 90.0,
                      child: new Column(
                        children: <Widget>[
                          new FlatButton(onPressed: (){
                            showTimePicker(context: context, initialTime: new TimeOfDay.now()).then((onValue){
                              int hour   = onValue.hour;
                              int minute = onValue.minute;
                              print('hour = $hour minute = $minute');
                              if (minute < 10){
                                startController.text = '$hour:0$minute';
                              }else
                              startController.text = '$hour:$minute';
                              startTime = hour*3600 + minute*60;

                            });
                          }, child: new Text('开始时间', style: new TextStyle(color: Colors.blue),)),
                          new TextField(
                            controller: startController,
                            textAlign: TextAlign.center,
                            onChanged: (String value){
                              startController.text = '';
                            },
                          )
                        ],
                      )
                    )
                  ),
                  new Container(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: new SizedBox(
                        width: 100.0,
                        height: 90.0,
                        child: new Column(
                          children: <Widget>[
                            new FlatButton(onPressed: (){
                              showTimePicker(context: context, initialTime: new TimeOfDay.now()).then((onValue){
                                int hour   = onValue.hour;
                                int minute = onValue.minute;
                                print('hour = $hour minute = $minute');
                                if (minute < 10){
                                  endController.text = '$hour:0$minute';
                                }else
                                endController.text = '$hour:$minute';
                                endTime = hour*3600 + minute*60;
                              });
                            }, child: new Text('结束时间', style: new TextStyle(color: Colors.red),)),
                            new TextField(
                              controller: endController,
                              textAlign: TextAlign.center,
                              onChanged: (String value){
                                endController.text = '';
                              },
                            )
                          ],
                        )
                    )
                  )
                ],
              ),
              actions: <Widget>[
                new FlatButton(onPressed: (){
                  if (startTime > endTime){
                    ShowInfo.showInfo(context, content: '开始时间不能大于结束时间');
                    return;
                  }

                  ExprInfo exprInfo = new ExprInfo()
                  ..startTime = startTime
                  ..endTime   = endTime
                  ..class_2   = 2;

                  if (widget.callback != null){
                    widget.callback(ConditonType.ConditionTime, <String>['时间'], null, [exprInfo]);
                  }


                  Navigator.of(context).pop();
                }, child: new Text('确定')),
                new FlatButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: new Text('取消')),
              ],
            ));

          }));


          setState((){});
        }, (String errorMsg){

        });
      }
    }, (String errorMsg){

    });
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
      child: new ListView.builder(
        itemBuilder: (_,int index) => cells[index],
        itemCount: cells.length,
      ),
    );
  }
}