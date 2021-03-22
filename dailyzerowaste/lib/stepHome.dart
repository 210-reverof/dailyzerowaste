import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class StepHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _step();
  }
}

class _step extends State<StepHomePage> {
  var _tabTextIndexSelected = 0;
  var _listTextTabToggle = ['step', 'history'];

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
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
                      Container(
                        width: 120,
                        child: InkWell(
                          child: Text('aa'),
                          onTap: () {},
                        ),
                      ),
                      Container(
                        width: 120,
                        child: InkWell(
                          child: Text('bb'),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
