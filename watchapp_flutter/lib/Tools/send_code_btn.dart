import 'package:flutter/material.dart';
import 'dart:async';

class SendCodeBtn extends StatefulWidget{

  SendCodeBtn({
    this.text,
    this.normalImage: 'images/btn_s_n.png',
    this.selectImage: 'images/btn_s_s.png',
    this.highlightImage: 'images/btn_s_s.png',
    this.disableImage: 'images/btn_s_d.png',
    this.callback
  });

  String text;
  final String normalImage;
  final String selectImage;
  final String highlightImage;
  final String disableImage;
  final VoidCallback callback;


  @override
  _SendCodeBtnState createState() => new _SendCodeBtnState();
}

class _SendCodeBtnState extends State<SendCodeBtn> with TickerProviderStateMixin{
  Image image;
  Timer timer;

  bool shouldTouch = true;

  @override
  void initState(){
    super.initState();

    image = widget.normalImage != null?new Image(image: new AssetImage(widget.normalImage)):null;
  }

  @override
  void dispose(){
    super.dispose();
    if(timer != null){
      timer.cancel();
      timer = null;
    }
  }

  void startTimer(){
    int i = 89;
    timer = new Timer.periodic(new Duration(seconds: 1), (Timer timer){
      setState((){
        widget.text = '重新发送 $i'+'s';
        i--;
        if(i < 0){
          widget.text = '重新发送';
          image = widget.normalImage != null?new Image(image: new AssetImage(widget.normalImage)):image;
          i = 10;
          timer.cancel();
          timer = null;
          shouldTouch = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return new Container(
      child: new GestureDetector(
        onTap: (){
          if(!shouldTouch) return;

          print('touchTap');
          if (widget.callback != null){
            widget.callback();
          }
          shouldTouch = false;
        },
        onTapDown: (TapDownDetails details){
          if(!shouldTouch) return;

          print('touchDown');
          setState((){
            image = widget.highlightImage != null?new Image(image: new AssetImage(widget.highlightImage)):image;
          });
        },
        onTapCancel: (){
          if(!shouldTouch) return;

          print('touchCancel');
          setState((){
            image = widget.normalImage != null?new Image(image: new AssetImage(widget.normalImage)):image;
          });
        },
        onTapUp: (TapUpDetails details){
          if(!shouldTouch) return;

          print('touchUp');
          setState((){
            image = widget.normalImage != null?new Image(image: new AssetImage(widget.selectImage)):image;
            widget.text = '重新发送 90s';
            startTimer();
          });
        },
        child: new Container(
          child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new SizedBox(
                width: 135.0,
                height: 45.0,
                child: image,
              ),
              new Text(widget.text,style: new TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}