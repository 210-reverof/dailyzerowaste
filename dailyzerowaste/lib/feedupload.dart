import 'package:dailyzerowaste/model/user.dart';
import 'package:flutter/material.dart';

class FeedUploadPage extends StatefulWidget {
  FeedUploadPage(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _feedUpload();
  }
}

class _feedUpload extends State<FeedUploadPage> {
  List selectedTagBoxes = [
    {'title': 'refuse', 'isActive': false},
    {'title': 'reduce', 'isActive': false},
    {'title': 'reuse', 'isActive': false},
    {'title': 'recycle', 'isActive': false},
    {'title': 'rot to acheieve', 'isActive': false},
  ];

  List selectedTargetBoxes = [
    {'title': 'for beginner', 'isActive': false},
    {'title': 'for intermediate', 'isActive': false},
    {'title': 'for expert', 'isActive': false},
    {'title': 'for celcbrity', 'isActive': false},
  ];

  List selectedTags = [];
  List selectedTargets = [];
  String image;
  String title;
  String text;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector( 
        onTap: () {   //만약 바탕을 터치하면 포커스 제거하기 (키보드 내려가도록)
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }},
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

                  SizedBox(height: 13),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [selectTitle("Select tags")]),

                  SizedBox(height: 6),

                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(width: 52.82),
                    Wrap(
                        spacing: 10.0,
                        runSpacing: 20.0,
                        children: selectedTagBoxes
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
                                        selectedTags.add(option['title']);
                                      } else {
                                        selectedTags.remove(option['title']);
                                      }
                                    },
                                    child: Container(
                                        height: 20,
                                        padding: EdgeInsets.all(5),
                                        child: Text('${option['title']}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: '1HoonDdukbokki',
                                                fontSize: 11,
                                                fontWeight: FontWeight.normal,
                                                color: option['isActive']
                                                    ? Colors.white
                                                    : Colors.black87))))))
                            .toList()),
                  ]),

                  SizedBox(height: 20),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [selectTitle("Select targets")]),

                  SizedBox(height: 6),

                  Row(//crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(width: 52.82),
                    Wrap(
                        spacing: 10.0,
                        runSpacing: 20.0,
                        children: selectedTargetBoxes
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
                                        selectedTargets.add(option['title']);
                                      } else {
                                        selectedTargets.remove(option['title']);
                                      }
                                    },
                                    child: Container(
                                        height: 20,
                                        padding: EdgeInsets.all(5),
                                        child: Text('${option['title']}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: '1HoonDdukbokki',
                                                fontSize: 11,
                                                fontWeight: FontWeight.normal,
                                                color: option['isActive']
                                                    ? Colors.white
                                                    : Colors.black87))))))
                            .toList()),
                  ]),

                  SizedBox(height: 48),

                  Container(
                    height: 311,
                    width: 311,
                    color: Color(0xff4f4b49),
                  ),

                  SizedBox(height: 20),

                  Container(
                      width: 310,
                      child: TextField(
                        maxLength: 20,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(color: Color(0xff5c5b5a))
                        ),
                        onChanged: (val) {},
                      )),

                  SizedBox(height: 5),

                  Container(
                      width: 310,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 500,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                        decoration: 
                        InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Contents',
                          hintStyle: TextStyle(color: Color(0xff5c5b5a)),
                        ),
                        onChanged: (val) {},
                      )),

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
                        print(selectedTags.toString() +
                            "   " +
                            selectedTargets.toString());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  selectTitle(str) {
    return Container(
        child: Text(str,
            style: TextStyle(
                fontFamily: 'Quick-Pencil',
                fontSize: 30,
                color: Color(0xff4f4b49))),
        padding: EdgeInsets.only(left: 52.82));
  }

  customBoxDecoration(isActive) {
    return BoxDecoration(
      image: isActive
          ? DecorationImage(
              image: AssetImage("image/select_background.png"),
              fit: BoxFit.fill)
          : null,
      boxShadow: isActive
          ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 0.5,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ]
          : null,
      color: isActive ? Color(0x00000000) : Colors.white,
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

  changeState(item) {
    setState(() {
      item['isActive'] = !item['isActive'];
    });
  }
}
