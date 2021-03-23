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
          child: ListView(
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

              // 가게 리스트
              Column(
                children: <Widget>[
                  // list 요소 1개
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                  ShopInfoInList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopInfoInList extends StatelessWidget {
  const ShopInfoInList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
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
        onTap: () {},
      ),
    );
  }
}
