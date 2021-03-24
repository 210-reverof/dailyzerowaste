import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String title;
  final String text;
  final String userId;
  final String userName;
  final String image;
  final List<dynamic> selectedTags;
  final List<dynamic> selectedTargets;
  final DocumentReference reference;

  Record({
    this.image,
    this.reference,
    this.selectedTags,
    this.text,
    this.title,
    this.selectedTargets,
    this.userId,
    this.userName,
  });

  Record.fromMap(Map<String, dynamic> map,
      {this.reference}) // 생성자 리다이렉팅 : 특정 생성자에게 처리를 위임할 수 있음
      : assert(map['title'] != null),
        title = map['title'],
        text = map['text'],
        image = map['image'],
        selectedTags = map['selectedTags'],
        selectedTargets = map['selectedTargets'],
        userId = map['userId'],
        userName = map['userName'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
