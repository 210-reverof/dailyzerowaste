import 'dart:async';
import 'dart:ui';

import 'package:dailyzerowaste/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'zeroWasteShopList.dart';

class ZeroWasteShop extends StatefulWidget {
  ZeroWasteShop(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _shop();
  }
}

class _shop extends State<ZeroWasteShop> {
  Completer<GoogleMapController> _mapController = Completer();
  MapType _googleMapType = MapType.normal;

  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(36.769691, 126.931705),
    zoom: 17,
  );

  void _onMapCreated(GoogleMapController controller) {
    //if (!_mapController.isCompleted) {
    _mapController.complete(controller);
    //}
  }

  // 현재 위치 불러오기
  void _currentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // 배경 이미지
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: GoogleMap(
                mapType: _googleMapType,
                onMapCreated: _onMapCreated,
                initialCameraPosition: _initialCameraPosition,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
              ),
            ),
            ShopListButton(),
          ],
        ),
      ),
    );
  }
}

class ShopInfo extends StatelessWidget {
  const ShopInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/shop_info.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'AlmangMarket',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Seoul, Mapo-gu, Hapjeong-dong, Woldeukeom-ro, 49 한\n우마을 2층',
                  style: TextStyle(
                    fontFamily: 'Quick-Pencil',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 23.5),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 49.3),
                      Icon(Icons.phone),
                      SizedBox(width: 20.3),
                      Text(
                        '010-2229-1027',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 49.3),
                      Icon(Icons.access_time),
                      SizedBox(width: 20.3),
                      Text(
                        '매일 14:00 ~ 20:00 (월요일 휴무)',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 49.3),
                      Icon(Icons.home_outlined),
                      SizedBox(width: 20.3),
                      Text(
                        'http://www.instagram.com/almongmarket',
                        style: TextStyle(
                          fontFamily: 'Quick-Pencil',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShopListButton extends StatelessWidget {
  const ShopListButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 98.5, right: 13.5),
      alignment: Alignment.topRight,
      child: FloatingActionButton(
        child: Icon(Icons.menu),
        backgroundColor: Color(0xffede6dd),
        foregroundColor: Color(0xff4e4b49),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ZeroWasteShopList()),
          );
        },
      ),
    );
  }
}
