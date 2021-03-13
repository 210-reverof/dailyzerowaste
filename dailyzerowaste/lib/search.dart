import 'package:flutter/material.dart';

class search_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _search();
  }
}

class _search extends State<search_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: TextFormField(),
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

              // 검색 결과
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 31.3),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          // 사각형 box 모양의 주제 3개
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                child: InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 11, top: 7, right: 11, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: Color(0x00000000),
                                        border: Border.all(
                                            width: 1.0,
                                            color: Color(0xff4f4b49)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7))),
                                    child: Text('web'),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 11, top: 7, right: 11, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: Color(0x00000000),
                                        border: Border.all(
                                            width: 1.0,
                                            color: Color(0xff4f4b49)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7))),
                                    child: Text('illustration'),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 11, top: 7, right: 11, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: Color(0x00000000),
                                        border: Border.all(
                                            width: 1.0,
                                            color: Color(0xff4f4b49)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7))),
                                    child: Text('graphics'),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                      border: Border.all(
                                          width: 1.0, color: Color(0xff4f4b49)),
                                    ),
                                  ),
                                ),
                              ),

                              // 글 제목, 본문, 작성자
                              Container(
                                padding: EdgeInsets.only(
                                    left: 9, top: 5, right: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    // 글 제목
                                    Text(
                                      'Excepteur sint occaecat\ncupidatat non proident.',
                                      style: TextStyle(
                                        fontFamily: 'Quick-Pencil',
                                        fontSize: 20,
                                        color: Color(0xff4f4b49),
                                      ),
                                    ),
                                    SizedBox(height: 5),

                                    // 본문
                                    Text(
                                      'Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt\nmollit anim id est eopksio laborum.',
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
                                          'occaecat',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
