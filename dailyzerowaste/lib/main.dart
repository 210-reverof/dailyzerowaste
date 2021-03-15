import 'package:dailyzerowaste/search.dart';
import 'package:flutter/material.dart';
import 'package:dailyzerowaste/login.dart';
import 'mypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '#dailyzerowaste',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0x00000000)),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: login_page(),
        //search_page(), // 화면 테스트용
        //mypage(), // 화면 테스트용
      ),
    );
  }
}
