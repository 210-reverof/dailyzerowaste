import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class Share {
  int cnt;
  String userId;
  String userName;
  Timestamp timestamp;
  DocumentReference reference;

  Share({
    this.reference,
    this.cnt,
    this.userId,
    this.userName,
    this.timestamp,
  });

  Share.fromMap(Map<String, dynamic> map,
      {this.reference}) // 생성자 리다이렉팅 : 특정 생성자에게 처리를 위임할 수 있음
      : assert(map['userId'] != null),
        userId = map['userId'],
        userName = map['userName'],
        cnt = map['cnt'],
        timestamp = map['timestamp'];

  Share.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  factory Share.fromDocumnet(DocumentSnapshot doc) {
    Map getDocs = doc.data();
    return Share(
      reference: getDocs["reference"],
      userId: getDocs["userId"],
      userName: getDocs["userId"],
      cnt: getDocs["cnt"],
      timestamp: getDocs["timestamp"],
    );
  }
}
