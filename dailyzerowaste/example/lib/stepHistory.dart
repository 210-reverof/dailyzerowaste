import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyzerowaste/model/DIY.dart';
import 'package:dailyzerowaste/model/check.dart';
import 'package:dailyzerowaste/model/visit.dart';
import 'package:dailyzerowaste/viewCheckPractice.dart';
import 'package:dailyzerowaste/viewDIY.dart';
import 'package:dailyzerowaste/viewVisitShop.dart';
import 'package:flutter/material.dart';

import 'login.dart';

DIY currentDIY;
Check currentVisitShop;
Check currentCheck;

class StepHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _stepHistory();
  }
}

class _stepHistory extends State<StepHistoryPage> {
  List currentUserName = [currentUser.username];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        body: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              Expanded(child: makeList(context, currentUserName)),
              //검색결과 -> 스트림빌더 생성 함수(생성자) 호출
            ],
          ),
        ),
      ),
    ));
  }

  Widget makeList(BuildContext context, List val) {
    List<Widget> ar = [];
    ar.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 40),
          Text(
            "DIY",
            style: TextStyle(
              fontFamily: 'Quick-Pencil',
              fontSize: 40,
              color: Color(0xff4f4b49),
            ),
          ),
        ],
      ),
    );
    ar.add(makeCustomList1(context, currentUser.username));

    ar.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          SizedBox(
            width: 342.94,
            height: 9.96,
            child: Image.asset("image/source_bar_2.png"),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(width: 40),
              Text(
                "Visit zero wasteshop",
                style: TextStyle(
                  fontFamily: 'Quick-Pencil',
                  fontSize: 40,
                  color: Color(0xff4f4b49),
                ),
              ),
            ],
          )
        ],
      ),
    );
    ar.add(makeCustomList2(context, currentUser.username));

    ar.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          SizedBox(
            width: 342.94,
            height: 9.96,
            child: Image.asset("image/source_bar_2.png"),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(width: 40),
              Text(
                "Check Practice",
                style: TextStyle(
                  fontFamily: 'Quick-Pencil',
                  fontSize: 40,
                  color: Color(0xff4f4b49),
                ),
              ),
            ],
          )
        ],
      ),
    );
    ar.add(makeCustomList3(context, currentUser.username));

    ar.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          SizedBox(
            width: 342.94,
            height: 9.96,
            child: Image.asset("image/source_bar_2.png"),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(width: 40),
              Text(
                "Share hashtags",
                style: TextStyle(
                  fontFamily: 'Quick-Pencil',
                  fontSize: 40,
                  color: Color(0xff4f4b49),
                ),
              ),
            ],
          )
        ],
      ),
    );
    ar.add(makeCustomList4(context, currentUser.username));

    print(ar);
    return Container(
        height: 700, child: ListView(shrinkWrap: true, children: ar));
  }

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget makeCustomList1(BuildContext context, String str) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('DIY')
            .where('userName', isEqualTo: str) //텍스트폼필드 값을 쿼리문에 이용
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList1(context, snapshot.data.docs);
        });
  }

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget makeCustomList2(BuildContext context, String str) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('VisitShop')
            .where('userName', isEqualTo: str) //텍스트폼필드 값을 쿼리문에 이용
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList2(context, snapshot.data.docs);
        });
  }

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget makeCustomList3(BuildContext context, String str) {
    FirebaseFirestore.instance
            .collection('PracticeCheck').orderBy('cnt', descending: true);

    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('PracticeCheck')
            .where('userName', isEqualTo: str) //텍스트폼필드 값을 쿼리문에 이용
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList3(context, snapshot.data.docs);
        });
  }

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget makeCustomList4(BuildContext context, String str) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('SocialShare')
            .where('userName', isEqualTo: str) //텍스트폼필드 값을 쿼리문에 이용
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList4(context, snapshot.data.docs);
        });
  }

  //쿼리문 스냅샷 문서를 인자로 갖고 리스트뷰를 반환하는 함수
  Widget _buildList1(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
        child: ListView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot
          .map((data) => _buildListItem1(context, data))
          .toList(), //문서마다 리스트뷰_타일 생성 함수(생성자) 호출
    ));
  }

  //쿼리문 스냅샷 문서를 인자로 갖고 리스트뷰를 반환하는 함수
  Widget _buildList2(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
        child: ListView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot
          .map((data) => _buildListItem2(context, data))
          .toList(), //문서마다 리스트뷰_타일 생성 함수(생성자) 호출
    ));
  }

  //쿼리문 스냅샷 문서를 인자로 갖고 리스트뷰를 반환하는 함수
  Widget _buildList3(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
        child: ListView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot
          .map((data) => _buildListItem3(context, data))
          .toList(), //문서마다 리스트뷰_타일 생성 함수(생성자) 호출
    ));
  }

  //쿼리문 스냅샷 문서를 인자로 갖고 리스트뷰를 반환하는 함수
  Widget _buildList4(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
        child: ListView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot
          .map((data) => _buildListItem4(context, data))
          .toList(), //문서마다 리스트뷰_타일 생성 함수(생성자) 호출
    ));
  }

  //각 문서의 데이터를 인자로 갖고 리스트뷰_타일(각 사각항목)을 반환하는 함수
  Widget _buildListItem1(BuildContext context, DocumentSnapshot data) {
    final currentDIY = DIY.fromSnapshot(data);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewDIYPage(currentDIY: currentDIY)));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x114f4b49),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // 글의 사진
                  Container(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                            image: currentDIY.cnt >= 10
                                ? DecorationImage(
                                    image:
                                      AssetImage('image/tier/DIY_expert.png'),
                                  )
                                : currentDIY.cnt >= 0
                                    ? DecorationImage(
                                        image: AssetImage(
                                            'image/tier/DIY_intermediate.png'),
                                      )
                                    : DecorationImage(
                                        image: AssetImage(
                                            'image/tier/DIY_beginner.png')),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),

                  // 글 제목, 본문, 작성자
                  Container(
                    padding:
                        EdgeInsets.only(left: 9, top: 5, right: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 글 제목
                        Container(
                            width: 250,
                            child: Text(
                              "NO. " + currentDIY.cnt.toString(),
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 20,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 5),

                        // 본문
                        Container(
                            width: 250,
                            child: Text(
                              currentDIY.timestamp.toDate().toString(),
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 15,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 10),
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

  //각 문서의 데이터를 인자로 갖고 리스트뷰_타일(각 사각항목)을 반환하는 함수
  Widget _buildListItem2(BuildContext context, DocumentSnapshot data) {
    final currentVisit = VisitShop.fromSnapshot(data);

    return InkWell(
      onTap: () {
        print(currentVisit.storeNum.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewVisitShopPage(currentVisit: currentVisit)));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x114f4b49),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // 글의 사진
                  Container(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                            image: currentVisit.cnt >= 16
                                ? DecorationImage(
                                    image: AssetImage(
                                        'image/tier/shop_expert.png'),
                                  )
                                : currentVisit.cnt >= 6
                                    ? DecorationImage(
                                        image: AssetImage(
                                            'image/tier/shop_intermediate.png'),
                                      )
                                    : DecorationImage(
                                        image: AssetImage(
                                            'image/tier/shop_beginner.png')),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),

                  // 글 제목, 본문, 작성자
                  Container(
                    padding:
                        EdgeInsets.only(left: 9, top: 5, right: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 글 제목
                        Container(
                            width: 250,
                            child: Text(
                              "NO. " + currentVisit.cnt.toString(),
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 20,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 5),

                        // 본문
                        Container(
                            width: 250,
                            child: Text(
                              currentVisit.timestamp.toDate().toString(),
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 15,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 10),
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

  Widget _buildListItem3(BuildContext context, DocumentSnapshot data) {
    final currentCheck = Check.fromSnapshot(data);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewCheckPracticePage(currentCheck: currentCheck)));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x114f4b49),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // 글의 사진
                  Container(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                            image: currentCheck.cnt >= 41
                                ? DecorationImage(
                                    image: AssetImage(
                                        'image/tier/check_expert.png'),
                                  )
                                : currentCheck.cnt >= 21
                                    ? DecorationImage(
                                        image: AssetImage(
                                            'image/tier/check_intermediate.png'),
                                      )
                                    : DecorationImage(
                                        image: AssetImage(
                                            'image/tier/check_beginner.png')),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),

                  // 글 제목, 본문, 작성자
                  Container(
                    padding:
                        EdgeInsets.only(left: 9, top: 5, right: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 글 제목
                        Container(
                            width: 250,
                            child: Text(
                              "NO. " + currentCheck.cnt.toString(),
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 20,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 5),

                        // 본문
                        Container(
                            width: 250,
                            child: Text(
                              currentCheck.timestamp.toDate().toString(),
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 15,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 10),
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

  Widget _buildListItem4(BuildContext context, DocumentSnapshot data) {
    final currentShare = DIY.fromSnapshot(data);

    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x114f4b49),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // 글의 사진
                  Container(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                            image: currentShare.cnt >= 16
                                ? DecorationImage(
                                    image: AssetImage(
                                        'image/tier/shop_expert.png'),
                                  )
                                : currentShare.cnt >= 31
                                    ? DecorationImage(
                                        image: AssetImage(
                                            'image/tier/shop_intermediate.png'),
                                      )
                                    : DecorationImage(
                                        image: AssetImage(
                                            'image/tier/shop_beginner.png')),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),

                  // 글 제목, 본문, 작성자
                  Container(
                    padding:
                        EdgeInsets.only(left: 9, top: 5, right: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 글 제목
                        Container(
                            width: 250,
                            child: Text(
                              "NO. " + currentShare.cnt.toString(),
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 20,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 5),

                        // 본문
                        Container(
                            width: 250,
                            child: Text(
                              currentShare.timestamp.toDate().toString(),
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 15,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 10),
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
