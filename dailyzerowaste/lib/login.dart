import 'package:dailyzerowaste/question.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _login();
  }
}

class _login extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'image/default_logo.png',
                width: 270,
                height: 270,
              ),
              SizedBox(height: 93),
              Container(
                width: 271,
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
                          'Sign up with Google',
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 25,
                              color: Color(0xff4f4b49)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
