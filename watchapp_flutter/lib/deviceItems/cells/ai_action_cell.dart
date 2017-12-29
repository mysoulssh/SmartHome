import 'package:flutter/material.dart';

typedef SwitchClickCallback(int index,bool isTurnOn);
typedef SelectCellCallback();
typedef DeleteCallback(Object value);

class AiActionCell extends StatefulWidget{

  AiActionCell(this.text,this.isTurnOn,{this.switchClickCallback,this.selectCellCallback,this.deleteCallback,this.index});

  final String text;
  bool isTurnOn;

  SwitchClickCallback switchClickCallback;
  SelectCellCallback  selectCellCallback;
  DeleteCallback      deleteCallback;
  int index;

  _AiActionCellState cellState = new _AiActionCellState();

  void reloadList(){
    cellState.setState((){});
  }

  @override
  _AiActionCellState createState() => cellState;
}

class _AiActionCellState extends State<AiActionCell>{
  @override
  Widget build(BuildContext context){

    final ThemeData theme = Theme.of(context);
    
    return new Dismissible(
        key: new ObjectKey(widget),
        direction: DismissDirection.endToStart,
        onDismissed: (DismissDirection direction){
          widget.deleteCallback(widget);
        },
        background: new Container(
            color: theme.primaryColor,
            child: const ListTile(
                leading: const Icon(Icons.delete, color: Colors.white, size: 36.0)
            )
        ),
        secondaryBackground: new Container(
            color: Colors.red,
            child: const ListTile(
                trailing: const Text('删除', style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                ),)
            )
        ),
        child: new GestureDetector(
          onTap: (){
            if (widget.selectCellCallback != null){
              widget.selectCellCallback();
            }
          },
          child: new Container(
            color: const Color.fromRGBO(181, 180, 185, 1.0),
            padding: const EdgeInsets.only(bottom: 1.0),
            child: new Container(
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Expanded(child: new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(widget.text,style: new TextStyle(fontSize: 16.0),),
                  )),
                  new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new GestureDetector(
                      onTap: (){

                        if (widget.switchClickCallback != null){
                          widget.switchClickCallback(widget.index,!widget.isTurnOn);
                        }
                        widget.isTurnOn = !widget.isTurnOn;
                        setState((){});
                      },
                      child: new Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          new SizedBox(
                              width: 80.0,
                              height: 30.0,
                              child: new Image(image: new AssetImage(widget.isTurnOn?'images/btn_switch_bg2.png':'images/btn_switch_bg1.png'))
                          ),
                          new Container(
                            padding: widget.isTurnOn?const EdgeInsets.only(left: 50.0):const EdgeInsets.only(right: 50.0),
                            child: new SizedBox(
                              width: 37.0,
                              height: 40.0,
                              child: new Image(image: new AssetImage('images/btn_switch.png')),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
    /*
    return new GestureDetector(
      onTap: (){
        if (widget.selectCellCallback != null){
          widget.selectCellCallback();
        }
      },
      child: new Container(
        color: const Color.fromRGBO(181, 180, 185, 1.0),
        padding: const EdgeInsets.only(bottom: 1.0),
        child: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Expanded(child: new Container(
                padding: const EdgeInsets.all(10.0),
                child: new Text(widget.text,style: new TextStyle(fontSize: 16.0),),
              )),
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: new GestureDetector(
                  onTap: (){

                    if (widget.switchClickCallback != null){
                      widget.switchClickCallback(widget.index,!widget.isTurnOn);
                    }
                    widget.isTurnOn = !widget.isTurnOn;
                    setState((){});
                  },
                  child: new Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      new SizedBox(
                          width: 80.0,
                          height: 30.0,
                          child: new Image(image: new AssetImage(widget.isTurnOn?'images/btn_switch_bg2.png':'images/btn_switch_bg1.png'))
                      ),
                      new Container(
                        padding: widget.isTurnOn?const EdgeInsets.only(left: 50.0):const EdgeInsets.only(right: 50.0),
                        child: new SizedBox(
                          width: 37.0,
                          height: 40.0,
                          child: new Image(image: new AssetImage('images/btn_switch.png')),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    */
  }
}