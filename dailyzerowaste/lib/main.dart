import 'package:dailyzerowaste/search.dart';
import 'package:flutter/material.dart';
import 'package:dailyzerowaste/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '#dailyzerowaste',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0x00000000)),
      home: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("image/background.png"),
            fit: BoxFit.cover,
          ),
          search_page(), // 화면 테스트용
          //login_page(),
        ],
      ),
    );
  }
}
