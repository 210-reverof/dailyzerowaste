import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class Check {
  int cnt;
  String userId;
  String userName;
  List chart;
  Timestamp timestamp;
  DocumentReference reference;

  Check({
    this.reference,
    this.cnt,
    this.userId,
    this.userName,
    this.timestamp,
    this.chart,
  });

  Check.fromMap(Map<String, dynamic> map,
      {this.reference}) // 생성자 리다이렉팅 : 특정 생성자에게 처리를 위임할 수 있음
      : assert(map['userId'] != null),
        userId = map['userId'],
        userName = map['userName'],
        cnt = map['cnt'],
        timestamp = map['timestamp'],
        chart = map['chart'];

  Check.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  factory Check.fromDocumnet(DocumentSnapshot doc) {
    Map getDocs = doc.data();
    return Check(
      reference: getDocs["reference"],
      userId: getDocs["userId"],
      userName: getDocs["userId"],
      cnt: getDocs["cnt"],
      timestamp: getDocs["timestamp"],
      chart: getDocs["chart"],
    );
  }
}
