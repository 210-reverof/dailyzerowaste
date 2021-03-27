import 'package:flutter/material.dart';

class TGPopUpMessageDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TGPopUpMessageDialog();
  }
}

class _TGPopUpMessageDialog extends State<TGPopUpMessageDialog> {
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
        height: 432,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 26),
            Text(
              'Information',
              style: TextStyle(
                  fontFamily: 'Nanum-SquareR',
                  fontSize: 20,
                  color: Color(0xff707070)),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 26, right: 26),
              child: Image.asset(
                'image/info_desc.png',
              ),
            ),
            SizedBox(height: 35),
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
              onTap: () {
                Navigator.pop(context);
              }, // popup에서 OK 누르면 띄워질 화면
            ),
          ],
        ),
      );
}

class TagInfoPopUpHelper {
  static confirm(context) => showDialog(
      context: context, builder: (context) => TGPopUpMessageDialog());
}
