import 'package:dailyzerowaste/login.dart';
import 'package:flutter/material.dart';

import 'model/user.dart';
import 'pageTransition.dart';
import 'stepHistory.dart';

class StepHomePage extends StatefulWidget {
  StepHomePage(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _step();
  }
}

class _step extends State<StepHomePage> {
  @override
  Widget build(BuildContext context) {
    // 배경 이미지
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            StepTopTabBar(), // step, history 탭바
            YourStepTitle(), // title
            YourStepInfo(), // step info
            YourTierStatus(), // tier status
          ],
        ),
      ),
    );
  }
}

// step, history 탭바
class StepTopTabBar extends StatelessWidget {
  const StepTopTabBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 61.2, 45, 25.2),
      child: Stack(
        children: <Widget>[
          // 탭 배경 이미지
          Container(
            width: 322.67,
            height: 46.61,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/source_selection_bar.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // 탭
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // step
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(59.3, 13.8, 59.3, 13.8),
                  child: Center(
                    child: Text(
                      'step',
                      style: TextStyle(
                        fontFamily: 'Quick-Pencil',
                        fontSize: 23,
                        color: Color(0xff4f4b49),
                      ),
                    ),
                  ),
                ),
              ),

              // history
              Expanded(
                flex: 5,
                child: Center(
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(59.3, 13.8, 59.3, 13.8),
                      child: Text(
                        'history',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 18,
                          color: Color(0xff707070),
                        ),
                      ),
                    ),
                    onTap: () {
                      print('hello'); // debug only
                      Navigator.push(
                        context,
                        CustomRoute(
                            builder: (context) => StepHistoryPage(currentUser)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// title
class YourStepTitle extends StatelessWidget {
  const YourStepTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              '6 may 2016 - 18 Aug 2016',
              style: TextStyle(
                fontFamily: 'Quick-Pencil',
                fontSize: 17,
                color: Color(0xff4f4b49),
              ),
            ),
            SizedBox(height: 6),
            Text(
              'YOUR STEP',
              style: TextStyle(
                fontFamily: 'Quick-Pencil',
                fontSize: 30,
                color: Color(0xff4f4b49),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// step info
class YourStepInfo extends StatelessWidget {
  const YourStepInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 59, right: 59),
      child: Row(
        children: <Widget>[
          // 여기서 나무가 자라요
          Container(
            width: 176,
            height: 176,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(100)),
          ),
          SizedBox(width: 29),
          Column(
            children: <Widget>[
              SizedBox(height: 57.3),

              // Try again 버튼
              Container(
                width: 87,
                height: 24.18,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Color(0xff4f4b49),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: InkWell(
                    child: Text(
                      'Try again',
                      style: TextStyle(
                        fontFamily: 'Quick-Pencil',
                        fontSize: 15,
                        color: Color(0xff4f4b49),
                      ),
                    ),
                  ),
                ),
              ),

              // 퍼센티지
              Container(
                padding: EdgeInsets.only(top: 6.5),
                child: Text(
                  '34%',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    fontSize: 60,
                    color: Color(0xff4f4b49),
                  ),
                ),
              ),

              // Practice Count
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      '26',
                      style: TextStyle(
                        fontFamily: 'Quick-Pencil',
                        fontSize: 25,
                        color: Color(0xff4f4b49),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'PRACTICES',
                      style: TextStyle(
                        fontFamily: 'Quick-Pencil',
                        fontSize: 25,
                        color: Color(0xff4f4b49),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// tier status
class YourTierStatus extends StatelessWidget {
  const YourTierStatus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 33, right: 44, top: 34),
      child: Column(
        children: <Widget>[
          // 첫번째 칭호
          Container(
            padding: EdgeInsets.all(0), // padding initialize
            child: Row(
              children: <Widget>[
                // 칭호 사진
                Container(
                  width: 106,
                  height: 106,
                  decoration: BoxDecoration(
                    //border: Border.all(width: 1, color: Colors.black), // debug only
                    image: DecorationImage(
                      image: AssetImage('image/tier/DIY_beginner.png'),
                    ),
                  ),
                ),

                // 어떤 분야의 칭호인지
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'DIY',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 20,
                          color: Color(0xff4f4b49),
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '3 PRACTICES',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 32,
                          color: Color(0xff4f4b49),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 31),

                // TRY 버튼
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/try_button.png'),
                    ),
                    //border: Border.all(width: 1, color: Colors.black), // debug only
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),

          // 두번째 칭호
          Container(
            padding: EdgeInsets.all(0), // padding initialize
            child: Row(
              children: <Widget>[
                // 칭호 사진
                Container(
                  width: 106,
                  height: 106,
                  decoration: BoxDecoration(
                    //border: Border.all(width: 1, color: Colors.black), // debug only
                    image: DecorationImage(
                      image: AssetImage('image/tier/shop_beginner.png'),
                    ),
                  ),
                ),

                // 어떤 분야의 칭호인지
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Visit zerowaste shop',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 20,
                          color: Color(0xff4f4b49),
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '3 PRACTICES',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 32,
                          color: Color(0xff4f4b49),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 25),

                // TRY 버튼
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/try_button.png'),
                    ),
                    //border: Border.all(width: 1, color: Colors.black), // debug only
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),

          // 세번째 칭호
          Container(
            padding: EdgeInsets.all(0), // padding initialize
            child: Row(
              children: <Widget>[
                // 칭호 사진
                Container(
                  width: 106,
                  height: 106,
                  decoration: BoxDecoration(
                    //border: Border.all(width: 1, color: Colors.black), // debug only
                    image: DecorationImage(
                      image: AssetImage('image/tier/check_beginner.png'),
                    ),
                  ),
                ),

                // 어떤 분야의 칭호인지
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Check practice',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 20,
                          color: Color(0xff4f4b49),
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '3 PRACTICES',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 32,
                          color: Color(0xff4f4b49),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 31),

                // TRY 버튼
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/try_button.png'),
                    ),
                    //border: Border.all(width: 1, color: Colors.black), // debug only
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),

          // 네번째 칭호
          Container(
            padding: EdgeInsets.all(0), // padding initialize
            child: Row(
              children: <Widget>[
                // 칭호 사진
                Container(
                  width: 106,
                  height: 106,
                  decoration: BoxDecoration(
                    //border: Border.all(width: 1, color: Colors.black), // debug only
                    image: DecorationImage(
                      image: AssetImage('image/tier/share_beginner.png'),
                    ),
                  ),
                ),

                // 어떤 분야의 칭호인지
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Share hashtags',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 20,
                          color: Color(0xff4f4b49),
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        '3 PRACTICES',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 32,
                          color: Color(0xff4f4b49),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 31),

                // TRY 버튼
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/try_button.png'),
                    ),
                    //border: Border.all(width: 1, color: Colors.black), // debug only
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
