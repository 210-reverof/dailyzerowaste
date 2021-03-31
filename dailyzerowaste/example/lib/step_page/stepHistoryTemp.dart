// import 'package:dailyzerowaste/stepHandler.dart';
// import 'package:flutter/material.dart';

// import 'package:dailyzerowaste/model/user.dart';

// import 'login.dart';
// import 'mypage.dart';
// import 'practicecheck.dart';
// import 'search.dart';
// import 'stepHome.dart';
// import 'temp.dart';
// import 'zeroWasteShop.dart';

// class StepHistoryPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _stepHistory();
//   }
// }

// class _stepHistory extends State<StepHistoryPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         // DIY Container
//         Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.only(left: 36),
//                 child: Text(
//                   'DIY',
//                   style: TextStyle(
//                     fontFamily: 'Quick-Pencil',
//                     fontSize: 33,
//                     color: Color(0xff4f4b49),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 29.5, right: 36),
//                 padding: EdgeInsets.only(top: 22, bottom: 28.7),
//                 child: Column(
//                   children: <Widget>[
//                     // 칭호 윗줄
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // 칭호 아랫줄
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // 구분선
//         Container(
//           width: 342.94,
//           child: Image.asset('image/source_bar_2.png'),
//         ),

//         // Visit zerowaste shop Container
//         Container(
//           padding: EdgeInsets.only(top: 28.7),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.only(left: 36),
//                 child: Text(
//                   'Visit zerowaste shop',
//                   style: TextStyle(
//                     fontFamily: 'Quick-Pencil',
//                     fontSize: 33,
//                     color: Color(0xff4f4b49),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 29.5, right: 36),
//                 padding: EdgeInsets.only(top: 22, bottom: 28.7),
//                 child: Column(
//                   children: <Widget>[
//                     // 칭호 윗줄
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // 칭호 아랫줄
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // 구분선
//         Container(
//           width: 342.94,
//           child: Image.asset('image/source_bar_2.png'),
//         ),

//         // Check practice Container
//         Container(
//           padding: EdgeInsets.only(top: 28.7),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.only(left: 36),
//                 child: Text(
//                   'Check practice',
//                   style: TextStyle(
//                     fontFamily: 'Quick-Pencil',
//                     fontSize: 33,
//                     color: Color(0xff4f4b49),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 29.5, right: 36),
//                 padding: EdgeInsets.only(top: 22, bottom: 28.7),
//                 child: Column(
//                   children: <Widget>[
//                     // 칭호 윗줄
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // 칭호 아랫줄
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // 구분선
//         Container(
//           width: 342.94,
//           child: Image.asset('image/source_bar_2.png'),
//         ),

//         // Share hashtags Container
//         Container(
//           padding: EdgeInsets.only(top: 28.7),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.only(left: 36),
//                 child: Text(
//                   'Share hashtags',
//                   style: TextStyle(
//                     fontFamily: 'Quick-Pencil',
//                     fontSize: 33,
//                     color: Color(0xff4f4b49),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 29.5, right: 36),
//                 padding: EdgeInsets.only(top: 22, bottom: 28.7),
//                 child: Column(
//                   children: <Widget>[
//                     // 칭호 윗줄
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // 칭호 아랫줄
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // 개별 칭호 요소
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Container(
//                                   width: 86,
//                                   height: 86,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'image/tier/check_beginner.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '2020.03.11',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   '1st DIY',
//                                   style: TextStyle(
//                                     fontFamily: 'Quick-Pencil',
//                                     fontSize: 22,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
