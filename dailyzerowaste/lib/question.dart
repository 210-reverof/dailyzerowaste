import 'dart:async';
import 'package:flutter/material.dart';

class ReturnNickname {
  String nickname;
  String step;

  ReturnNickname({this.nickname, this.step});

  ReturnNickname.setNickname(String str) {
    this.nickname = str;
  }
}

class QuestionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _question();
  }
}

class _question extends State<QuestionPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  int _q1 = 0;
  int _q2 = 0;
  int _q3 = 0;
  int _readyQ = 0;
  ReturnNickname user;
  TextEditingController nicknameController;

  submitNickname() {
    checkStep();

    if (user.step == null || user.nickname == null) return;

    if (user.step == "e1") {
      print("e1");
      return;
    }

    if (user.step == "e2") {
      print("e2");
      return;
    }

    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();

/*
      SnackBar snackBar = SnackBar(content: Text('Welcome ' + user.nickname));
      _scaffoldKey.currentState.showSnackBar(snackBar);*/
      print(user.nickname.toString() + " " + user.step.toString());
      Timer(Duration(seconds: 4), () {
        Navigator.pop(context, user);
      });
    }
  }

  checkStep() {
    if (_q1 == 0 || _q2 == 0 || _q3 == 0 || _readyQ == 0) {
      user.step = "e1";
      print("e1");
      return;
    }

    if (_readyQ == 2) {
      user.step = "e2";
      print("e2");
      return;
    }

    user.step = "beginner";

    if (_q1 == 1 && _q2 >= 2 && _q3 >= 2) {
      user.step = "intermediate";
    }

    if (_q1 == 1 && _q2 >= 3 && _q3 >= 3) {
      user.step = "expert";
    }
  }

  @override
  Widget build(BuildContext context) {
    user = ReturnNickname.setNickname("dddd");
    user.step = "";
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 36),
                      Container(
                        width: 26,
                        child: InkWell(
                          child: Image.asset('image/source_direction.png'),
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      SizedBox(width: 99),
                      Text(
                        'Sign up',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(width: 160),
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
                          padding: EdgeInsets.only(
                              left: 51), // nickname left padding
                          child: Column(
                            // nickname align
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Please set a nickname.'), // nickname desc
                              Row(
                                // nickname input
                                children: <Widget>[
                                  Container(
                                  width: 262,
                                  child: Form(
                                      key: _formKey,
                                      autovalidate: true,
                                      child: TextFormField(
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        validator: (val) {
                                          if (val.trim().length < 5 ||
                                              val.isEmpty) {
                                            return 'user name is too short (< 5)';
                                          } else if (val.trim().length > 15 ||
                                              val.isEmpty) {
                                            return 'user name is too long (> 15)';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (val) => user.nickname = val,
                                      ))),
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Comfirm',
                                        style: TextStyle(
                                          fontFamily: 'Quick-Pencil',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Container(
                                width: 262,
                                child: Image.asset('image/source_bar_2.png'),
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
                              Text(
                                  '3. Have you ever visited a Zerowaste shop?'),
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
                                  Flexible(
                                    child: SizedBox(),
                                    flex: 2,
                                  ),
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
                          width: 271,
                          padding: EdgeInsets.only(top: 48, bottom: 110),
                          child: InkWell(
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Image.asset(
                                    'image/source_bar.png',
                                    width: 271,
                                    height: 55,
                                  ),
                                ),
                                Center(
                                  heightFactor: 2.7,
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                        fontFamily: 'Quick-Pencil',
                                        fontSize: 25,
                                        color: Color(0xff4f4b49)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            onTap: submitNickname,
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
      ),
    );
  }
}