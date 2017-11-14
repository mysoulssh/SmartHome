import 'package:flutter/material.dart';
import 'cells/me_member_cell.dart';
import 'me_member_info_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';

class MeMemberScene extends StatefulWidget{
  @override
  _MeMemberSceneState createState() => new _MeMemberSceneState();
}

class _MeMemberSceneState extends State<MeMemberScene>{

  List<MeMemberCell> cells = <MeMemberCell>[];

  List<String> testList = <String>['来去之间','白果','草莓', 'Jack', 'Chen'];
  List<String> testReList = <String>['姐姐','哥哥','弟弟', '姐姐', '妹妹'];

  List<MeMemberState> states = <MeMemberState>[
    MeMemberState.meMemberStateNormal,
    MeMemberState.meMemberStateNormal,
    MeMemberState.meMemberStateNormal,
    MeMemberState.meMemberStateWaiting,
    MeMemberState.meMemberStateRefuse,
  ];

  @override
  void initState(){
    super.initState();
    for (int i=0; i<testList.length; i++){
      var likeName = testList[i];
      var relation = testReList[i];
      cells.add(new MeMemberCell(likeName: likeName, relation: relation, hasWatch: true, memberState: states[i],callback: (){
        MeMemberInfoScene infoScene = new MeMemberInfoScene(likeName: likeName,realName: likeName,);
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new NavigationBar(infoScene, '个人信息'))
        );
      },));
    }
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