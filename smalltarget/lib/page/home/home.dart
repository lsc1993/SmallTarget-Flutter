import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smalltarget/state/currentTarget.dart';
import 'package:smalltarget/util/DateUtil.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  //title 字体样式
  final titleStyle = TextStyle(fontFamily: "muyao", fontSize: 32.0);

  final weekDays = [
    {"index": 1, "day": "一"},
    {"index": 2, "day": "二"},
    {"index": 3, "day": "三"},
    {"index": 4, "day": "四"},
    {"index": 5, "day": "五"},
    {"index": 6, "day": "六"},
    {"index": 7, "day": "日"}
  ];

  CurrentTargetModel _currentTarget;

  @override
  Widget build(BuildContext context) {
    _currentTarget = Provider.of<CurrentTargetModel>(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("lib/assets/images/shield.png"),
                    width: 30,
                  ),
                  Text(
                    "小目标 UP UP",
                    style: titleStyle,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              height: 50,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 2),
                    blurRadius: 4.0)
              ]),
              child: Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: weekDays.map((item) => _getWeekDay(item)).toList()),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Image(
                image: AssetImage("lib/assets/images/title_img.jpeg"),
                height: 140,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: _getListItem(),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, "/target")},
        child: Icon(Icons.add),
      ),
    );
  }

  _getListItem() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _itemCustomView(index);
      },
      padding: EdgeInsets.all(0),
      itemCount: _currentTarget.targetNumber(),
      shrinkWrap: true,
      itemExtent: 75,
    );
  }

  _itemCustomView(index) {

    return (Container(
      key: ValueKey(index),
      margin: EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            _currentTarget.getTarget(index).targetIcon,
            color: Colors.blue,
            size: 32,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.3))),
              margin: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _currentTarget.getTarget(index).title,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "已完成目标",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              )),
                          TextSpan(
                              text: _currentTarget.getTarget(index).completedDay.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.amber,
                              )),
                          TextSpan(
                              text: "天",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              )),
                        ]))
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.blue,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  ///获取星期列表
  Expanded _getWeekDay(item) {
    Color borderColor = Colors.grey;
    var weekDay = DateUtil.getWeekDay();
    if (item["index"] == weekDay) {
      borderColor = Colors.blue;
    }
    return Expanded(
      flex: 1,
      child: Center(
          child: OutlineButton(
              onPressed: () => {},
              shape: CircleBorder(),
              highlightColor: Colors.transparent,
              borderSide: BorderSide(width: 2, color: borderColor),
              child: Text(item["day"]))),
    );
  }
}
