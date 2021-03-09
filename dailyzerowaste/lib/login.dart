import 'package:dailyzerowaste/question.dart';
import 'package:flutter/material.dart';

class login_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _login();
  }
}

class _login extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'image/logo.jpg',
                width: 175,
                height: 175,
              ),
              SizedBox(height: 95),
              ButtonTheme(
                minWidth: 295,
                height: 48,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: RaisedButton(
                  child: Text(
                    'Sign up with Google',
                    style: TextStyle(
                        fontFamily: 'Arial', fontSize: 10, color: Colors.white),
                  ),
                  color: Color(0xff2699FB),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => question_page()),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              ButtonTheme(
                minWidth: 295,
                height: 48,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Color(0xff2699FB), width: 2.0),
                ),
                child: RaisedButton(
                  child: Text(
                    'Guest Login',
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color: Color(0xff2699FB)),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
