import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ZeroWasteShop extends StatefulWidget {
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
    zoom: 14,
  );

  void _onMapCreated(GoogleMapController controller) {
    if (!_mapController.isCompleted) {
      _mapController.complete(controller);
    }
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
                myLocationEnabled: true,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 64.5, right: 41.5),
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                child: Icon(Icons.menu),
                backgroundColor: Color(0xffede6dd),
                foregroundColor: Color(0xff4e4b49),
                onPressed: _currentLocation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
