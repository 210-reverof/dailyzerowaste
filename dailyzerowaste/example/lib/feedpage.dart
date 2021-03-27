import 'package:dailyzerowaste/model/record.dart';
import 'package:dailyzerowaste/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'PopUpDialog/feedInfoDialog.dart';
import 'feedupload.dart';
import 'login.dart';
import 'model/user.dart';
import 'viewFeed.dart';

Record currentRecord;

class FeedPage extends StatefulWidget {
  FeedPage(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _feed();
  }
}

class _feed extends State<FeedPage> {
  String searchText;
  String customValue;

  List stepValues = [];

  List selected = [
    {'title': 'beginner', 'isActive': false},
    {'title': 'intermediate', 'isActive': false},
    {'title': 'expert', 'isActive': false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 320, top: 41),
                  child: SizedBox(
                    width: 68,
                    height: 30,
                    child: FloatingActionButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FeedUploadPage(currentUser))),
                      child: Text(
                        "Writing",
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Color(0x4F4B4966),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xff4f4b49), width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(13),
                        ),
                      ),
                    ),
                  ),
                ),
                // 검색창
                Container(
                  padding: EdgeInsets.only(left: 26, top: 14),
                  child: Row(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 362,
                          height: 86,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "#daily zerowaste",
                                style: TextStyle(
                                  fontFamily: 'Nanum-SquareB',
                                  fontSize: 21,
                                  color: Color(0xff4f4b49),
                                ),
                              ),
                              Text(
                                "Share your DIY tips and get informations",
                                style: TextStyle(
                                  fontFamily: 'Nanum-SquareR',
                                  fontSize: 12,
                                  color: Color(0xff4f4b49),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[900],
                                offset: Offset(2.0, 2.0),
                                blurRadius: 8.0,
                                spreadRadius: 1.0,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4.0, -4.0),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 17),

                Container(
                  width: 370.5,
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 각 스텝들의 버튼, 처음 피드페이지 진입시에는 기존 유저 스텝버튼 활성화
                      InkWell(
                        child: Tab(
                          icon: new Image.asset(
                            "image/feed_icon.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        onTap: () async {
                          await FeedInfoPopUpHelper.confirm(context);
                        },
                      ),
                      // 각 스텝들의 버튼, 처음 피드페이지 진입시에는 기존 유저 스텝버튼 활성화
                      Container(
                        //padding: EdgeInsets.only(left: 25),
                        child: Wrap(
                            spacing: 17.0,
                            runSpacing: 20.0,
                            children: selected
                                .map((option) => new Container(
                                    // margin: EdgeInsets.all(5),
                                    decoration:
                                        customBoxDecoration(option['isActive']),
                                    child: InkWell(
                                        onTap: () {
                                          changeState(option);
                                          if (option[
                                              'isActive']) //option의 isActive가 true라면 ->
                                          {
                                            stepValues.add([option['title']]);
                                            print("add");
                                            print(stepValues);
                                          } else {
                                            //stepValues.removeAt(a);
                                            print("remove");
                                            print([option['title']]);
                                          }
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text('${option['title']}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Quick-Pencil',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black87))))))
                                .toList()),
                      )
                    ],
                  ),
                ),
                //맞춤피드 결과
                Expanded(child: makeList(context, stepValues)),
              ],
            ),
            //검색결과 -> 스트림빌더 생성 함수(생성자) 호출
          ),
        ),
      ),
    );
  }

  // 토글 버튼 커스텀 박스
  customBoxDecoration(isActive) {
    return BoxDecoration(
      color: Color(0xFFFFFFFF).withOpacity(0.0),
      border: isActive
          ? Border(bottom: BorderSide(width: 1.0, color: Colors.black87))
          : null,
    );
  }

  // 토글 버튼 이벤트
  changeState(item) {
    setState(() {
      item['isActive'] = !item['isActive'];
    });
  }

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget makeGeneralList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('feed')
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
            .collection('feed')
            .where('step', isEqualTo: str) //텍스트폼필드 값을 쿼리문에 이용
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList(context, snapshot.data.docs);
        });
  }

  //쿼리문 스냅샷 문서를 인자로 갖고 리스트뷰를 반환하는 함수
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    //_customBody(context, stepValues);
    return ListView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot
          .map((data) => _buildListItem(context, data))
          .toList(), //문서마다 리스트뷰_타일 생성 함수(생성자) 호출
    );
  }

  Widget makeList(BuildContext context, List val) {
    List<Widget> ar = [];
    for (int i = 0; i < stepValues.length; i++) {
      print("this");
      print(stepValues[i]);
      ar.add(makeCustomList1(context, stepValues[i]));
    }
    ar.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 129.67,
              height: 3.76,
              child: Image.asset("image/source_bar_2.png")),
          Text(
            "Full feed",
            style: TextStyle(
              fontFamily: 'Quick-Pencil',
              fontSize: 25,
              color: Color(0xff4f4b49),
            ),
          ),
          SizedBox(
              width: 129.67,
              height: 3.76,
              child: Image.asset("image/source_bar_2.png")),
        ],
      ),
    );

    ar.add(makeGeneralList(context));

    print(ar);
    return ListView(shrinkWrap: true, children: ar);
  }

  //각 문서의 데이터를 인자로 갖고 리스트뷰_타일(각 사각항목)을 반환하는 함수
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    currentRecord = Record.fromSnapshot(data);
    List<Widget> tagArray = [];

    for (int i = 0; i < currentRecord.selectedTags.length; i++) {
      //태그의 개수만큼 tagRectangle 생성 함수(생성자) 호출
      tagArray.add(tagRectangle(currentRecord.selectedTags[i])); //리스트에 추가
    }

    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ViewFeedPage(currentRecord))),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x334f4b49),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: <Widget>[
              // 태그 3개
              Row(children: tagArray),
              Row(
                children: <Widget>[
                  // 글의 사진
                  Container(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 112,
                      height: 112,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(currentRecord.image),
                                fit: BoxFit.cover)),
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
                            width: 217,
                            child: Text(
                              currentRecord.title.toString(),
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 20,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 5),

                        // 본문
                        Container(
                            width: 217,
                            child: Text(
                              currentRecord.text.toString(),
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 15,
                                color: Color(0xff4f4b49),
                              ),
                            )),
                        SizedBox(height: 10),

                        // 작성자
                        Row(
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.account_circle,
                                size: 20,
                              ),
                              constraints: BoxConstraints(),
                              onPressed: () {},
                            ),
                            SizedBox(width: 5),
                            Text(
                              currentRecord.userName.toString(),
                              style: TextStyle(
                                fontFamily: 'Quick-Pencil',
                                fontSize: 15,
                                color: Color(0xff4f4b49),
                              ),
                            ),
                          ],
                        ),
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

//문자열을 인자로 갖고 태그 사각형을 반환하는 함수
tagRectangle(str) {
  return Container(
    padding: EdgeInsets.all(5),
    child: InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 11, top: 7, right: 11, bottom: 5),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/select_background.png"),
                fit: BoxFit.fill),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 0.5,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(7))),
        child: Text('$str',
            style: TextStyle(
                fontFamily: '1HoonDdukbokki',
                fontSize: 11,
                color: Colors.white)),
      ),
    ),
  );
}
