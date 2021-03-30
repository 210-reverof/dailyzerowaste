import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dailyzerowaste/login.dart';

import 'package:qrscan/qrscan.dart' as scanner;

import '../checkPermission.dart'; //qrscan 패키지를 scanner 별칭으로 사용.

class ZWSPopUpMessageDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _zwsPopUpMessageDialog();
  }
}

class _zwsPopUpMessageDialog extends State<ZWSPopUpMessageDialog> {
  String _marketID = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _popUpMessage(context),
    );
  }

    saveInfoToFirestore(BuildContext context) async {
final userReference =
    FirebaseFirestore.instance.collection('VisitShop');

      // 작성글 셋팅된 값으로 db에 set
      userReference.doc().set({
        'storeNum':_marketID,
        'cnt':currentUser.cntCheck,
        'userName': currentUser.username,
        'userId': currentUser.id,
        'timestamp': timestamp,
      });
  }

      updatepractice(BuildContext context) async {
    final userReference = FirebaseFirestore.instance.collection('users');

    currentUser.cntVisitShop += 1;

    // 체크박스 셋팅된 값으로 db에 set
    userReference.doc(currentUser.id).set({
      'id': currentUser.id,
      'profileName': currentUser.profileName,
      'username': currentUser.username,
      'cntDIY': currentUser.cntDIY,
      'cntVisitShop': currentUser.cntVisitShop,
      'cntCheck': currentUser.cntCheck,
      'cntShare': currentUser.cntShare,
      'url': currentUser.url,
      'email': currentUser.email,
      'bio': '',
      'image': currentUser.image,
      'step': currentUser.step,
      'timestamp': currentUser.timestamp,
    });
  }

  //비동기 함수
  Future _scan() async {
    // 되긴 됐는데 비동기 프로그래밍을 좀 더 공부해봐야할 듯
    bool status = await checkPermission();

    //스캔 시작 - 이때 스캔 될때까지 blocking
    String barcode = await scanner.scan();
    //스캔 완료하면 _output 에 문자열 저장하면서 상태 변경 요청.
    setState(() {
      _marketID = barcode;

      updatepractice(context);
      saveInfoToFirestore(context);

      // 다시 step페이지로 이동
      Navigator.popUntil(
          context, ModalRoute.withName(Navigator.defaultRouteName));
    });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Take a ',
                  style: TextStyle(fontFamily: 'Nanum-SquareR', fontSize: 21),
                ),
                Text(
                  'QR Code',
                  style: TextStyle(fontFamily: 'Nanum-SquareB', fontSize: 21),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'from the Zero Waste Shop!',
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
              onTap: () => _scan(),
            ),
          ],
        ),
      );
}

class ZWSPopUpHelper {
  static confirm(context) => showDialog(
      context: context, builder: (context) => ZWSPopUpMessageDialog());
}
