import 'package:dailyzerowaste/stepHistory.dart';
import 'package:flutter/material.dart';

import 'stepHome.dart';

int STEP_TAB_INDEX = 0;

class StepHendler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _stepHandler();
  }
}

class _stepHandler extends State<StepHendler> {
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            //padding: EdgeInsets.all(0),
            children: <Widget>[
              Container(
                child: (STEP_TAB_INDEX == 0)
                    ? Container(
                        padding: EdgeInsets.fromLTRB(45, 61.2, 45, 0),
                        child: Stack(
                          children: <Widget>[
                            // 탭 배경 이미지
                            Container(
                              width: 322.67,
                              height: 46.61,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "image/source_selection_bar.png"),
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
                                    padding: EdgeInsets.fromLTRB(
                                        59.3, 13.8, 59.3, 13.8),
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
                                        padding: EdgeInsets.fromLTRB(
                                            59.3, 13.8, 59.3, 13.8),
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
                                        setState(() {
                                          STEP_TAB_INDEX = 1;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.fromLTRB(45, 61.2, 45, 0),
                        child: Stack(
                          children: <Widget>[
                            // 탭 배경 이미지
                            Container(
                              width: 322.67,
                              height: 46.61,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "image/source_selection_bar.png"),
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
                                        padding: EdgeInsets.fromLTRB(
                                            65.3, 13.8, 65.3, 13.8),
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
                                        setState(() {
                                          STEP_TAB_INDEX = 0;
                                        });
                                      },
                                    ),
                                  ),
                                ),

                                // history
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        52.3, 13.8, 52.3, 13.8),
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
                      ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 197,
                child: ListView(
                  children: <Widget>[
                    Container(
                        child: (STEP_TAB_INDEX == 0)
                            ? StepHomePage()
                            : StepHistoryPage()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
