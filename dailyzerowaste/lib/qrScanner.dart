import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner; //qrscan 패키지를 scanner 별칭으로 사용.

import 'checkPermission.dart';
import 'stepHome.dart';

class _QRScanner extends State<StepHomePage> {
  String _marketID = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  //비동기 함수
  Future _scan() async {
    // 되긴 됐는데 비동기 프로그래밍을 좀 더 공부해봐야할 듯
    bool status = await checkPermission();

    //스캔 시작 - 이때 스캔 될때까지 blocking
    String barcode = await scanner.scan();
    //스캔 완료하면 _output 에 문자열 저장하면서 상태 변경 요청.
    setState(() {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + _marketID); // debug only
      _marketID = barcode;
    });
  }
}
