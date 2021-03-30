import 'package:dailyzerowaste/model/visit.dart';
import 'package:flutter/material.dart';

class ViewVisitShopPage extends StatefulWidget {
  VisitShop currentVisit;
  ViewVisitShopPage ({@required this.currentVisit});
  @override
  State<StatefulWidget> createState() {
    return _viewFeed();
  }
}

class _viewFeed extends State<ViewVisitShopPage> {
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

                  //제목
                  Container(
                      width: 311,
                      child: Text( "visited [ " + widget.currentVisit.storeNum +" ]",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff403e3d)))),

                  SizedBox(height: 10),

                  //본문
                  Container(
                      width: 311,
                      child: Text(widget.currentVisit.timestamp.toDate().toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff403e3d)))),

                  SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
