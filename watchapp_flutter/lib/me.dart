import 'package:flutter/material.dart';

class MineItem extends StatefulWidget {
  @override
  _MineItemState createState() => new _MineItemState();
}

class _MineItemState extends State<MineItem> {

  @override
  void initState(){
    super.initState();

  }


  //创建列表item
  ListTileTheme _createTile(String image,String text,int tag){
    return new ListTileTheme(
      child: new ListTile(
        dense: true,
        title: new Text(text,style: new TextStyle(fontSize: 16.0,color: new Color.fromRGBO(28, 28, 28, 1.00)),),
        leading: new CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: new AssetImage('images/'+image),
        ),
        trailing: new Container(
          width: 18.0,
          height: 18.0,
          child: new ImageIcon(new AssetImage('images/btn_next2_n.png')),
        ),
        onTap: (){
          print('$tag 被点击');
          setState((){

          });
        },
      )
    );
  }

  Widget _createCell(String image,String text,int tag,double top){
    return new Padding(
      padding: new EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: new Container(
        color: Colors.white,
        child: _createTile(image, text, tag),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: new ListTile(
            title: new Text(
              '来去之间',
              style: new TextStyle(
                fontSize: 16.0,
                color: new Color.fromRGBO(28, 28, 28, 1.00),
              ),
            ),
            subtitle: new Text(
              '陈亦度',
              style: new TextStyle(
                fontSize: 13.0,
                color: Colors.black54,
              ),
            ),
            leading: new CircleAvatar(
              backgroundImage: new AssetImage('images/testIcon.jpg'),
            ),
            onTap: () {
              print('ListTile被点击');
            },
            trailing: new Padding(
              padding: new EdgeInsets.all(15.0),
              child: new GestureDetector(
                onTap: (){
                  print('二维码被点击');
                },
                child: new ImageIcon(new AssetImage('images/btn_code.png')),
              ),
            ),
          ),
        ),
        _createCell('icon_famliy.png', '我的家人', 0, 20.0),
        _createCell('icon_watch.png', '我的设备', 1, 1.0),
        _createCell('icon_message.png', '消息接收', 2, 1.0),
        _createCell('icon_phone.png', '我的手机', 3, 1.0),
        _createCell('icon_lock.png', '修改密码', 4, 1.0),
        _createCell('icon_about_us.png', '关于我们', 5, 20.0),

      ],
    );
  }
}
