import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dailyzerowaste/model/user.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../users/login.dart';

class DIYUploadPage extends StatefulWidget {
  DIYUploadPage(User currentUser);

  @override
  State<StatefulWidget> createState() {
    return _diyUpload();
  }
}

class _diyUpload extends State<DIYUploadPage> {
  String image;
  String title;
  String text;
  File _imageFile;
  final DateTime timestamp = DateTime.now();

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          //만약 바탕을 터치하면 포커스 제거하기 (키보드 내려가도록)
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: Container(
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // header
                    SizedBox(height: 64),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 36),
                        Container(
                          width: 26,
                          child: InkWell(
                            child: Image.asset('image/source_direction.png'),
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 13),

                    Stack(
                      children: <Widget>[
                        Container(
                          width: 310,
                          height: 310,
                          margin: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: _imageFile != null
                                ? Image.file(_imageFile)
                                : FlatButton(
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.blue,
                                      size: 50,
                                    ),
                                    onPressed: pickImage,
                                  ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    //작성 글 제목
                    Container(
                        width: 310,
                        child: TextField(
                          onChanged: (val) {
                            //텍스트폼필드에 변화가 있을 때마다
                            setState(() {
                              title = val; //검색텍스트 갱신
                            });
                          },
                          maxLength: 20,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              hintText: 'Title',
                              hintStyle: TextStyle(color: Color(0xff5c5b5a))),
                        )),

                    SizedBox(height: 5),

                    //본문 글 작성
                    Container(
                        width: 310,
                        child: TextField(
                            onChanged: (val) {
                              //텍스트폼필드에 변화가 있을 때마다
                              setState(() {
                                text = val; //검색텍스트 갱신
                              });
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            maxLength: 500,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Contents',
                              hintStyle: TextStyle(color: Color(0xff5c5b5a)),
                            ))),

                    // Complete Button
                    Container(
                      width: 271,
                      padding: EdgeInsets.only(top: 48, bottom: 110),
                      child: InkWell(
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'image/source_bar.png',
                                width: 271,
                                height: 55,
                              ),
                            ),
                            Center(
                              heightFactor: 2.7,
                              child: Text(
                                'Complete',
                                style: TextStyle(
                                    fontFamily: 'Quick-Pencil',
                                    fontSize: 25,
                                    color: Color(0xff4f4b49)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          uploadImageToFirebase(context);
                          updatepractice(context);

                          Navigator.popUntil(context,
                              ModalRoute.withName(Navigator.defaultRouteName));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updatepractice(BuildContext context) async {
    final userReference = FirebaseFirestore.instance.collection('users');

    currentUser.cntDIY += 1;

    // 체크박스 셋팅된 값으로 db에 set
    userReference.doc(currentUser.id).set({
      'id': currentUser.id,
      'profileName': currentUser.profileName,
      'username': currentUser.username,
      'cntDIY': currentUser.cntDIY,
      'cntVisitShop': currentUser.cntVisitShop,
      'cntCheck': currentUser.cntCheck,
      'cntShare': currentUser.cntShare,
      'url': currentUser.url,
      'email': currentUser.email,
      'bio': '',
      'image': currentUser.image,
      'step': currentUser.step,
      'timestamp': currentUser.timestamp,
    });
  }

  selectTitle(str) {
    return Container(
        child: Text(str,
            style: TextStyle(
                fontFamily: 'Quick-Pencil',
                fontSize: 30,
                color: Color(0xff4f4b49))),
        padding: EdgeInsets.only(left: 52.82));
  }

  customBoxDecoration(isActive) {
    return BoxDecoration(
      image: isActive
          ? DecorationImage(
              image: AssetImage("image/select_background.png"),
              fit: BoxFit.fill)
          : null,
      boxShadow: isActive
          ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 0.5,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ]
          : null,
      color: isActive ? Color(0x00000000) : Colors.white,
      border: Border(
          left: BorderSide(color: Colors.black12, width: 1.0),
          bottom: BorderSide(color: Colors.black12, width: 1.0),
          top: BorderSide(color: Colors.black12, width: 1.0),
          right: BorderSide(color: Colors.black12, width: 1.0)),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
  }

  changeState(item) {
    setState(() {
      item['isActive'] = !item['isActive'];
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => {image = value, saveInfoToFirestore(context)},
        );
  }

  saveInfoToFirestore(BuildContext context) async {
    final userReference = FirebaseFirestore.instance.collection('DIY');

    // 작성글 셋팅된 값으로 db에 set
    userReference.doc().set({
      'cnt': currentUser.cntDIY,
      'userImage': currentUser.image,
      'userName': currentUser.username,
      'userId': currentUser.id,
      'title': title,
      'text': text,
      'image': image,
      'timestamp': timestamp,
    });
  }
}
