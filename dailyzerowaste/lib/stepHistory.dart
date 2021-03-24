import 'package:dailyzerowaste/stepHandler.dart';
import 'package:flutter/material.dart';

import 'package:dailyzerowaste/model/user.dart';

import 'login.dart';
import 'mypage.dart';
import 'practicecheck.dart';
import 'search.dart';
import 'stepHome.dart';
import 'temp.dart';
import 'zeroWasteShop.dart';

class StepHistoryPage extends StatefulWidget {
  StepHistoryPage(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _stepHistory();
  }
}

class _stepHistory extends State<StepHistoryPage> {
  int _selectedIndex = 0;
  final List<Widget> _menu = [
    //LoginPage(),
    Temp(), // 1번
    //StepHistoryPage(),
    ZeroWasteShop(currentUser), // 2번
    //PractieCheckPage(currentUser), // 3번
    StepHomePage(currentUser),
    //Temp(), // 4번
    SearchPage(currentUser), // 4번
    MyPage(currentUser), // 5번
  ]; // 테스트용
  //final List<Widget> _menu = [Feed(), ZeroWasteShop(), StepHomePage(), SearchPage(), MyPage()];

  @override
  Widget build(BuildContext context) {
    // 배경 이미지
    return Column(
      children: <Widget>[
        Text('hello'),
        Text('hello'),
      ],
    );
  }
}
