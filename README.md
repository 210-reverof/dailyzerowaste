# Dailyzerowaste README

# #dailyzerowaste

<p align="center">
<img height="200" src="https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/Untitled.png">
</p>

<p align="center"><i>#Dailyzerowaste</i></p>

Proven by over 7.5 billion #zerowaste posts on Instagram, there has been a spike in interest in the zero waste trend recently, but the limits have been exposed accordingly. If an eco-friendly product did not reach its certain usage level, it could cause ‘the rebound effect’, negatively affecting the environment. In addition, it is difficult to get the will alone.

That is why we introduce to you **“Dailyzerowaste”**, a mobile application that shares zero-waste related information and encourages you to be a part of the zero-waste campaign.

# 🤔 Using Our App...


- Write stories about your zero-waste life
- Check your step when you enter the app.
- Filter out writings using step categories
- Achieve your goals and get an emblem.
- Share your zero-waste life photo with decotter to Instagram directly
- Visit a zero-waste shop and record via QR code
- Check your zero-waste life
- Grow your own tree in Step Page

<p align="center">
<img height="200" src="https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/trees.png">
</p>
<p align="center"><i>Grow your own tree 😌</i></p>


# ✔️ How to run "#dailyzerowaste"


you should have flutter, android studio(emulator) and Interlinked firebase

1. Clone this repository
2. Launch `Terminal` and move to Project Directory
3. Enter `flutter pub get`
4. Click `Run and Debug` button and Select `Dart & Flutter`
5. Wait building the app!

# ⚙ Project Structure

```
📦lib
 ┣ 📂DIY_page
 ┃ ┣ 📜DIYupload.dart
 ┃ ┗ 📜viewDIY.dart
 ┣ 📂etc
 ┃ ┣ 📜checkPermission.dart
 ┃ ┣ 📜contact.dart
 ┃ ┣ 📜generated_plugin_registrant.dart
 ┃ ┣ 📜pageTransition.dart
 ┃ ┣ 📜search.dart
 ┃ ┣ 📜temp.dart
 ┃ ┗ 📜versions.dart
 ┣ 📂feed_page
 ┃ ┣ 📜feedpage.dart
 ┃ ┣ 📜feedupload.dart
 ┃ ┗ 📜viewFeed.dart
 ┣ 📂model
 ┃ ┣ 📜check.dart
 ┃ ┣ 📜DIY.dart
 ┃ ┣ 📜record.dart
 ┃ ┣ 📜share.dart
 ┃ ┣ 📜store.dart
 ┃ ┣ 📜user.dart
 ┃ ┗ 📜visit.dart
 ┣ 📂PopUpDialog
 ┃ ┣ 📜checkPracticeDialog.dart
 ┃ ┣ 📜DIYDialog.dart
 ┃ ┣ 📜feedInfoDialog.dart
 ┃ ┣ 📜shareHashtagsDialog.dart
 ┃ ┣ 📜tagInfoDialog.dart
 ┃ ┗ 📜zeroWasteShopDialog.dart
 ┣ 📂share_page
 ┃ ┣ 📜check_permission.dart
 ┃ ┣ 📜image.dart
 ┃ ┗ 📜share.dart
 ┣ 📂step_page
 ┃ ┣ 📜practicecheck.dart
 ┃ ┣ 📜stepHandler.dart
 ┃ ┣ 📜stepHistory.dart
 ┃ ┣ 📜stepHistoryTemp.dart
 ┃ ┣ 📜stepHome.dart
 ┃ ┣ 📜stepInfo.dart
 ┃ ┣ 📜viewCheckPractice.dart
 ┃ ┗ 📜viewVisitShop.dart
 ┣ 📂users
 ┃ ┣ 📜login.dart
 ┃ ┣ 📜mypage.dart
 ┃ ┣ 📜profile.dart
 ┃ ┗ 📜question.dart
 ┣ 📂zerowasteshop_page
 ┃ ┣ 📜zeroWasteShop.dart
 ┃ ┗ 📜zeroWasteShopList.dart
 ┣ 📜bottomBar.dart
 ┗ 📜main.dart
```

# 📜 DB

| ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/DIY_censored.jpg) |
|:--:|
| DIY Firestore Database |

| ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/PracticeCheck_censored.jpg) |
|:--:|
| Practice Check Firestore Database |

| ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/SocialShare_censored.jpg) |
|:--:|
| Social Share Firestore Database |

| ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/VisitShop_censored.jpg) |
|:--:|
| Visit Shop Firestore Database |

| ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/Feed_censored.jpg) |
|:--:|
| Feed Firestore Database |

| ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/Stores_censored.jpg) |
|:--:|
| Stores Firestore Database |

| ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/Users_censored.jpg) |
|:--:|
| Users Firestore Database |


# 💻 Technical Stack


- Flutter 2.0
- Google Firebase
    - Authentication
    - Firestore
    - Storage
- Google Cloud Platform
    - Google Maps API

# 📱 App Preview
| ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/KakaoTalk_20210330_224949808.jpg) | ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/KakaoTalk_20210330_224949808_05.jpg) | ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/KakaoTalk_20210330_224949808_01.jpg) |
|-|-|-|
| ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/KakaoTalk_20210330_224949808_02.jpg) | ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/KakaoTalk_20210330_224949808_03.jpg) | ![image](https://github.com/DSCSCHZeroHero/dailyzerowaste/blob/main/readme_photo/KakaoTalk_20210330_224949808_04.jpg) |


# 🎞 Demo Video


[click here](https://youtu.be/y0WPw5xusFs) to see our demo video 😎

# 👨‍👨‍👧‍👦 Contributor


- 👩🏻‍💻 Jeongyoon Joo, [yoon913612@gmail.com](mailto:yoon913612@gmail.com)
- 👩🏻‍🎨 Minseo Kim, [ccd399761@gmail.com](mailto:ccd399761@gmail.com)
- 👩🏻‍💻 Wonyoung Lee, [sheltonwon@gmail.com](mailto:sheltonwon@gmail.com)
- 👨🏻‍💻 Namjoon Lee, [craft1933@gmail.com](mailto:craft1933@gmail.com)
