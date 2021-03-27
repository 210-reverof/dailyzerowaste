import 'package:dailyzerowaste/model/DIY.dart';
import 'package:flutter/material.dart';
import 'stepHistory.dart';

class ViewDIYPage extends StatefulWidget {
  ViewDIYPage(DIY currentDIY);

  @override
  State<StatefulWidget> createState() {
    return _viewFeed();
  }
}

class _viewFeed extends State<ViewDIYPage> {
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

                  //사진
                  Container(
                    height: 311,
                    width: 311,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(currentDIY.image),
                            fit: BoxFit.cover)),
                  ),

                  SizedBox(height: 21),

                  //제목
                  Container(
                      width: 311,
                      child: Text(currentDIY.title,
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
                      child: Text(currentDIY.text,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff403e3d)))),
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

  changeState(item) {
    setState(() {
      item['isActive'] = !item['isActive'];
    });
  }
}
