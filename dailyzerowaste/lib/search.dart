//model 폴더 및 record 파일 추가
//yaml 파일에  firebase_storage: ^8.0.0 추가하고 import
//main함수 호출 비동기 설정 및 DB 초기화

import 'package:dailyzerowaste/model/record.dart';
import 'package:dailyzerowaste/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyzerowaste/model/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _search();
  }
}

class _search extends State<SearchPage> {
  String searchText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //만약 바탕을 터치하면 포커스 제거하기 (키보드 내려가도록)
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                // 검색창
                Container(
                  padding: EdgeInsets.only(left: 39, top: 79),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 370.5,
                        child: TextFormField(onChanged: (val) {
                          //텍스트폼필드에 변화가 있을 때마다
                          setState(() {
                            searchText = val; //검색텍스트 갱신
                          });
                        }),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 27,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                //검색결과 -> 스트림빌더 생성 함수(생성자) 호출
                _buildBody(context, searchText)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget _buildBody(BuildContext context, String val) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('feed')
            .where('title', isGreaterThanOrEqualTo: val) //텍스트폼필드 값을 쿼리문에 이용
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
    final record = Record.fromSnapshot(data);
    List<Widget> tagArray = [];

    for (int i = 0; i < record.selectedTags.length; i++) {
      //태그의 개수만큼 tagRectangle 생성 함수(생성자) 호출
      tagArray.add(tagRectangle(record.selectedTags[i])); //리스트에 추가
    }

    return Container(
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
                              image: NetworkImage(record.image),
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
                      Text(
                        record.title.toString(),
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 20,
                          color: Color(0xff4f4b49),
                        ),
                      ),
                      SizedBox(height: 5),

                      // 본문
                      Text(
                        record.text.toString(),
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 15,
                          color: Color(0xff4f4b49),
                        ),
                      ),
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
                            record.userName.toString(),
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
