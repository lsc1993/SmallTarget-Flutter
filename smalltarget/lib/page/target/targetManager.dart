import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smalltarget/page/component/CardImg.dart';
import 'package:smalltarget/state/currentTarget.dart';
import 'package:smalltarget/state/targetModel.dart';
import 'package:smalltarget/data/targetData.dart';

class TargetManager extends StatefulWidget {

  @override
  TargetState createState() {
    return TargetState();
  }
}

class TargetState extends State<TargetManager> {

  CurrentTargetModel _currentTarget; //当前正在进行的目标
  IconData _addTargetIcon = Icons.add_circle; //添加或者删除目标按钮

  @override
  Widget build(BuildContext context) {
    _currentTarget = Provider.of<CurrentTargetModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("添加小目标", style: TextStyle(color: Colors.blue),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("全部目标",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Expanded(child: Container()),
                FlatButton(onPressed: () => {},
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Text("目标管理", style: TextStyle(fontSize: 15, color: Colors.blue))
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  shrinkWrap: true,
                  children: allTargets.map((item) => _targetGridView(item)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _targetGridView(TargetModel item) {
    CardModel cardModel = CardModel();
    if (_currentTarget.containTarget(item.targetId)) {
      cardModel.hasTarget = true;
      _addTargetIcon = Icons.remove_circle;
    } else {
      cardModel.hasTarget = false;
      _addTargetIcon = Icons.add_circle;
    }

    cardModel.imgPath = item.targetImg;
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 1),
            blurRadius: 4.0
        )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200, maxHeight: 240),
              child: CardImg(cardModel)
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 6), child: Text(item.title, style: TextStyle(fontSize: 15))),
              Expanded(flex: 1, child: Container()),
              IconButton(icon: Icon(_addTargetIcon),color: Colors.blue, onPressed: () => {
                setState(() {
                  if (!cardModel.hasTarget) {
                    _currentTarget.addTarget(item);
                    _addTargetIcon = Icons.remove_circle;
                  } else {
                    _currentTarget.removeTarget(item);
                    _addTargetIcon = Icons.add_circle;
                  }
                })
              })
            ],
          ),
        ],
      ),
    );
  }
}