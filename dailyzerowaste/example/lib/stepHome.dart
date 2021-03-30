import 'package:dailyzerowaste/PopUpDialog/DIYDialog.dart';
import 'package:dailyzerowaste/login.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'PopUpDialog/checkPracticeDialog.dart';
import 'PopUpDialog/shareHashtagsDialog.dart';
import 'PopUpDialog/zeroWasteShopDialog.dart';

class StepHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _step();
  }
}

int percent;
int practices;

class _step extends State<StepHomePage> {
  int calcPercentage() {
    List per = [0, 0, 0, 0];
    if (currentUser.step == "beginner") {
      per[0] = 25;
      per[1] = (currentUser.cntVisitShop / 5) > 1
          ? 25
          : (currentUser.cntVisitShop / 5) * 25;
      per[2] = (currentUser.cntCheck / 20) > 1
          ? 25
          : (currentUser.cntCheck / 20) * 25;
      per[3] = (currentUser.cntShare / 15) > 1
          ? 25
          : (currentUser.cntShare / 20) * 25;
    } else if (currentUser.step == "intermediate") {
      per[0] = currentUser.cntVisitShop > 1 ? 25 : 0;
      per[1] = ((currentUser.cntVisitShop - 5) / 5) > 1
          ? 25
          : ((currentUser.cntVisitShop - 5) / 5) * 25;
      per[2] = ((currentUser.cntCheck - 20) / 20) > 1
          ? 25
          : ((currentUser.cntCheck - 20) / 20) * 25;
      per[3] = ((currentUser.cntShare - 15) / 15) > 1
          ? 25
          : ((currentUser.cntShare - 15) / 20) * 25;
    } else if (currentUser.step == "expert") {
      per[0] = ((currentUser.cntVisitShop - 1) / 1) > 1
          ? 25
          : ((currentUser.cntVisitShop - 1) / 1) * 25;
      per[1] = ((currentUser.cntVisitShop - 10) / 5) > 1
          ? 25
          : ((currentUser.cntVisitShop - 5) / 5) * 25;
      per[2] = ((currentUser.cntCheck - 40) / 20) > 1
          ? 25
          : ((currentUser.cntCheck - 20) / 20) * 25;
      per[3] = ((currentUser.cntShare - 30) / 15) > 1
          ? 25
          : ((currentUser.cntShare - 15) / 20) * 25;
    }

    double sum = 0;

    for (int i = 0; i < 4; i++) {
      sum += per[i];
    }

    int calc_ranks(ranks) {
      double multiplier = .5;
      return (multiplier * ranks).round();
    }

    return calc_ranks(sum);
  }

