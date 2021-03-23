import 'package:flutter/material.dart';

class StepHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _stepHistory();
  }
}

class _stepHistory extends State<StepHistoryPage> {
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
