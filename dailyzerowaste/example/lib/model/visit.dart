import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

import 'user.dart';

class VisitShop {
  int cnt;
  String storeNum;
  String userId;
  String userName;
  Timestamp timestamp;
  DocumentReference reference;

  VisitShop({
    this.reference,
    this.cnt,
    this.storeNum = "",
    this.userId,
    this.userName,
    this.timestamp,
  });

  VisitShop.fromMap(Map<String, dynamic> map,
      {this.reference}) // 생성자 리다이렉팅 : 특정 생성자에게 처리를 위임할 수 있음
      : assert(map['userId'] != null),
        userId = map['userId'],
        userName = map['userName'],
        cnt = map['cnt'],
        timestamp = map['timestamp'];

  VisitShop.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  factory VisitShop.fromDocumnet(DocumentSnapshot doc) {
    Map getDocs = doc.data();
    return VisitShop(
      storeNum: getDocs["storeNum"],
      reference: getDocs["reference"],
      userId: getDocs["userId"],
      userName: getDocs["userId"],
      cnt: getDocs["cnt"],
      timestamp: getDocs["timestamp"],
    );
  }
}