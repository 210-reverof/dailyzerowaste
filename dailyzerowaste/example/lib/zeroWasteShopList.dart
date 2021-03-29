import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyzerowaste/model/store.dart';
import 'package:dailyzerowaste/zeroWasteShop.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

class ZeroWasteShopList extends StatefulWidget {
  LocationData currentLocation;
  ZeroWasteShopList({@required this.currentLocation});

  @override
  State<StatefulWidget> createState() {
    return _shopList();
  }
}

class _shopList extends State<ZeroWasteShopList> {
  @override
  Widget build(BuildContext context) {
//각 문서의 데이터를 인자로 갖고 리스트뷰_타일(각 사각항목)을 반환하는 함수
    Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
      print(widget.currentLocation.longitude.toString());
      var currentStore = Store.fromSnapshot(data);
      final Distance distance = Distance();
      final double km = distance.as(
          LengthUnit.Kilometer,
          LatLng(widget.currentLocation.latitude,
              widget.currentLocation.longitude),
          LatLng(currentStore.latitude, currentStore.longitude));

      //LatLng loc = LatLng(currentStore.latitude, currentStore.longitude);

      return InkWell(
        onTap: () {
          print('========================');
          print(currentStore);
          print('========================');
          Navigator.pop(context, currentStore);
        },
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        currentStore.name,
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      padding: EdgeInsets.only(right: 36),
                      child: Text(
                        km.toString() + ' km',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 36, right: 36),
                child: Text(
                  currentStore.address,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(36, 8, 36, 8),
                child: Image.asset('image/source_bar_2.png'),
              ),
            ],
          ),
        ),
      );
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

    // 텍스트폼필드의 값을 인자로 갖고, 스트림빌더를 반환하는 함수
    Widget _buildBody(BuildContext context) {
      return StreamBuilder<QuerySnapshot>(
          //동적 데이터 활용을 위해 스트림 형성
          stream: FirebaseFirestore.instance.collection('stores').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LinearProgressIndicator();
            }

            return _buildList(context, snapshot.data.docs); //리스트뷰 생성 함수(생성자) 호출
          });
    }

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
                      onTap: () {
                        List<double> curLoc = [
                          widget.currentLocation.latitude,
                          widget.currentLocation.longitude
                        ];
                        Navigator.pop(context, curLoc);
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              SizedBox(height: 27),

              // 가게 리스트
              _buildBody(context)
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
