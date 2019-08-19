import 'package:flutter/material.dart';
import '../home/home.dart';
import '../me/me.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() {
    return FirstPageState();
  }

}

class FirstPageState extends State<FirstPage> {

  int _currentIndex = 0;
  final pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages
      ..add(Home())
      ..add(Me());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("firstPage"),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, color: _getCurrentColor(0)),
              title: Text("目标", style: TextStyle(color: _getCurrentColor(0)))),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: _getCurrentColor(1)),
              title: Text("我的", style: TextStyle(color: _getCurrentColor(1))))
        ],
        onTap: (int index) => {
          this.setState((){
            _currentIndex = index;
          })
        },
      ),
    );
  }

  _getCurrentColor(index) {
    if (index == _currentIndex) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }
}