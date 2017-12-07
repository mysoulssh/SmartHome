import 'package:flutter/material.dart';
import 'navagiton_bottom.dart';
import 'main_navbar.dart';
import 'me.dart';
import 'home.dart';
import 'location.dart';
import 'sport.dart';
import 'device.dart';
import 'deviceItems/device_add_scene.dart';
import 'deviceItems/ai_action.dart';
import 'deviceItems/ai_add_rule.dart';
import 'Tools/right_btn.dart';
import 'Tools/scan_qr_code.dart';
import 'package:watchapp_flutter/Tools/http_manage.dart';
import 'package:watchapp_flutter/Tools/user_access_model.dart';
import 'meItems/models/house_info_model.dart';
import 'grpc_src/dart_out/iot_comm/iot_comm.pb.dart';

enum AddSceneBtnType{
  AddDevice,   //添加设备
  AddScene,    //添加场景
  AddAction,   //智能联动
}

class WatchApp extends StatefulWidget{
  WatchApp({this.houseGuid});

  String houseGuid;

  @override
  _WatchAppState createState() => new _WatchAppState();
}

class _WatchAppState extends State<WatchApp> with TickerProviderStateMixin{
  // 类成员，存储底部导航栏的当前选择
  int _currentIndex = 0;
  // 类成员，存储底部导航栏的布局和行为：在点击时会变大
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  // 类成员，存储NavigationIconView类的列表
  List<NavigationIconView> _navigationViews;
  // 标题
  String title;
  //主视图
  Widget view;

  List<PopupMenuItem<List<String>>> popList = <PopupMenuItem<List<String>>>[];

  HomeItem homeView;
  Widget sportView;
  Widget locationView;
  Widget meView;
  DeviceItem deviceView;

  //家庭名称
  String familyName = '';
/*
   * 在对象插入到树中时调用
   *  框架将为它创建的每个State（状态）对象调用此方法一次
   * 覆盖此方法可以实现此对象被插入到树中的位置的初始化
   * 或用于配置此对象上的控件的位置的初始化
   */
  @override
  void initState() {
    // 调用父类的内容
    super.initState();

    title = '智能联动';
    view = homeView = new HomeItem(currentHouseGuid: widget.houseGuid,);

    sportView = new SportItem();
    locationView = new LocationItem();
    meView = new MineItem();
    deviceView = new DeviceItem();

    // 在存储NavigationIconView类的列表里添加内容
    _navigationViews = <NavigationIconView>[
      /*
       * 创建NavigationIconView类的实例
       *  传递图标参数
       *  传递标题参数
       *  传递颜色参数
       *  传递Ticker对象
       */
      new NavigationIconView(
        icon: new Icon(Icons.home),
        title: new Text('智能联动'),
        color: Colors.red,
        vsync: this,
      ),
//      new NavigationIconView(
//        icon: new Icon(Icons.favorite),
//        title: new Text('运动数据'),
//        color: Colors.red,
//        vsync: this,
//      ),
//      new NavigationIconView(
//        icon: new Icon(Icons.my_location),
//        title: new Text('位置'),
//        color: Colors.red,
//        vsync: this,
//      ),
      new NavigationIconView(
        icon: new Icon(Icons.devices),
        title: new Text('我的家'),
        color: Colors.red,
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.person),
        title: new Text('我的'),
        color: Colors.red,
        vsync: this,
      ),

    ];
    // 循环调用存储NavigationIconView类的列表的值
    for (NavigationIconView view in _navigationViews)
      // 每次动画控制器的值更改时调用侦听器
      view.controller.addListener(_rebuild);
    // 底部导航栏当前选择的动画控制器的值为1.0
    _navigationViews[_currentIndex].controller.value = 1.0;

