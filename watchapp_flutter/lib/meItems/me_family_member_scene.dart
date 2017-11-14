import 'package:flutter/material.dart';
import 'package:watchapp_flutter/main_navbar.dart';
import 'me_family_member_info_scene.dart';

typedef FamilyMemberSceneCallback(int index,FamilyMemeberInfoType type);

class MeFamilyMemberScene extends StatefulWidget{

  MeFamilyMemberScene(this.isManage);
  //是否是管理员
  final bool isManage;

  @override
  _MeFamilyMemberSceneState createState() => new _MeFamilyMemberSceneState();
}

class _MeFamilyMemberSceneState extends State<MeFamilyMemberScene>{

  List<Widget> cells = <Widget>[];
  List<Widget> applyCells = <Widget>[];

  List<String> likeNames = <String>['来去之间','白果','大侠','飞云'];
  List<String> relations = <String>['自己','哥哥','弟弟','姐姐'];

  List<MeFamilyMemberModel> memberModelList = <MeFamilyMemberModel>[];

  @override
  void initState(){
    super.initState();

    for(int i=0;i<4;i++){
      memberModelList.add(
        new MeFamilyMemberModel(
          likeName: likeNames[i],
          relation: relations[i],
          isManage: i==0?true:false,
          isApply: false
        ),
      );
    }

    for(int i=0;i<2;i++){
      memberModelList.add(
        new MeFamilyMemberModel(
          likeName: i==0?'火车':'大大',
          relation: i==0?'':'妹妹',
          isManage: false,
          isApply: true
        )
      );
    }

//    for (int i=0;i<likeNames.length;i++){
//      String tmp = likeNames[i];
//      cells.add(createCells(tmp, relations[i],i==0?true:false,i,(int index, FamilyMemeberInfoType type){
//        print('$index');
//        MeFamilyMemeberInfoScene memeberInfoScene = new MeFamilyMemeberInfoScene(
//          likeName: likeNames[index],
//          relation: relations[index],
//          isManage: true,
//          type: type,
//        );
//        Navigator.of(context).push(new MaterialPageRoute(
//            builder: (BuildContext context) => new NavigationBar(memeberInfoScene, likeNames[index])
//        ));
//      },i==0?FamilyMemeberInfoType.FamilyMemeberInfoTypeSelf:FamilyMemeberInfoType.FamilyMemeberInfoTypeInfo));
//      i++;
//    }

    int j=0;
    for(MeFamilyMemberModel model in memberModelList){
      if(model.isApply == true){      //申请列表
        applyCells.add(createApplyCells(model.likeName, model.relation, model.isManage, j, (int index,FamilyMemeberInfoType type){
          print('$index');
          MeFamilyMemeberInfoScene memeberInfoScene = new MeFamilyMemeberInfoScene(
            likeName: model.likeName,
            relation: model.relation,
            isManage: false,
            type: type,
          );
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(memeberInfoScene, model.likeName)
          ));
        },FamilyMemeberInfoType.FamilyMemeberInfoTypeInfo));
      }else{                          //家庭成员列表
        cells.add(createCells(model.likeName, model.relation, model.isManage, j, (int index,FamilyMemeberInfoType type){
          print('$index');
          MeFamilyMemeberInfoScene memeberInfoScene = new MeFamilyMemeberInfoScene(
            likeName: model.likeName,
            relation: model.relation,
            isManage: true,
            type: type,
          );
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new NavigationBar(memeberInfoScene, model.likeName)
          ));
        }, j==0?FamilyMemeberInfoType.FamilyMemeberInfoTypeSelf:FamilyMemeberInfoType.FamilyMemeberInfoTypeInfo));
      }
      j++;
    }

    cells.add(new Container(
      padding: const EdgeInsets.only(top: 1.0),
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Expanded(child: new Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: new Text('申请列表',textAlign: TextAlign.center,),
            ))
          ],
        ),
      ),
    ));

    for (var i = 0; i < applyCells.length; ++i) {
      var o = applyCells[i];
      cells.add(o);
    }

  }

  Widget createCells(String likeName,String relation,bool manage,int index,FamilyMemberSceneCallback callback,FamilyMemeberInfoType type){
    return new GestureDetector(
      onTap: (){
        callback(index,type);
      },
      child: new Container(
          padding: const EdgeInsets.only(top: 1.0),
          child: new Container(
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.all(8.0),
                  child: new SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: new CircleAvatar(
                      backgroundImage: new AssetImage('images/testIcon.jpg'),
                    ),
                  ),
                ),
                new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: new Text(likeName,style: new TextStyle(fontSize: 16.0),),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: new Text(relation,style: new TextStyle(fontSize: 14.0)),
                      )
                    ],
                  ),
                ),
                manage?new Expanded(child: new Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: new Text('管理员',textAlign: TextAlign.end,style: new TextStyle(fontSize: 16.0),),
                )):new Container()
              ],
            ),
          )
      ),
    );
  }

  Widget createApplyCells(String likeName,String relation,bool manage,int index,FamilyMemberSceneCallback callback,FamilyMemeberInfoType type){
    return new GestureDetector(
      onTap: (){
        callback(index,FamilyMemeberInfoType.FamilyMemeberInfoTypeInfo);
      },
      child: new Container(
          padding: const EdgeInsets.only(top: 1.0),
          child: new Container(
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.all(8.0),
                  child: new SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: new CircleAvatar(
                      backgroundImage: new AssetImage('images/testIcon.jpg'),
                    ),
                  ),
                ),
                new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: new Text(likeName,style: new TextStyle(fontSize: 16.0),),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: new Text(relation,style: new TextStyle(fontSize: 14.0)),
                      )
                    ],
                  ),
                ),
                new Expanded(child: new Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: new Text('申请加入家庭'),
                      ),
                      new Container(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Container(
                              width: 60.0,
                              height: 25.0,
                              child: new FlatButton(onPressed: (){
                                print('同意');
                              }, child: new Text('同意',style: new TextStyle(color: Colors.lightBlue),)),
                            ),
                            new Container(
                              width: 60.0,
                              height: 25.0,
                              child: new FlatButton(onPressed: (){
                                print('拒绝');
                              }, child: new Text('拒绝',style: new TextStyle(color: Colors.red),)),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ))
              ],
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: new Text('家庭成员可以查看和控制该家庭下的设备',textAlign: TextAlign.center,),
              ))
            ],
          ),
          new Expanded(child: new ListView.builder(
            itemBuilder: (_,int index) => cells[index],
            itemCount: cells.length,
          )),
        ],
      ),
    );
  }
}


class MeFamilyMemberModel{

  MeFamilyMemberModel({
    this.likeName,    //昵称
    this.relation,    //关系
    this.isManage,    //是否是管理员
    this.isApply,     //是否是申请人
  });

  final String likeName;
  final String relation;
  final bool   isManage;
  final bool   isApply;

}
