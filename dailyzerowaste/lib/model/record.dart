import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String title;
  final String text;
  final String user;
  final List<dynamic> image;
  final List<dynamic> tag;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map,
      {this.reference}) // 생성자 리다이렉팅 : 특정 생성자에게 처리를 위임할 수 있음
      : assert(map['title'] != null),
        title = map['title'],
        text = map['text'],
        image = map['image'],
        tag = map['tag'],
        user = map['user'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}