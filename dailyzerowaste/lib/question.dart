import 'package:flutter/material.dart';

class question_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _question();
  }
}

class _question extends State<question_page> {
  int _q1 = 0;
  int _q2 = 0;
  int _q3 = 0;
  int _readyQ = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 비율이 맞지 않습니다ㅠㅠㅠㅠ
                Row(
                  children: <Widget>[
                    SizedBox(width: 41.02),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 18.98,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 121),
                    Text(
                      'Sign up',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 181),
                  ],
                ),
                Container(
                  // contents
                  padding: EdgeInsets.only(top: 68),
                  child: Column(
                    // contents align
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // nickname
                      Container(
                        padding:
                            EdgeInsets.only(left: 51), // nickname left padding
                        child: Column(
                          // nickname align
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Please set a nickname.'), // nickname desc
                            Row(
                              // nickname input
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  width: 230,
                                  child: TextFormField(),
                                ),
                                RaisedButton(
                                  child: Text('Confirm'),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Question 1
                      Container(
                        padding: EdgeInsets.only(top: 64, left: 51),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('1. Do you know "Zero waste"?'),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _q1 = 1;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                          value: 1,
                                          groupValue: _q1,
                                          onChanged: (val) {
                                            setState(() {
                                              _q1 = val;
                                            });
                                          },
                                        ),
                                        Text('Yes'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _q1 = 2;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                          value: 2,
                                          groupValue: _q1,
                                          onChanged: (val) {
                                            setState(() {
                                              _q1 = val;
                                            });
                                          },
                                        ),
                                        Text('No'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(),
                                  flex: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Question 2
                      Container(
                        padding: EdgeInsets.only(top: 38, left: 51),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('2. Have you practiced Zerowaste DIY?'),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _q2 = 1;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 1,
                                            groupValue: _q2,
                                            onChanged: (val) {
                                              setState(() {
                                                _q2 = val;
                                              });
                                            }),
                                        Text('0'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _q2 = 2;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 2,
                                            groupValue: _q2,
                                            onChanged: (val) {
                                              setState(() {
                                                _q2 = val;
                                              });
                                            }),
                                        Text('1~19'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _q2 = 3;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 3,
                                            groupValue: _q2,
                                            onChanged: (val) {
                                              setState(() {
                                                _q2 = val;
                                              });
                                            }),
                                        Text('10~15'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(child: SizedBox()),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Question 3
                      Container(
                        padding: EdgeInsets.only(top: 38, left: 51),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('3. Have you ever visited a Zerowaste shop?'),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _q3 = 1;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 1,
                                            groupValue: _q3,
                                            onChanged: (val) {
                                              setState(() {
                                                _q3 = val;
                                              });
                                            }),
                                        Text('0~5'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _q3 = 2;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 2,
                                            groupValue: _q3,
                                            onChanged: (val) {
                                              setState(() {
                                                _q3 = val;
                                              });
                                            }),
                                        Text('6~15'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _q3 = 3;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 3,
                                            groupValue: _q3,
                                            onChanged: (val) {
                                              setState(() {
                                                _q3 = val;
                                              });
                                            }),
                                        Text('16~40'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(child: SizedBox()),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Ready Question
                      Container(
                        padding: EdgeInsets.only(top: 78),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Are you ready\nto accept that progress is better than perfection?',
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(child: SizedBox(), flex: 2,),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _readyQ = 1;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 1,
                                            groupValue: _readyQ,
                                            onChanged: (val) {
                                              setState(() {
                                                _readyQ = val;
                                              });
                                            }),
                                        Text('Yes'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _readyQ = 2;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 2,
                                            groupValue: _readyQ,
                                            onChanged: (val) {
                                              setState(() {
                                                _readyQ = val;
                                              });
                                            }),
                                        Text('No'),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(child: SizedBox()),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Sign up Button
                      Container(
                        padding: EdgeInsets.only(top: 71, bottom: 64),
                        child: ButtonTheme(
                          minWidth: 295,
                          height: 48,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: RaisedButton(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                            color: Color(0xff2699FB),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
