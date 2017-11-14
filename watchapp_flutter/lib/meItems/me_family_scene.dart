import 'package:flutter/material.dart';
import 'cells/me_family_cell.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'me_family_info_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'me_add_family_scene.dart';

class MeFamilyScene extends StatefulWidget{
  @override
  _MeFamilySceneState createState() => new _MeFamilySceneState();
}

class _MeFamilySceneState extends State<MeFamilyScene>{

  List<Widget> cells = <Widget>[];
  List<String> familyNames = <String>['我的家庭1','我的家庭2','我的家庭3','我的家庭4',];


  @override
  void initState(){
    super.initState();
    int i = 0;
    for (String name in familyNames){
      cells.add(new MeFamilyCell(index: i,text: name,callback: (int index){
        print('$index');
        MeFamilyInfoScene infoScene = new MeFamilyInfoScene();
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new NavigationBar(infoScene, familyNames[index])
        ));
      },));
      i++;
    }

    cells.add(new Container(
      padding: const EdgeInsets.only(top: 80.0),
      child: new ActionBtn(text: '添加家庭',callback: (){
        MeAddFamilyScene addFamilyScene = new MeAddFamilyScene();
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new NavigationBar(addFamilyScene, '添加家庭')
        ));
      },),
    ));
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
