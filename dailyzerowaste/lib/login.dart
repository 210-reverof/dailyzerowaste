import 'package:dailyzerowaste/mypage.dart';
import 'package:dailyzerowaste/question.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyzerowaste/model/user.dart';

import 'bottomBar.dart';

final GoogleSignIn googleSignIn = new GoogleSignIn();
// variable for firestore collection 'users'
final userReference =
    FirebaseFirestore.instance.collection('users'); // 사용자 정보 저장을 위한 ref
final Reference storageReference =
    FirebaseStorage.instance.ref().child('Posts Pictures');
final postsReference =
    FirebaseFirestore.instance.collection('posts'); // 게시글 정보 저장을 위한 ref

final DateTime timestamp = DateTime.now();
User currentUser;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _login();
  }
}

class _login extends State<LoginPage> {
  bool isSignedIn = false;
  // 페이지 컨트롤
  PageController pageController;
  int getPageIndex = 0;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
    pageController = PageController();

    // 앱 실행시 구글 사용자의 변경여부를 확인함
    googleSignIn.onCurrentUserChanged.listen((gSignInAccount) {
      controlSignIn(gSignInAccount); // 사용자가 있다면 로그인
    }, onError: (gError) {
      print("Error Message : " + gError);
    });

    googleSignIn.signInSilently();
  }

  // 로그인 상태 여부에 따라 isSignedIn flag값을 변경해줌
  controlSignIn(GoogleSignInAccount signInAccount) async {
    if (signInAccount != null) {
      await saveUserInfoToFirestore();
      setState(() {
        isSignedIn = true;
      });
    } else {
      setState(() {
        isSignedIn = false;
      });
    }
  }

  saveUserInfoToFirestore() async {
    // 현재 구글 로그인된 사용자 정보 가져오기
    final GoogleSignInAccount gCurrentUser = googleSignIn.currentUser;
    // 해당 유저의 db정보 가져오기
    DocumentSnapshot documentSnapshot =
        await userReference.doc(gCurrentUser.id).get();

    // 해당 유저의 db정보가 없다면
    if (!documentSnapshot.exists) {
      // 유저정보를 셋팅하는 페이지로 이동
      final username = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => QuestionPage()));

      // 유저정보 셋팅된 값으로 db에 set
      userReference.doc(gCurrentUser.id).set({
        'id': gCurrentUser.id,
        'profileName': gCurrentUser.displayName,
        'username': username.nickname,
        'url': gCurrentUser.photoUrl,
        'email': gCurrentUser.email,
        'bio': '',
        'image': gCurrentUser.photoUrl,
        'step': username.step,
        'timestamp': timestamp,
      });

      // 해당 정보 다시 가져오기
      documentSnapshot = await userReference.doc(gCurrentUser.id).get();
    }

    // 현재 유저정보에 값 셋팅하기
    currentUser = User.fromDocument(documentSnapshot);
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  loginUser() {
    googleSignIn.signIn();
  }

  logoutUser() {
    googleSignIn.signOut();
  }

  buildHomeScreen() {
    return BottomBar();
  }

  buildSignInScreen() {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'image/default_logo.png',
                width: 270,
                height: 270,
              ),
              SizedBox(height: 93),
              Container(
                width: 271,
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
                          'Sign up with Google',
                          style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 25,
                              color: Color(0xff4f4b49)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  onTap: loginUser,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isSignedIn) {
      return buildHomeScreen();
    } else {
      return buildSignInScreen();
    }
  }
}
