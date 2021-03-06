import 'package:flutter/material.dart';
import 'cells/me_family_info_cell.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'me_family_member_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'me_family_room_scene.dart';
import 'package:watchapp_flutter/Tools/scan_qr_code.dart';
import 'models/house_info_model.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'models/area_info_model.dart';


class MeFamilyInfoScene extends StatefulWidget{

  MeFamilyInfoScene(this.infoModel,this.object);

  HouseInfoModel infoModel;
  Object object;

  @override
  _MeFamilyInfoSceneState createState() => new _MeFamilyInfoSceneState();
}

class _MeFamilyInfoSceneState extends State<MeFamilyInfoScene>{

  List<Widget> cells = <Widget>[];

  List<String> familyNames = <String>['家庭名称', '家庭成员', '家庭房间', '家庭地址', '二维码'];
  List<String> infos = <String>[];

  List<AreaInfoModel> infoModels;

  final TextEditingController familyNameController = new TextEditingController();

  @override
  void initState(){
    super.initState();

    httpManage.houseAreaList(UserAccessModel.accessModel.accessToken, widget.infoModel.houseGuid, (Map map){
      infoModels = map['areas'];

      infos.add(widget.infoModel.houseName);
      infos.add(widget.infoModel.role.toString());
      infos.add(infoModels.length.toString());
      infos.add(widget.infoModel.addrName);
      infos.add('');

      initList();

      setState((){});
    }, (String errorMsg){
      infos.add('');
      infos.add('');
      infos.add('');
      infos.add('');
      infos.add('');

      initList();
      setState((){});
    });

  }

  void initList(){
    int i=0;
    for (String tmp in familyNames){
      cells.add(new MeFamilyInfoCell(familyName: tmp,familyInfo: infos[i],index: i,callback: (int index){
        if(index == 0){               //修改家庭名称
          showDialog(context: context, child: new AlertDialog(
            title: new Text('家庭名称',textAlign: TextAlign.center,),
            content: new TextField(
              controller: familyNameController,
              decoration: new InputDecoration.collapsed(hintText: '请输入家庭名称'),
            ),
            actions: <Widget>[
              new FlatButton(onPressed: (){

                infos[index] = familyNameController.text;
                MeFamilyInfoCell tmpCell = cells[index];
                tmpCell.familyInfo = familyNameController.text;
                tmpCell.cellState.reload();
                Navigator.of(context).pop();

              }, child: new Text('确定')),
              new FlatButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: new Text('取消',style: new TextStyle(color: Colors.red),)),
            ],
          ));
        }else if(index == 1){         //家庭成员
          MeFamilyMemberScene memberScene = new MeFamilyMemberScene(true);
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new NavigationBar(memberScene, '家庭成员',
            actions: <Widget>[
              new GestureDetector(
                onTap: (){
                  setState((){
                    ScanQRCode.showQRCodeReader((String value){
                      showDialog(context: context, child: new AlertDialog(
                        title: new Text('扫描结果', textAlign: TextAlign.center),
                        content: new Text(value, textAlign: TextAlign.center),
                        actions: <Widget>[
                          new FlatButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: new Text('确定'))
                        ],
                      ));
                    });
                  });
                },
                child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: new Image(image: const AssetImage('images/icon_addfamliy.png')),
                  ),
                ),
              )
            ],
          )));
        }else if(index == 2){         //家庭房间
          MeFamilyRoomScene roomScene = new MeFamilyRoomScene(infoModels,widget.infoModel.houseGuid,addRoomCallback: (AreaInfoModel areaInfoModel){
            infoModels.insert(0, areaInfoModel);
          },);
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new NavigationBar(roomScene, '家庭房间')));
        }else{
          showDialog(context: context, child: new AlertDialog(
            title: new Text('提示',textAlign: TextAlign.center,),
            content: new Text('暂未开放',textAlign: TextAlign.center,),
          ));
        }
      },));
      i++;
    }
    cells.add(createActionBtn());
  }

  Widget createActionBtn(){
    return new Container(
      padding: const EdgeInsets.only(top: 80.0),
      child: new ActionBtn(text: '解散家庭',callback: (){
        httpManage.houseDel(UserAccessModel.accessModel.accessToken, widget.infoModel.houseGuid, (Map map){
          var houseGuid = map['houseGuid'];
          print('$houseGuid');
          Navigator.of(context).pop(widget.object);

        }, (String errorMsg){

        });
      },)
    );
  }

  @override
  Widget build(BuildContext context){
    return  new Container(
      child: new ListView.builder(
        itemBuilder: (_,int index) => cells[index],
        itemCount: cells.length,
      ),
    );
  }
}
