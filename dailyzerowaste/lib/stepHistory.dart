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
            // YourStepTitle(), // title
            // YourStepInfo(), // step info
            // YourTierStatus(), // tier status
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image/source_bottom_navigator.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Color(0xff4f4b49),
            unselectedItemColor: Color(0xff4f4b49),
            selectedFontSize: 17,
            unselectedFontSize: 17,
            currentIndex: _selectedIndex,
            //현재 선택된 Index
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
                //print(_selectedIndex); // debug only
              });
            },
            items: [
              BottomNavigationBarItem(
                title: Text(
                  'feed',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    color: Color(0xff4f4b49),
                  ),
                ),
                icon: Image(
                  image: AssetImage("image/bottom_navigator/home.png"),
                  width: 33,
                  height: 41,
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  'zerowaste\nshop',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    color: Color(0xff4f4b49),
                  ),
                  textAlign: TextAlign.center,
                ),
                icon: Image(
                  image: AssetImage("image/bottom_navigator/location.png"),
                  width: 33,
                  height: 41,
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  'step',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    color: Color(0xff4f4b49),
                  ),
                ),
                icon: Image(
                  image: AssetImage("image/bottom_navigator/step.png"),
                  width: 33,
                  height: 41,
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  'search',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    color: Color(0xff4f4b49),
                  ),
                ),
                icon: Image(
                  image: AssetImage("image/bottom_navigator/search.png"),
                  width: 33,
                  height: 41,
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  'my page',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    color: Color(0xff4f4b49),
                  ),
                ),
                icon: Image(
                  image: AssetImage("image/bottom_navigator/profile.png"),
                  width: 33,
                  height: 41,
                ),
              ),
            ],
          ),
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
                child: Center(
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(65.3, 13.8, 65.3, 13.8),
                      child: Text(
                        'step',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 18,
                          color: Color(0xff707070),
                        ),
                      ),
                    ),
                    onTap: () {
                      print('hello'); // debug only
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),

              // history
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(52.3, 13.8, 52.3, 13.8),
                  child: Center(
                    child: Text(
                      'history',
                      style: TextStyle(
                        fontFamily: 'Quick-Pencil',
                        fontSize: 23,
                        color: Color(0xff4f4b49),
                      ),
                    ),
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
