import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyzerowaste/model/store.dart';
import 'package:flutter/material.dart';

class ZeroWasteShopList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _shopList();
  }
}

class _shopList extends State<ZeroWasteShopList> {
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
          child: Column(
            children: <Widget>[
              // 상단 뒤로가기 화살표와 여백이 포함된 타이틀
              SizedBox(height: 36),
              Row(
                children: <Widget>[
                  SizedBox(width: 36),
                  Container(
                    width: 26,
                    child: InkWell(
                      child: Image.asset('image/source_direction.png'),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              SizedBox(height: 27),

              // // 가게 리스트
              // Column(
              //   children: <Widget>[
              //     // list 요소 1개
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //     ShopInfoInList(),
              //   ],
              // ),
              _buildBody(context)
            ],
          ),
        ),
      ),
    );
  }
}

  // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
  Widget _buildBody(BuildContext context) {
    print("빌드바디");
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('stores')
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
    print("빌드리스트");
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
    final currentStore = Store.fromSnapshot(data);

    print("빌드 리스트아이템");
    print(currentStore.name);
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  currentStore.name,
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 189),
                Text(
                  '3km',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Text(
              currentStore.address,
              style: TextStyle(
                fontFamily: 'Quick-Pencil',
                fontSize: 16,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              width: 342.94,
              child: Image.asset('image/source_bar_2.png'),
            ),
          ],
        ),
      ),
    );
  }

class ShopInfoInList extends StatelessWidget {
  const ShopInfoInList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'AlmangMarket',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 189),
                Text(
                  '3km',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Text(
              'Seoul, Mapo-gu, Hapjeong-dong, Woldeukeom-ro, 49 한우마을 2층',
              style: TextStyle(
                fontFamily: 'Quick-Pencil',
                fontSize: 16,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              width: 342.94,
              child: Image.asset('image/source_bar_2.png'),
            ),
          ],
        ),
      ),
    );
  }
}
