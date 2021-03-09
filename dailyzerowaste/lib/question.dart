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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(width: 141),
                Text('Sign up'),
                SizedBox(width: 171),
              ],
            ),
            Container(
              // contents
              padding: EdgeInsets.only(top: 50),
              child: Column(
                // contents align
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // nickname
                  Container(
                    padding: EdgeInsets.only(left: 51), // nickname left padding
                    child: Column(
                      // nickname align
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Please set a nickname.'), // nickname desc
                        Row(
                          // nickname input
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              width: 230,
                              child: TextField(),
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
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      children: <Widget>[
                        Text('1. Do you know "Zero waste"?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                                value: 1, groupValue: _q1, onChanged: (val) {}),
                            Text('Yes'),
                            Radio(
                                value: 2, groupValue: _q1, onChanged: (val) {}),
                            Text('No'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Question 2
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Text('2. Have you practiced Zerowaste DIY?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                                value: 1, groupValue: _q2, onChanged: (val) {}),
                            Text('0'),
                            Radio(
                                value: 2, groupValue: _q2, onChanged: (val) {}),
                            Text('1~9'),
                            Radio(
                                value: 3, groupValue: _q2, onChanged: (val) {}),
                            Text('10~15'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Question 3
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Text('3. Have you ever visited a Zerowaste shop?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                                value: 1, groupValue: _q3, onChanged: (val) {}),
                            Text('0~5'),
                            Radio(
                                value: 2, groupValue: _q3, onChanged: (val) {}),
                            Text('6~15'),
                            Radio(
                                value: 3, groupValue: _q3, onChanged: (val) {}),
                            Text('16~40'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Ready Question
                  Container(
                    padding: EdgeInsets.only(top: 70),
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
                            Radio(
                                value: 1,
                                groupValue: _readyQ,
                                onChanged: (val) {}),
                            Text('Yes'),
                            Radio(
                                value: 2,
                                groupValue: _readyQ,
                                onChanged: (val) {}),
                            Text('No'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Sign up Button
                  Container(
                    padding: EdgeInsets.only(top: 70),
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
      ),
    );
  }
}
