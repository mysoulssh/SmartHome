import 'package:flutter/material.dart';
import 'cells/me_member_cell.dart';
import 'me_member_info_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/UserFRSList/UserFRSList.pb.dart';
import 'package:watchapp_flutter/grpc_src/dart_out/RelationList/RelationList.pb.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'models/user_info_model.dart';
import 'package:watchapp_flutter/Tools/type_judgment.dart';

class MeMemberScene extends StatefulWidget{

  MeMemberScene(this.relationList);

  List<RelationInfo> relationList;

  @override
  _MeMemberSceneState createState() => new _MeMemberSceneState();
}

class _MeMemberSceneState extends State<MeMemberScene>{

  List<MeMemberCell> cells = <MeMemberCell>[];

  @override
  void initState(){
    super.initState();

    getMenberList();
  }

  void getMenberList(){
    cells.removeRange(0, cells.length);
    httpManage.userFRSList(UserAccessModel.accessModel.accessToken, (Map map){
      List<FRSInfo> infoList = map['models'];
      if (infoList.length > 0){
        List<String> userName = <String>[];
        for (var v in infoList){
          userName.add(v.userName);
        }
        httpManage.getUserInfo(UserAccessModel.accessModel.accessToken, userName, (Map map){
          List<UserInfoModel> models = map['models'];

          for (var i=0; i<models.length; i++){
            FRSInfo frsInfo = infoList[i];
            UserInfoModel userInfoModel = models[i];

            MeMemberState memberState;
            if (frsInfo.isConfirm == 2){
              memberState = MeMemberState.meMemberStateNormal;
            }else if (frsInfo.userId == UserAccessModel.accessModel.userId){    //如果等于自己
              memberState = frsInfo.isConfirm == 3?MeMemberState.meMemberStateRefuse:MeMemberState.meMemberStateWaiting;
            }else{
              memberState = frsInfo.isConfirm == 3?MeMemberState.meMemberStateRefuse:MeMemberState.meMemberStateWaitingConfirm;
            }

            cells.add(new MeMemberCell(
              likeName: userInfoModel.like_name,
              relation: TypeJudgment.judgmentRelation(frsInfo.relationCode),
              hasWatch: false,
              memberState: memberState,
              callback: (tmpState){
                int type;
                if (tmpState == MeMemberState.meMemberStateNormal){
                  type = 1;
                }else if (tmpState == MeMemberState.meMemberStateWaiting){
                  type = 2;
                }else if (tmpState == MeMemberState.meMemberStateWaitingConfirm){
                  type = 3;
                }else if (tmpState == MeMemberState.meMemberStateRefuse){
                  type = 4;
                }

                MeMemberInfoScene infoScene = new MeMemberInfoScene(userInfoModel: userInfoModel, frsInfo: frsInfo, statusType: type,);
                Navigator.of(context).push(new MaterialPageRoute<bool>(
                    builder: (BuildContext context) => new NavigationBar(infoScene, '个人信息'))
                ).then((onValue){
                  if(onValue == true){
                    getMenberList();
                  }
                });
              },
            ));
          }

          setState((){});

        }, (String errorMsg){

        });
      }

      print('FRSInfoList = $infoList');
    }, (String errorMsg){

    });
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