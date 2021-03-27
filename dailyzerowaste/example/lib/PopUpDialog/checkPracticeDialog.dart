import 'package:flutter/material.dart';

import '../login.dart';
import '../practicecheck.dart';

class CPPopUpMessageDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _cpPopUpMessageDialog();
  }
}

class _cpPopUpMessageDialog extends State<CPPopUpMessageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _popUpMessage(context),
    );
  }

  _popUpMessage(BuildContext context) => Container(
        width: 348,
        height: 183,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 38),
            Text(
              'Look back on',
              style: TextStyle(fontFamily: 'Nanum-SquareR', fontSize: 21),
            ),
            SizedBox(height: 5),
            Text(
              'your zero waste life.',
              style: TextStyle(fontFamily: 'Nanum-SquareR', fontSize: 21),
            ),
            SizedBox(height: 30),
            InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(18, 7, 18, 6),
                width: 64,
                height: 36,
                decoration: BoxDecoration(
                    color: Color(0xff4f4b49),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontFamily: 'Nanum-SquareR',
                    fontSize: 21,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PracticeCheckPage(
                          currentUser))), // popup에서 OK 누르면 띄워질 화면
            ),
          ],
        ),
      );
}

class CPPopUpHelper {
  static confirm(context) => showDialog(
      context: context, builder: (context) => CPPopUpMessageDialog());
}
