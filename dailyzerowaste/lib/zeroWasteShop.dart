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
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(36.769691, 126.931705);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void _addMarker(LatLng point) {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: '지존 컴(소)공',
          snippet: 'sollutiob 언제 끝나..?',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    //파이어베이스 스트림빌드 생성해서 data 수만큼 _addMarker을 추가할겁니당 ~
    _addMarker(_center);
    _addMarker(new LatLng(36.769691, 126.231705)); //임의로 하나 찍어본 포인트

    return Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 17.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
            ),

            ShopListButton(),
          ],
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