import 'package:flutter/material.dart';
import 'cells/me_family_cell.dart';
import 'package:watchapp_flutter/Tools/action_btn.dart';
import 'me_family_info_scene.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'me_add_family_scene.dart';
import 'models/house_info_model.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';

class MeFamilyScene extends StatefulWidget{

  MeFamilyScene();

  @override
  _MeFamilySceneState createState() => new _MeFamilySceneState();
}

class _MeFamilySceneState extends State<MeFamilyScene>{

  List<Widget> cells = <Widget>[];


  @override
  void initState(){
    super.initState();

    reloadList();

  }

  void reloadList(){

    cells.removeRange(0, cells.length);

    List<HouseInfoModel> familyInfos = <HouseInfoModel>[];
    //获取家庭列表
    httpManage.houseList(UserAccessModel.accessModel.accessToken, '', (Map map){
      var houses = map['houses'];
      familyInfos = houses;
      initList(familyInfos);
      setState((){});
    }, (String errorMsg){

    });
  }

  void initList(List<HouseInfoModel> familyInfos){
    int i = 0;
    for (HouseInfoModel model in familyInfos){

      var view = new MeFamilyCell(index: i,text: model.houseName,callback: (int index){
        print('$index');

        MeFamilyInfoScene infoScene = new MeFamilyInfoScene(model,i);

        Navigator.of(context).push(new MaterialPageRoute<Object>(
            builder: (BuildContext context) => new NavigationBar(infoScene, model.houseName)
        )).then((onValue){
          if(onValue == null)return;
          reloadList();
        });

      },);

      cells.add(view);
      i++;
    }

    cells.add(new Container(
      padding: const EdgeInsets.only(top: 80.0),
      child: new ActionBtn(text: '添加家庭',callback: (){
        MeAddFamilyScene addFamilyScene = new MeAddFamilyScene();
        Navigator.of(context).push(new MaterialPageRoute<Map>(
            builder: (BuildContext context) => new NavigationBar(addFamilyScene, '添加家庭')
        )).then((onValue){
          if(onValue == null) return;

          var model = onValue['houseInfoModel'];
          var view = new MeFamilyCell(index: i,text: model.houseName,callback: (int index){
            print('$index');
            MeFamilyInfoScene infoScene = new MeFamilyInfoScene(model,i);

            Navigator.of(context).push(new MaterialPageRoute<int>(
                builder: (BuildContext context) => new NavigationBar(infoScene, model.houseName)
            )).then((onValue){
              if(onValue == null)return;
              reloadList();
            });

          },);

          cells.insert(cells.length-1,view);

          setState((){});
        });
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
