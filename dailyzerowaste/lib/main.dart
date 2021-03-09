import 'package:dailyzerowaste/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '#dailyzerowaste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login_page(),
    );
  }
}