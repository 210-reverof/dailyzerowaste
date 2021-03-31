import 'dart:io';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:media_scanner_scan_file/media_scanner_scan_file.dart';
import 'check_permission.dart';
import '../users/login.dart';

import 'package:image_picker/image_picker.dart';
import 'package:social_share/social_share.dart';

class TextOverImage extends StatefulWidget {
  @override
  _TextOverImage createState() => _TextOverImage();
}

class _TextOverImage extends State<TextOverImage> {
  var globalKey = new GlobalKey(); // 위젯 캡쳐를 위한 globalkey
  final DateTime timestamp = DateTime.now();

  var scanfile;

  //테스트 추가
  File file;
  var pickedFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 64,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 36),
                InkWell(
                  child: Container(
                    width: 26,
                    child: Image.asset('image/source_direction.png'),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 41),
            // 캡쳐 바운더리 잡기
            RepaintBoundary(
              key: globalKey,
              child: Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 300,
                        height: 300,
                      ),
                      // 이미지 부분
                      FutureBuilder(
                          future: getImage(),
                          builder: (BuildContext context, AsyncSnapshot image) {
                            if (image.hasData) {
                              return image.data; // image is ready
                            } else {
                              return new Container(); // placeholder
                            }
                          }),
                      HomePage() // 글자 표시
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 74),
            InkWell(
              child: Container(
                width: 271,
                height: 55,
                decoration: customBox(),
                child: Center(
                  child: Text(
                    "Add decotter",
                    style: TextStyle(
                      fontFamily: 'Quick-Pencil',
                      color: Color(0xff4f4b49),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              onTap: _capture,
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                width: 271,
                height: 55,
                decoration: customBox(),
                child: Center(
                  child: Text(
                    "Share",
                    style: TextStyle(
                      fontFamily: 'Quick-Pencil',
                      color: Color(0xff4f4b49),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              onTap: () {
                // social_share => 고른 위의 파일의 경로를 가지고 story에 업로드한다.
                SocialShare.shareInstagramStory(pickedFile.path, "#ffffff",
                        "#000000", "https://deep-link-url")
                    .then((data) {
                  print(data);
                });

                saveInfoToFirestore(context);
                updatepractice(context);

                // 다시 step페이지로 이동
                Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
          ],
        ),
      ),
    );
  }

  saveInfoToFirestore(BuildContext context) async {
    final userReference = FirebaseFirestore.instance.collection('SocialShare');

    // 작성글 셋팅된 값으로 db에 set
    userReference.doc().set({
      'cnt': currentUser.cntCheck,
      'userName': currentUser.username,
      'userId': currentUser.id,
      'timestamp': timestamp,
    });
  }

  updatepractice(BuildContext context) async {
    final userReference = FirebaseFirestore.instance.collection('users');

    print('cnt' + currentUser.cntCheck.toString());

    // currentUser.cntShare += 1;

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

  customBox() {
    return BoxDecoration(
      color: Color(0xFFFFFFFF).withOpacity(0.0),
      image: new DecorationImage(
        image: new AssetImage("image/source_bar_button.png"),
        fit: BoxFit.fill,
      ),
    );
  }

  void _capture() async {
    bool status = await checkPermission(); // 권한 check 및 팝업

    print("START CAPTURE");
    var renderObject = globalKey.currentContext.findRenderObject();
    if (renderObject is RenderRepaintBoundary) {
      var boundary = renderObject;
      ui.Image image = await boundary.toImage();
      // final directory = (await getExternalStorageDirectory()).path;
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      // print(pngBytes);
      // print(directory);

      // file path + file name 로 파일 객체 생성
      //File imgFile = new File('$directory/screenshot.png');
      File imgFile = new File('/storage/emulated/0/Download/screenshot.png');
      imgFile.writeAsBytes(pngBytes); // png 파일 저장
      _scanFile(imgFile); // media scan
      file = imgFile;
      print("FINISH CAPTURE ${imgFile.path}");
    } else {
      print("!");
    }
  }

  // Future<Image> _loadImage() async {

  //   file = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   _stickerImage = new Image.file(file);

  //   return _stickerImage;
  // }

  Future getImage() async {
    pickedFile = await picker.getImage(source: ImageSource.gallery);

    file = File(pickedFile.path);
    final img = new Image.file(file);
    return img;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                offset = Offset(
                    offset.dx + details.delta.dx, offset.dy + details.delta.dy);
              });
            },
            child: SizedBox(
              width: 200,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Image.asset("image/decotter.png")),
              ),
            )),
      ),
    );
  }
}

Future<String> _scanFile(File f) async {
  final result = await MediaScannerScanFile.scanFile(f.path);
  return result['filePath'];
}
