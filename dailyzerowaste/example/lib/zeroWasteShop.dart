import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyzerowaste/model/store.dart';
import 'package:dailyzerowaste/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'zeroWasteShopList.dart';

const double PIN_VISIBLE_POSITION = 0;
const double PIN_INVISIBLE_POSITION = -220;

Store currentStore;
Store showStore = Store(); // 종이쪼가리로 보여줄 가게 정보

class ZeroWasteShop extends StatefulWidget {
  ZeroWasteShop(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _shop();
  }
}

LocationData currentLocation;

Completer<GoogleMapController> _mapController = Completer();
MapType _googleMapType = MapType.normal;

_currentLocation() async {
  var location = new Location();
  try {
    currentLocation = await location.getLocation();
    //print(currentLocation.toString()); // debug only
  } on Exception {
    currentLocation = null;
  }
}

class _shop extends State<ZeroWasteShop> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(36.769691, 126.931705);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  double pinPillPosition = PIN_INVISIBLE_POSITION;

  void _addMarker(LatLng point) {
    _lastMapPosition = point;
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(_lastMapPosition.toString()),
      position: point,
      infoWindow: InfoWindow(
        title: currentStore.name,
        snippet: currentStore.address,
      ),
      icon: BitmapDescriptor.defaultMarker,
      onTap: () {
        setState(() {
          showStore = currentStore;
          this.pinPillPosition = PIN_VISIBLE_POSITION;
        });
      },
    ));
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  // shop 리스트의 요소를 누르면 해당 위치로 이동
  void _movingMapInShopList(Store currentStore) async {
    final GoogleMapController controller = await _controller.future;
    List<double> loc;
    if (currentStore == null || currentStore.name == '') {
      var location = new Location();
      currentLocation = await location.getLocation();
      loc = [currentLocation.latitude, currentLocation.longitude];
    } else {
      loc = [currentStore.latitude, currentStore.longitude];
    }
    setState(() {
      showStore = currentStore;
      if (showStore == null) {
        showStore = Store();
        this.pinPillPosition = PIN_INVISIBLE_POSITION;
      } else {
        this.pinPillPosition = PIN_VISIBLE_POSITION;
      }
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(loc[0], loc[1]),
        zoom: 17.0,
      ),
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

  //각 문서의 데이터를 인자로 갖고 리스트뷰_타일(각 사각항목)을 반환하는 함수
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    currentStore = Store.fromSnapshot(data);
    _addMarker(new LatLng(currentStore.latitude, currentStore.longitude));
    return InkWell(
      onTap: () {},
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    //파이어베이스 스트림빌드 생성해서 data 수만큼 _addMarker을 추가할겁니당 ~
    // _addMarker(_center);
    // _addMarker(new LatLng(36.769691, 126.231705)); //임의로 하나 찍어본 포인트

    _currentLocation();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 5.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onTap: (LatLng loc) {
              setState(() {
                this.pinPillPosition = PIN_INVISIBLE_POSITION;
              });
            },
          ),

          Container(
            padding: EdgeInsets.only(top: 98.5, right: 13.5),
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              child: Icon(Icons.menu),
              backgroundColor: Color(0xffede6dd),
              foregroundColor: Color(0xff4e4b49),
              onPressed: () async {
                print("going");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ZeroWasteShopList(currentLocation: currentLocation)),
                ).then((value) => _movingMapInShopList(value));
              },
            ),
          ),

          // shop info 움직이는 창
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400), // info 창 올라오는 속도
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: this.pinPillPosition,
            child: Container(
              //margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/shop_info_cut.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(37, 30, 36, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          showStore.name,
                          style: TextStyle(
                            fontFamily: 'Quick-Pencil',
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          showStore.address,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontFamily: 'Quick-Pencil',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 13),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 49.3),
                              Icon(Icons.phone),
                              SizedBox(width: 20.3),
                              Text(
                                showStore.phone,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontFamily: 'Quick-Pencil',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 13),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 49.3),
                              Icon(Icons.access_time),
                              SizedBox(width: 20.3),
                              Text(
                                showStore.hours,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontFamily: 'Quick-Pencil',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          //padding: EdgeInsets.only(bottom: 13),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 49.3),
                              Icon(Icons.home_outlined),
                              SizedBox(width: 20.3),
                              Expanded(
                                child: Text(
                                  showStore.url,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontFamily: 'Quick-Pencil',
                                    fontSize: 18,
                                  ),
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
            ),
            //ShopInfo(),
          ),

          _buildBody(context),
        ],
      ),
    );
  }
}
