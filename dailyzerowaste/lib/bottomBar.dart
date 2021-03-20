import 'login.dart';
import 'mypage.dart';
import 'package:flutter/material.dart';
import 'search.dart';
import 'zeroWasteShop.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _bottomBar();
  }
}

class _bottomBar extends State<BottomBar> {
  int _selectedIndex = 0;
  final List<Widget> _menu = [
    LoginPage(),
    ZeroWasteShop(),
    MyPage(),
    SearchPage(),
    MyPage()
  ]; // 테스트용
  //final List<Widget> _menu = [Feed(), ZeroWasteShop(), Step(), Search(), MyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _menu[_selectedIndex],
      bottomNavigationBar: Container(
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
    );
  }
}
