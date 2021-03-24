import 'package:dailyzerowaste/model/record.dart';
import 'package:dailyzerowaste/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class feedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _feed();
  }
}

class _feed extends State<feedPage> {
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
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 320, top: 41),
                  child: SizedBox(
                    width: 90,
                    height: 40,
                    child: FloatingActionButton(
                      onPressed: () {},
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
                        side: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                      ),
                    ),
                  ),
                ),
                // 검색창
                Container(
                  padding: EdgeInsets.only(left: 39, top: 40),
                  child: Row(
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 30),
                          width: 400,
                          height: 100,
                          child: Column(
                            children: [
                              Text(
                                "#daily zerowaste",
                                style: TextStyle(
                                  fontFamily: 'Quick-Pencil',
                                  fontSize: 20,
                                  color: Color(0xff4f4b49),
                                ),
                              ),
                              Text(
                                "Share your DIY tips and get informations",
                                style: TextStyle(
                                  fontFamily: 'Quick-Pencil',
                                  fontSize: 20,
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
                                blurRadius: 15.0,
                                spreadRadius: 1.0,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4.0, -4.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 370.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // 각 스텝들의 버튼, 처음 피드페이지 진입시에는 기존 유저 스텝버튼 활성화
                      Tab(
                        icon: new Image.asset(
                          "image/feed_step.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      // 각 스텝들의 버튼, 처음 피드페이지 진입시에는 기존 유저 스텝버튼 활성화
                      Wrap(
                          spacing: 10.0,
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
                                          int a;
                                          for (int i = 0;
                                              i < stepValues.length;
                                              i++) {
                                            if (stepValues[i] ==
                                                [option['title']]) {
                                              a = i;
                                              print("ㅅㅂ");
                                            }
                                            print("tlqkf...");
                                          }

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
                                                  fontWeight: FontWeight.normal,
                                                  color: option['isActive']
                                                      ? Colors.white
                                                      : Colors.black87))))))
                              .toList())
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
      color: isActive ? Color(0xff1763DD) : Colors.white,
      border: Border(
          left: BorderSide(color: Colors.black12, width: 1.0),
          bottom: BorderSide(color: Colors.black12, width: 1.0),
          top: BorderSide(color: Colors.black12, width: 1.0),
          right: BorderSide(color: Colors.black12, width: 1.0)),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
  }

  // 토글 버튼 커스텀 박스
  customBoxDecoration1() {
    return BoxDecoration(
      color: Color(0xff1763DD),
      border: Border(
          left: BorderSide(color: Colors.black12, width: 1.0),
          bottom: BorderSide(color: Colors.black12, width: 1.0),
          top: BorderSide(color: Colors.black12, width: 1.0),
          right: BorderSide(color: Colors.black12, width: 1.0)),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
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
    ar.add(const Divider(
      height: 20,
      thickness: 5,
      indent: 20,
      endIndent: 20,
    ));

    ar.add(makeGeneralList(context));

    print(ar);
    return ListView(shrinkWrap: true, children: ar
        //[
        // makeCustomList1(context),
        // const Divider(
        //   height: 20,
        //   thickness: 5,
        //   indent: 20,
        //   endIndent: 20,
        // ),
        // makeGeneralList(context),
        //],
        );
  }

  //각 문서의 데이터를 인자로 갖고 리스트뷰_타일(각 사각항목)을 반환하는 함수
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    List<Widget> tagArray = [];

    for (int i = 0; i < record.tag.length; i++) {
      //태그의 개수만큼 tagRectangle 생성 함수(생성자) 호출
      tagArray.add(tagRectangle(record.tag[i])); //리스트에 추가
    }

    return Padding(
      padding: EdgeInsets.all(25),
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
                      color: Color(0xffbce0fd),
                      border: Border.all(width: 1.0, color: Color(0xff4f4b49)),
                    ),
                  ),
                ),
              ),

              // 글 제목, 본문, 작성자
              Container(
                padding: EdgeInsets.only(left: 9, top: 5, right: 5, bottom: 5),
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
                          record.user.toString(),
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
            color: Color(0x00000000),
            border: Border.all(width: 1.0, color: Color(0xff4f4b49)),
            borderRadius: BorderRadius.all(Radius.circular(7))),
        child: Text('$str'),
      ),
    ),
  );
}
