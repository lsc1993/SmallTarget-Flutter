import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  @override
  MeState createState() {
    return MeState();
  }
}

class MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Image(
                        image: AssetImage("lib/assets/images/header_1.png"),
                        fit: BoxFit.contain,
                        width: 50,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10),
                        child: Text("shuang", style: TextStyle(color: Colors.black, fontSize: 18))),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.settings),
                      color: Colors.blue,
                      highlightColor: Colors.transparent,
                    )
                  ],
                )
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white30, width: 0.5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("参与目标: 5")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
