import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  String url;
  String address;
  String hours;
  String name;
  String phone;
  double latitude;
  double longitude;
  DocumentReference reference;

  Store({
    this.url,
    this.address,
    this.hours,
    this.name,
    this.phone,
    this.latitude,
    this.longitude,
  });

  Store.fromMap(Map<String, dynamic> map,
      {this.reference}) // 생성자 리다이렉팅 : 특정 생성자에게 처리를 위임할 수 있음
      : assert(map['name'] != null),
        url = map['URL'],
        address = map['address'],
        hours = map['hours'],
        phone = map['phone'],
        latitude = map['latitude'],
        longitude = map['longitude'];

  Store.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  factory Store.fromDocumnet(DocumentSnapshot doc) {
    Map getDocs = doc.data();
    return Store(
      url: getDocs["URL"],
      address: getDocs["address"],
      hours: getDocs["hours"],
      phone: getDocs["phone"],
      latitude: getDocs["latitude"],
      longitude: getDocs["longitude"],
    );
  }
}
