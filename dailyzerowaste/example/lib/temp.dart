import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _temp();
  }
}

class _temp extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    // 배경 이미지
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Container(
          child: Image(
            image: AssetImage("image/default_bg.png"),
          ),
        ),
      ),
    );
  }
}
