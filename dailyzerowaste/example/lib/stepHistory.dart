import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyzerowaste/model/DIY.dart';
import 'package:dailyzerowaste/viewDIY.dart';
import 'package:flutter/material.dart';

import 'login.dart';

DIY currentDIY;

int diynum = 0;

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

  Widget makeGeneralList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('DIY')
            .where('title') //텍스트폼필드 값을 쿼리문에 이용
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList(context, snapshot.data.docs);
        });
  }

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget makeCustomList1(BuildContext context, List str) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('DIY')
            //  .where('username', isEqualTo: str) //텍스트폼필드 값을 쿼리문에 이용
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList(context, snapshot.data.docs);
        });
  }

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget _buildBody(BuildContext context, String val) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('DIY')
            .where('username', isEqualTo: val) //텍스트폼필드 값을 쿼리문에 이용
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList(context, snapshot.data.docs); //리스트뷰 생성 함수(생성자) 호출
        });
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
    ar.add(makeCustomList1(context, currentUserName));
    ar.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
      ),
    );

    //ar.add(makeCustomList2(context, currentUserName));

    print(ar);
    return Container(
        height: 700, child: ListView(shrinkWrap: true, children: ar));
  }

  //쿼리문 스냅샷 문서를 인자로 갖고 리스트뷰를 반환하는 함수
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
        child: ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot
          .map((data) => _buildListItem(context, data))
          .toList(), //문서마다 리스트뷰_타일 생성 함수(생성자) 호출
    ));
  }

  //각 문서의 데이터를 인자로 갖고 리스트뷰_타일(각 사각항목)을 반환하는 함수
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
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
                            image: currentUser.cntDIY >= 10
                                ? DecorationImage(
                                    image:
                                        AssetImage('image/tier/DIY_expert.png'),
                                  )
                                : currentUser.cntDIY >= 1
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
}
