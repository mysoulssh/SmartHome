import 'package:flutter/material.dart';

class ActionBtn extends StatefulWidget{

  ActionBtn({
    this.text,
    this.normalImage: 'images/btn_m_n.png',
    this.selectImage: 'images/btn_m_s.png',
    this.highlightImage: 'images/btn_m_s.png',
    this.disableImage: 'images/btn_m_d.png',
    this.callback
  });

  final String text;
  final String normalImage;
  final String selectImage;
  final String highlightImage;
  final String disableImage;
  final VoidCallback callback;

  @override
  _ActionBtnState createState() => new _ActionBtnState();
}

class _ActionBtnState extends State<ActionBtn>{
  Image image;

  @override
  void initState(){
    super.initState();

    image = widget.normalImage != null?new Image(image: new AssetImage(widget.normalImage)):null;
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new GestureDetector(
        onTap: (){
          print('touchTap');
          if (widget.callback != null){
            widget.callback();
          }
        },
        onTapDown: (TapDownDetails details){
          print('touchDown');
          setState((){
            image = widget.highlightImage != null?new Image(image: new AssetImage(widget.highlightImage)):image;
          });
        },
        onTapCancel: (){
          print('touchCancel');
          setState((){
            image = widget.normalImage != null?new Image(image: new AssetImage(widget.normalImage)):image;
          });
        },
        onTapUp: (TapUpDetails details){
          print('touchUp');
          setState((){
            image = widget.normalImage != null?new Image(image: new AssetImage(widget.normalImage)):image;
          });
        },
        child: new Center(
            child: new SizedBox(
              width: 217.0,
              height: 45.0,
              child: new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  image,
                  new Text(widget.text)
                ],
              ),
            )
        ),
      ),
    );
  }
}
