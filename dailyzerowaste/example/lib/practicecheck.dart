import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyzerowaste/model/user.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class PracticeCheckPage extends StatefulWidget {
  PracticeCheckPage(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _practiceCheck();
  }
}

List q = [0, 0, 0, 0];

class _practiceCheck extends State<PracticeCheckPage> {
  final DateTime timestamp = DateTime.now();

  Widget build(BuildContext context) {
    print(q);
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

                  SizedBox(height: 20),

                  //첫 번째 질문
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [selectTitle("1. Does DIY practice well?")]),

                  SizedBox(height: 20),

                  checkboxSet(0),

                  SizedBox(height: 30),

                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    selectTitle(
                        "2. Have you visited the Zero waste shop recently?")
                  ]),

                  SizedBox(height: 20),

                  checkboxSet(1),

                  SizedBox(height: 30),

                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    selectTitle(
                        "3. Have you shared a zero waste life with the people around you?")
                  ]),

                  SizedBox(height: 20),

                  checkboxSet(2),

                  SizedBox(height: 30),

                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    selectTitle("4. Are you living a zero waste life?")
                  ]),

                  SizedBox(height: 20),

                  checkboxSet(3),

                  SizedBox(height: 100),

                  // Complete Button
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
                              'Complete',
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
                        updatepractice(context);
                        saveInfoToFirestore(context);
                        q = [0, 0, 0, 0];

                        // Navigator.pop(context);

                        // 다시 step페이지로 이동
                        Navigator.popUntil(context,
                            ModalRoute.withName(Navigator.defaultRouteName));
                      },
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

  selectTitle(str) {
    return Expanded(
      child: Container(
          width: 450,
          child: Text(str,
              overflow: TextOverflow.visible,
              style: TextStyle(
                  fontFamily: 'Quick-Pencil',
                  fontSize: 23,
                  color: Color(0xff4f4b49))),
          padding: EdgeInsets.only(left: 52.82)),
    );
  }

  saveInfoToFirestore(BuildContext context) async {
    final userReference =
        FirebaseFirestore.instance.collection('PracticeCheck');

    // 작성글 셋팅된 값으로 db에 set
    userReference.doc().set({
      'cnt': currentUser.cntCheck,
      'userName': currentUser.username,
      'userId': currentUser.id,
      'timestamp': timestamp,
      'chart': q,
    });
  }

  updatepractice(BuildContext context) async {
    final userReference = FirebaseFirestore.instance.collection('users');

    print('cnt' + currentUser.cntCheck.toString());

    currentUser.cntCheck += 1;

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

  //질문 당 하나의 체크박스 세트
  checkboxSet(int index) {
    return Container(
        width: 307,
        height: 42,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Yes',
                //  textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quick Pencil',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff5c5b5a))),
            checkbox(index, 1, 42),
            checkbox(index, 2, 29),
            checkbox(index, 3, 18),
            checkbox(index, 4, 29),
            checkbox(index, 5, 42),
            Text('No',
                //  textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quick Pencil',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff5c5b5a))),
          ],
        ));
  }

  //체크박스 한 칸
  checkbox(int index, int val, double size) {
    return InkWell(
      onTap: () {
        setState(() {
          q[index] = val;
        });
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(),
          color: q[index] == val ? Color(0xff5c5b5a) : Color(0x00000000),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
