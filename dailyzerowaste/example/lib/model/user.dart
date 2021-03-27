import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String profileName;
  String username;
  String url;
  String email;
  String bio;
  String image;
  String step;
  Timestamp timestamp;
  int cntDIY;
  int cntVisitShop;
  int cntCheck;
  int cntShare;

  User({
    this.id,
    this.profileName,
    this.username,
    this.url,
    this.email,
    this.bio,
    this.image,
    this.step,
    this.timestamp,
    this.cntDIY,
    this.cntVisitShop,
    this.cntCheck,
    this.cntShare,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    Map getDocs = doc.data();
    return User(
        id: doc.id,
        email: getDocs["email"],
        username: getDocs["username"],
        url: getDocs["url"],
        profileName: getDocs["profileName"],
        bio: getDocs["bio"],
        image: getDocs["image"],
        step: getDocs["step"],
        timestamp: getDocs["timestamp"],
        cntDIY: getDocs["cntDIY"],
        cntVisitShop: getDocs["cntVisitShop"],
        cntCheck: getDocs["cntCheck"],
        cntShare: getDocs["cntShare"],

    );
  }

  User.fakesetting(String s, String t) {
    this.id = s;
    this.image = t;
  }
}
