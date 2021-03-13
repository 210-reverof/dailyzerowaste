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
                'image/dailyzerowaste_default_logo.png',
                width: 270,
                height: 270,
              ),
              SizedBox(height: 93),
              ButtonTheme(
                minWidth: 271,
                height: 55,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Color(0xff4f4b49), width: 2.0),
                ),
                child: RaisedButton(
                  child: Text(
                    'Sign up with Google',
                    style: TextStyle(
                        fontFamily: 'Quick-Pencil', fontSize: 25, color: Color(0xff4f4b49)),
                  ),
                  color: Color(0x00fffff),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => question_page()),
                    );
                  },
                ),
              ),
              SizedBox(height: 25),
              ButtonTheme(
                minWidth: 271,
                height: 55,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Color(0xff4f4b49), width: 2.0),
                ),
                child: RaisedButton(
                  child: Text(
                    'Guest Login',
                    style: TextStyle(
                        fontFamily: 'Quick-Pencil',
                        fontSize: 27,
                        color: Color(0xff4f4b49)),
                  ),
                  color: Color(0x00000000),
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
