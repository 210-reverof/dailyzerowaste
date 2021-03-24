import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class Record {
  String title;
  String text;
  String userId;
  String userName;
  String image;
  List<dynamic> selectedTags;
  List<dynamic> selectedTargets;
  DocumentReference reference;

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

  factory Record.fromDocumnet(DocumentSnapshot doc) {
    Map getDocs = doc.data();
    return Record(
      image: getDocs["image"],
      reference: getDocs["reference"],
      userId: getDocs["userId"],
      userName: getDocs["userId"],
      title: getDocs["title"],
      text: getDocs["text"],
      selectedTags: getDocs["selectedTags"],
      selectedTargets: getDocs["selectedTargets"],
    );
  }
}
