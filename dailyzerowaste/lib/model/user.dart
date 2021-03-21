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

  User({
    this.id, 
    this.profileName,
    this.username,
    this.url,
    this.email,
    this.bio,
    this.image,
    this.step
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
      step: getDocs["step"]
    );
  }


 User.fakesetting(String s, String t) {
    this.id = s;
    this.image = t;
  }
}