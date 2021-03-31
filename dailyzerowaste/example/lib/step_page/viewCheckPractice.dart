import 'package:flutter/material.dart';

import '../users/login.dart';
import '../model/check.dart';
import '../step_page/stepHistory.dart';

class ViewCheckPracticePage extends StatefulWidget {
  Check currentCheck;
  ViewCheckPracticePage({@required this.currentCheck});
  @override
  State<StatefulWidget> createState() {
    return _viewFeed();
  }
}

String toText(int n) {
  if (n == 1)
    return "Absolutely yes";
  else if (n == 2)
    return "Actually yes";
  else if (n == 3)
    return "normal";
  else if (n == 4)
    return "Actually yes";
  else if (n == 5) return "Absolutely no";
}

class _viewFeed extends State<ViewCheckPracticePage> {
  Widget build(BuildContext context) {
    String chartContents() {
      return "1. Does DIY practice well?\n\n                                " +
          toText(widget.currentCheck.chart[0]) +
          "\n\n\n\n2. Have you visited the Zero waste shop recently?\n\n                                " +
          toText(widget.currentCheck.chart[1]) +
          "\n\n\n\n3. Have you shared a zero waste life with the people around you?\n\n                                " +
          toText(widget.currentCheck.chart[2]) +
          "\n\n\n\n4. Are you living a zero waste life?\n\n                              " +
          toText(widget.currentCheck.chart[3]) +
          "\n";
    }

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

                  //제목
                  Container(
                      width: 311,
                      child: Text(chartContents(),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff403e3d)))),

                  SizedBox(height: 10),

                  //본문
                  Container(
                      width: 311,
                      child: Text(
                          widget.currentCheck.timestamp.toDate().toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff403e3d)))),

                  SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
