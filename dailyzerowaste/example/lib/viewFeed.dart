import 'package:dailyzerowaste/profile.dart';
import 'package:flutter/material.dart';
import 'model/record.dart';
import 'login.dart';

class ViewFeedPage extends StatefulWidget {
  Record currentRecord;
  ViewFeedPage({@required this.currentRecord});

  @override
  State<StatefulWidget> createState() {
    return _viewFeed();
  }
}

class _viewFeed extends State<ViewFeedPage> {
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

                  SizedBox(height: 25),

                  //태그 박스들
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(width: 52.82),
                    Wrap(
                        spacing: 10.0,
                        runSpacing: 20.0,
                        children: widget.currentRecord.selectedTags
                            .map((option) => new Container(
                                // margin: EdgeInsets.all(5),
                                decoration: customBoxDecoration(),
                                child: Container(
                                    height: 20,
                                    padding: EdgeInsets.all(5),
                                    child: Text('$option',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: '1HoonDdukbokki',
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white)))))
                            .toList()),
                  ]),

                  SizedBox(height: 21),

                  //사진
                  Container(
                    height: 311,
                    width: 311,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.currentRecord.image),
                            fit: BoxFit.cover)),
                  ),

                  SizedBox(height: 21),

                  //제목
                  Container(
                      width: 311,
                      child: Text(widget.currentRecord.title,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff403e3d)))),

                  SizedBox(height: 10),

                  // 본문 내용
                  Container(
                      width: 311,
                      child: Text(widget.currentRecord.text,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff403e3d)))),

                  SizedBox(height: 200),

                  // 작성자 정보
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                  currentRecord: widget.currentRecord))),
                      child: Container(
                          child: Column(
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.currentRecord.userImage)),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(height: 20),
                          Text(
                            widget.currentRecord.userName,
                            style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff403e3d),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  customBoxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage("image/select_background.png"), fit: BoxFit.fill),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 0.1,
          blurRadius: 0.5,
          offset: Offset(3, 3),
        ),
      ],
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
}
