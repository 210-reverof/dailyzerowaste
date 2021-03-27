import 'dart:io';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:media_scanner_scan_file/media_scanner_scan_file.dart';
import 'check_permission.dart';

import 'package:image_picker/image_picker.dart';
import 'package:social_share/social_share.dart';

class TextOverImage extends StatefulWidget {
  @override
  _TextOverImage createState() => _TextOverImage();
}

class _TextOverImage extends State<TextOverImage> {
  var globalKey = new GlobalKey(); // 위젯 캡쳐를 위한 globalkey

  var scanfile;

  //테스트 추가
  File file;
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
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 26,
                  child: InkWell(
                    child: Image.asset('image/source_direction.png'),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
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
            Container(
              width: 271,
              height: 55,
              decoration: customBox(),
              child: Center(
                child: InkWell(
                  onTap: _capture,
                  child: Text("Save"),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 271,
              height: 55,
              decoration: customBox(),
              child: Center(
                child: InkWell(
                  onTap: () {
                    // social_share => 고른 위의 파일의 경로를 가지고 story에 업로드한다.
                    SocialShare.shareInstagramStory(file.path, "#ffffff",
                            "#000000", "https://deep-link-url")
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

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
              width: 300,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Zero Hero",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: Colors.black)),
                ),
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
