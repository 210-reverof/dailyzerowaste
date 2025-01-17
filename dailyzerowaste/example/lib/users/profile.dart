import 'package:flutter/material.dart';

import 'package:dailyzerowaste/model/record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../feed_page/viewFeed.dart';

class ProfilePage extends StatefulWidget {
  Record currentRecord;
  ProfilePage({@required this.currentRecord});

  @override
  State<StatefulWidget> createState() {
    return _profile();
  }
}

class _profile extends State<ProfilePage> {
  String searchText;
  @override
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
          child: Center(
            child: Column(
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

                Container(
                    child: Column(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  NetworkImage(widget.currentRecord.userImage)),
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(height: 20),
                    Text(widget.currentRecord.userName,
                        style: TextStyle(
                            fontFamily: 'Quick-Pencil',
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff403e3d)))
                  ],
                )),

                SizedBox(height: 25),

                //사용자 작성글-> 스트림빌더 생성 함수(생성자) 호출
                _buildBody(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('feed')
            .where('userName',
                isEqualTo: widget.currentRecord.userName) //텍스트폼필드 값을 쿼리문에 이용
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList(context, snapshot.data.docs); //리스트뷰 생성 함수(생성자) 호출
        });
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
    final currentRecord = Record.fromSnapshot(data);
    List<Widget> tagArray = [];

    for (int i = 0; i < currentRecord.selectedTags.length; i++) {
      //태그의 개수만큼 tagRectangle 생성 함수(생성자) 호출
      tagArray.add(tagRectangle(currentRecord.selectedTags[i])); //리스트에 추가
    }

    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ViewFeedPage(currentRecord: currentRecord))),
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
                      width: 124,
                      height: 124,
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