  @override
  Widget build(BuildContext context) {
    percent = calcPercentage();
    practices = currentUser.cntShare +
        currentUser.cntVisitShop +
        currentUser.cntDIY +
        currentUser.cntCheck;

    return Column(
      children: <Widget>[
        YourStepTitle(), // title

        //YourStepInfo(), // step info
        Container(
          padding: EdgeInsets.only(left: 59, right: 59),
          child: Row(
            children: <Widget>[
              // 여기서 나무가 자라요
              Container(
                width: 176,
                height: 176,
                decoration: BoxDecoration(
                    image: currentUser.step == "beginner"
                        ? DecorationImage(
                            image: AssetImage('image/tree/tree_beginner.png'),
                          )
                        : currentUser.step == "intermediate"
                            ? DecorationImage(
                                image: AssetImage(
                                    'image/tree/tree_intermediate.png'),
                              )
                            : DecorationImage(
                                image:
                                    AssetImage('image/tree/tree_expert.png')),
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(width: 29),
              Column(
                children: <Widget>[
                  // 조화를 위해 위쪽 여백 삭제
                  //SizedBox(height: 81.48),

                  // 퍼센티지
                  Container(
                    padding: EdgeInsets.only(top: 6.5),
                    child: Text(
                      percent.toString() + "%",
                      style: TextStyle(
                        fontFamily: 'Quick-Pencil',
                        fontSize: 60,
                        color: Color(0xff4f4b49),
                      ),
                    ),
                  ),

                  // Practice Count
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          practices.toString(),
                          style: TextStyle(
                            fontFamily: 'Quick-Pencil',
                            fontSize: 25,
                            color: Color(0xff4f4b49),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'PRACTICES',
                          style: TextStyle(
                            fontFamily: 'Quick-Pencil',
                            fontSize: 25,
                            color: Color(0xff4f4b49),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        //  YourTierStatus(), // tier status
        Container(
          padding: EdgeInsets.only(left: 33, right: 44, top: 34),
          child: Column(
            children: <Widget>[
              // 첫번째 칭호
              Container(
                padding: EdgeInsets.all(0), // padding initialize
                child: Row(
                  children: <Widget>[
                    // 칭호 사진
                    Container(
                      width: 106,
                      height: 106,
                      decoration: BoxDecoration(
                    image: currentUser.cntDIY >= 10
                        ? DecorationImage(
                            image: AssetImage('image/tier/DIY_expert.png'),
                          )
                        : currentUser.cntDIY >= 0
                            ? DecorationImage(
                                image: AssetImage(
                                    'image/tier/DIY_intermediate.png'),
                              )
                            : DecorationImage(
                                image:
                                    AssetImage('image/tier/DIY_beginner.png')),
                    borderRadius: BorderRadius.circular(100)),
                    ),

                    // 어떤 분야의 칭호인지
                    Container(
                      padding: EdgeInsets.only(left: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'DIY',
                            style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 20,
                              color: Color(0xff4f4b49),
                            ),
                          ),
                          SizedBox(height: 13),
                          Text(
                            currentUser.cntDIY.toString() + " PRACTICES",
                            style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 32,
                              color: Color(0xff4f4b49),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 31),

                    // TRY 버튼
                    InkWell(
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('image/try_button.png'),
                          ),
                          //border: Border.all(width: 1, color: Colors.black), // debug only
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onTap: () async {
                        await DIYPopUpHelper.confirm(context);
                        await Scaffold.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 2),
                            backgroundColor: Color(0xff4f4b49),
                            content: Text("Success")));
                        setState(() {
                          currentUser.step =
                              (percent == 100) && currentUser.step == "beginner"
                                  ? "intermediate"
                                  : currentUser.step;
                          currentUser.step = (percent == 100) &&
                                  currentUser.step == "intermediate"
                              ? "expert"
                              : currentUser.step;
                          percent = calcPercentage();
                          practices = currentUser.cntShare +
                              currentUser.cntVisitShop +
                              currentUser.cntDIY +
                              currentUser.cntCheck;
                          resetter();
                        });
                      },
                    ),
                  ],
                ),
              ),

              // 두번째 칭호
              Container(
                padding: EdgeInsets.all(0), // padding initialize
                child: Row(
                  children: <Widget>[
                    // 칭호 사진
                    Container(
                      width: 106,
                      height: 106,
                      decoration: BoxDecoration(
                    image: currentUser.cntVisitShop >= 16
                        ? DecorationImage(
                            image: AssetImage('image/tier/shop_expert.png'),
                          )
                        : currentUser.cntVisitShop >= 6
                            ? DecorationImage(
                                image: AssetImage(
                                    'image/tier/shop_intermediate.png'),
                              )
                            : DecorationImage(
                                image:
                                    AssetImage('image/tier/shop_beginner.png')),
                    borderRadius: BorderRadius.circular(100)),
                    ),

                    // 어떤 분야의 칭호인지
                    Container(
                      padding: EdgeInsets.only(left: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Visit zerowaste shop',
                            style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 20,
                              color: Color(0xff4f4b49),
                            ),
                          ),
                          SizedBox(height: 13),
                          Text(
                            currentUser.cntVisitShop.toString() + " PRACTICES",
                            style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 32,
                              color: Color(0xff4f4b49),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 33),

                    // TRY 버튼
                    InkWell(
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('image/try_button.png'),
                          ),
                          //border: Border.all(width: 1, color: Colors.black), // debug only
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onTap: () async {
                        await ZWSPopUpHelper.confirm(context);
                        await Scaffold.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 2),
                            backgroundColor: Color(0xff4f4b49),
                            content: Text("Success scanning QR Code")));
                        setState(() {
                          currentUser.step =
                              (percent == 100) && currentUser.step == "beginner"
                                  ? "intermediate"
                                  : currentUser.step;
                          currentUser.step = (percent == 100) &&
                                  currentUser.step == "intermediate"
                              ? "expert"
                              : currentUser.step;
                          percent = calcPercentage();
                          practices = currentUser.cntShare +
                              currentUser.cntVisitShop +
                              currentUser.cntDIY +
                              currentUser.cntCheck;

                          resetter();
                        });
                      },
                    ),
                  ],
                ),
              ),

              // 세번째 칭호
              Container(
                padding: EdgeInsets.all(0), // padding initialize
                child: Row(
                  children: <Widget>[
                    // 칭호 사진
                    Container(
                      width: 106,
                      height: 106,
                      decoration: BoxDecoration(
                    image: currentUser.cntCheck >= 41
                        ? DecorationImage(
                            image: AssetImage('image/tier/check_expert.png'),
                          )
                        : currentUser.cntCheck >= 21
                            ? DecorationImage(
                                image: AssetImage(
                                    'image/tier/check_intermediate.png'),
                              )
                            : DecorationImage(
                                image:
                                    AssetImage('image/tier/check_beginner.png')),
                    borderRadius: BorderRadius.circular(100)),
                    ),

                    // 어떤 분야의 칭호인지
                    Container(
                      padding: EdgeInsets.only(left: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Check practice',
                            style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 20,
                              color: Color(0xff4f4b49),
                            ),
                          ),
                          SizedBox(height: 13),
                          Text(
                            currentUser.cntCheck.toString() + " PRACTICES",
                            style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 32,
                              color: Color(0xff4f4b49),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 35),

                    // TRY 버튼
                    InkWell(
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('image/try_button.png'),
                          ),
                          //border: Border.all(width: 1, color: Colors.black), // debug only
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onTap: () async {
                        await CPPopUpHelper.confirm(context);
                        await Scaffold.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 2),
                            backgroundColor: Color(0xff4f4b49),
                            content: Text("Success")));
                        setState(() {
                          currentUser.step =
                              (percent == 100) && currentUser.step == "beginner"
                                  ? "intermediate"
                                  : currentUser.step;
                          currentUser.step = (percent == 100) &&
                                  currentUser.step == "intermediate"
                              ? "expert"
                              : currentUser.step;
                          percent = calcPercentage();
                          practices = currentUser.cntShare +
                              currentUser.cntVisitShop +
                              currentUser.cntDIY +
                              currentUser.cntCheck;
                          resetter();
                        });
                      },
                    ),
                  ],
                ),
              ),

              // 네번째 칭호
              Container(
                padding: EdgeInsets.all(0), // padding initialize
                child: Row(
                  children: <Widget>[
                    // 칭호 사진
                    Container(
                      width: 106,
                      height: 106,
                      decoration: BoxDecoration(
                    image: currentUser.cntShare >= 16
                        ? DecorationImage(
                            image: AssetImage('image/tier/shop_expert.png'),
                          )
                        : currentUser.cntShare >= 31
                            ? DecorationImage(
                                image: AssetImage(
                                    'image/tier/shop_intermediate.png'),
                              )
                            : DecorationImage(
                                image:
                                    AssetImage('image/tier/shop_beginner.png')),
                    borderRadius: BorderRadius.circular(100)),
                    ),

                    // 어떤 분야의 칭호인지
                    Container(
                      padding: EdgeInsets.only(left: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Share hashtags',
                            style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 20,
                              color: Color(0xff4f4b49),
                            ),
                          ),
                          SizedBox(height: 13),
                          Text(
                            currentUser.cntShare.toString() + " PRACTICES",
                            style: TextStyle(
                              fontFamily: 'Quick-Pencil',
                              fontSize: 32,
                              color: Color(0xff4f4b49),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 35),

                    // TRY 버튼
                    InkWell(
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('image/try_button.png'),
                          ),
                          //border: Border.all(width: 1, color: Colors.black), // debug only
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onTap: () async {
                        await SHPopUpHelper.confirm(context);
                        await Scaffold.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 2),
                            backgroundColor: Color(0xff4f4b49),
                            content: Text("Success")));
                        setState(() {
                          currentUser.step =
                              (percent == 100) && currentUser.step == "beginner"
                                  ? "intermediate"
                                  : currentUser.step;
                          currentUser.step = (percent == 100) &&
                                  currentUser.step == "intermediate"
                              ? "expert"
                              : currentUser.step;
                          percent = calcPercentage();
                          practices = currentUser.cntShare +
                              currentUser.cntVisitShop +
                              currentUser.cntDIY +
                              currentUser.cntCheck;
                          resetter();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// title
class YourStepTitle extends StatelessWidget {
  const YourStepTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              '6 may 2016 - 18 Aug 2016',
              style: TextStyle(
                fontFamily: 'Quick-Pencil',
                fontSize: 17,
                color: Color(0xff4f4b49),
              ),
            ),
            SizedBox(height: 6),
            Text(
              'YOUR STEP',
              style: TextStyle(
                fontFamily: 'Quick-Pencil',
                fontSize: 30,
                color: Color(0xff4f4b49),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
