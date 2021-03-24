import 'package:dailyzerowaste/model/user.dart';
import 'package:flutter/material.dart';

class StepInfoPage extends StatefulWidget {
  StepInfoPage(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _stepInfoFeed();
  }
}

class _stepInfoFeed extends State<StepInfoPage> {
  List selectedTagBoxes = ["tag", "second", "third"];

  Widget build(BuildContext context) {
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
                  SizedBox(height: 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 36),
                      Container(
                        width: 26,
                        child: InkWell(
                          child: Image.asset('image/source_direction.png'),
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  //제목
                  Container(
                      width: 311,
                      child: Text("step information",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff403e3d)))),

                  SizedBox(height: 10),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
