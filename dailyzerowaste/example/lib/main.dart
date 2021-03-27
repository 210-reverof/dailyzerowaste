import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
import 'package:dailyzerowaste/share_page/share.dart';

/*void main() {
  runApp(MyApp());
}*/

Future<void> main() async {
  // Dart에서는 비동기 작업 수행하기 위해 Future클래스와 async 및 await 키워드 사용
  WidgetsFlutterBinding.ensureInitialized(); // framework를 Flutter engine에 결합
  await Firebase.initializeApp(); // firebae 초기화
  runApp(MyApp()); //앱 실행
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '#dailyzerowaste',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0x00000ff0)),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: FakeLoginPage(), //나중에는 LoginPage()로 수정하고 login.dart 수정하기
        //child: Share(), //소셜 셰어 페이지
      ),
    );
  }
}
