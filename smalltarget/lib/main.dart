import 'package:flutter/material.dart';
import 'page/firstpage/firstPage.dart';
import 'page/target/targetManager.dart';
import 'package:provider/provider.dart';
import 'package:smalltarget/state/currentTarget.dart';

void main() => runApp(
  MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => CurrentTargetModel())
      ],
      child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/target": (BuildContext context) => TargetManager()
      },
      home: FirstPage(),
    );
  }
}