    loadFamilys();
  }

  void loadFamilys(){
    httpManage.houseList(UserAccessModel.accessModel.accessToken, '', (Map map){
      List<HouseInfoModel> houseModels = map['houses'];
      popList.removeRange(0, popList.length);
      for (var tmp in houseModels){
        popList.add(new PopupMenuItem(child: new Text(tmp.houseName,),value: <String>[tmp.houseName,tmp.houseGuid],));
      }
      familyName = houseModels[0].houseName;
      var houseGuid = houseModels[0].houseGuid;
      deviceView.currentHouseGuid = houseGuid;
      homeView.currentHouseGuid = houseGuid;
      setState((){});
    }, (String errorMsg){

    });
  }


  // 释放此对象使用的资源
  @override
  void dispose() {
    // 调用父类的内容
    super.dispose();
    // 循环调用存储NavigationIconView类的列表中的项
    for (NavigationIconView view in _navigationViews)
      // 调用此方法后，对象不再可用
      view.controller.dispose();
  }
  // 动画控制器的值更改时的操作
  void _rebuild() {
    // 通知框架此对象的内部状态已更改
    setState((){
      // 重建，以便为视图创建动画
    });
  }

  // 覆盖此函数以构建依赖于动画的当前状态的控件
  @override
  Widget build(BuildContext context) {
    // 局部变量，创建底部导航栏
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
        fixedColor: Colors.red,
        /*
       * 在底部导航栏中布置的交互项：迭代存储NavigationIconView类的列表
       *  返回此迭代的每个元素的底部导航栏项目
       *  创建包含此迭代的元素的列表
       */
        items: _navigationViews
            .map((NavigationIconView navigationView) => navigationView.item)
            .toList(),
        // 当前活动项的索引：存储底部导航栏的当前选择
        currentIndex: _currentIndex,
        // 底部导航栏的布局和行为：存储底部导航栏的布局和行为
        type: _type,
        // 当点击项目时调用的回调
        onTap: (int index) {
          // 通知框架此对象的内部状态已更改
//          setState((){
            // 当前选择的底部导航栏项目，开始反向运行此动画
            _navigationViews[_currentIndex].controller.reverse();
            // 更新存储底部导航栏的当前选择
            _currentIndex = index;
            // 当前选择的底部导航栏项目，开始向前运行此动画
            _navigationViews[_currentIndex].controller.forward();
            if(index == 0){
              title = '智能联动';
              view = homeView;
            }else if (index == 5){
              title = '运动数据';
              view = sportView;
            }else if (index == 5){
              title = '位置';
              view = locationView;
            }else if (index == 2){
              title = '我的';
              view = meView;
            }else if (index == 1){
              title = '';
              view = deviceView;
            }
//          });
        }
    );

    // 实现基本的质感设计视觉布局结构
    return new Scaffold(
      // 质感设计应用栏
      appBar: new AppBar(
        // 应用栏中显示的主要控件，包含程序当前内容描述的文本
        title: new Text(title,style: new TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: new Color.fromRGBO(250, 251, 253, 1.00),
        leading: title == ''?new PopupMenuButton<List<String>>(
          itemBuilder: (BuildContext context) => popList,
          onSelected: (List<String> value){
            familyName = value[0];
            view = deviceView = new DeviceItem(currentHouseGuid: value[1],);
            homeView.currentHouseGuid = value[1];

            setState((){});
          },
          child: new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new Text(familyName, textAlign: TextAlign.center,style: new TextStyle(fontSize: 12.0,color: Colors.black),),
                )
              ],
            ),
          ),
        ):null,
        actions: title == ''?<Widget>[
          new PopupMenuButton<AddSceneBtnType>(
            child: new Container(
              padding: const EdgeInsets.all(10.0),
              child: new SizedBox(
                width: 25.0,
                height: 25.0,
                child: new Image(image: const AssetImage('images/btn_add.png')),
              ),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<AddSceneBtnType>>[
              new PopupMenuItem(child: new Text('添加设备'),value: AddSceneBtnType.AddDevice,),
              new PopupMenuItem(child: new Text('添加场景'),value: AddSceneBtnType.AddScene,),
//              new PopupMenuItem(child: new Text('智能联动'),value: AddSceneBtnType.AddAction,)
            ],
            onSelected: (AddSceneBtnType type){
              print('$type');
              if (type == AddSceneBtnType.AddScene){
                DeviceAddScene addScene = new DeviceAddScene(false,);
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new NavigationBar(addScene, '添加场景',
                      actions: <Widget>[
                        //添加场景界面保存按钮
                        new RightBtnItem('保存', (){
                          print('保存');
                          if (addScene.isEditScene){
                            httpManage.sceneEdit(
                                UserAccessModel.accessModel.accessToken,
                                addScene.sceneInfoModel.sceneName,
                                addScene.sceneInfoModel.sceneId,
                                addScene.sceneInfoModel.cmd,
                            (Map map){
                               print('编辑场景成功');
                            }, (String errorMsg){

                            });
                          }else{
                            if(addScene.cmd.length > 0){
                              IOTCMD iotCmd = new IOTCMD();
                              for (var v in addScene.cmd){
                                iotCmd.cmd.add(v);
                              }
                              //添加场景
                              httpManage.sceneAdd(
                                  UserAccessModel.accessModel.accessToken,
                                  deviceView.currentHouseGuid,
                                  addScene.sceneState.editController.text,
                                  addScene.sceneId,
                                  iotCmd,
                                      (Map map){
                                    print('添加场景成功');
                                    Navigator.of(context).pop();
                                  },
                                      (String errorMsg){
                                    print('添加场景错误信息：$errorMsg');
                                  });
                            }
                          }
                        })
                      ],
                    )
                ));
              }else if (type == AddSceneBtnType.AddAction){
                AiAction aiScene = new AiAction();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new NavigationBar(
                      aiScene, '智能联动',
                      actions: <Widget>[
                        new RightBtnItem('添加规则', (){
                          print('添加规则');
                          AiAddRule addRule = new AiAddRule(isEditRule: false,);
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new NavigationBar(addRule, '添加规则',
                                actions: <Widget>[
                                  new RightBtnItem('保存', (){
                                    print('添加规则保存');
                                    Navigator.of(context).pop();
                                  })
                                ],))
                          );
                        })
                      ],
                    )
                ));
              }else{
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
              }
            },
          ),
        ]:(title=='智能联动'?<Widget>[
          new RightBtnItem('添加规则', (){
            print('添加规则');
            AiAddRule addRule = new AiAddRule(isEditRule: false,);
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new NavigationBar(addRule, '添加规则',
                  actions: <Widget>[
                    new RightBtnItem('保存', (){
                      print('添加规则保存');

                      RuleInfo ruleInfo = addRule.ruleInfo
                          ..deviceId = ''
                          ..houseGuid = deviceView.currentHouseGuid
                          ..enable = 1;

                      bool onlyTime = true;

                      for (var i=1; i<=ruleInfo.exprs.length; i++){
                        var v = ruleInfo.exprs[i-1];
                        v.exprId = i;

                        if (v.subDeviceId != null || v.subDeviceId != ''){
                          onlyTime = false;
                        }
                      }
                      var tmpv = ruleInfo.exprs;
                      print('$tmpv');

                      onlyTime?ruleInfo.onlyTime = 1:ruleInfo.onlyTime = 2;

                      httpManage.eventRuleAdd(
                          ruleInfo.deviceId,
                          UserAccessModel.accessModel.accessToken,
                          ruleInfo.houseGuid,
                          ruleInfo.etName,
                          ruleInfo.prio,
                          ruleInfo.enable,
                          ruleInfo.onlyTime,
                          ruleInfo.lhs,
                          ruleInfo.isEnd,
                          ruleInfo.exprs,
                          ruleInfo.rhs,
                          (Map map){
                            String etId = map['etId'];
                            print('etId = $etId');
                            setState((){});
                          },
                          (String errorMsg){
                            print('error: $errorMsg');
                          });

                      Navigator.of(context).pop();
                    })
                  ],))
            );
          })
        ]:null),
      ),

      // 主要内容
      body: view,
      backgroundColor: new Color.fromRGBO(214, 214, 214, 1.00),
//      backgroundColor: Colors.white,
      // 水平的按钮数组，沿着程序的底部显示
      bottomNavigationBar: botNavBar,
    );
  }
}