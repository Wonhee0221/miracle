import 'package:carbon_fp/screen/home_screen3.dart';

import 'package:carbon_fp/screen/register_page.dart';
import 'package:carbon_fp/widget/Todo.dart';
import 'package:carbon_fp/widget/bottom_bar.dart';
import 'package:carbon_fp/widget/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fp/screen/ranking_page.dart';
import 'dart:async';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey:  "AIzaSyDdgbtUw-u3NN1n5AA6aEHUYwiAaRjbS-g",
      appId: "1:663744097065:android:307f8193efb9974fc4a538",
      messagingSenderId: "663744097065",
      projectId: "miracle-e2e5b",
      storageBucket: "miracle-e2e5b.appspot.com"
    ),
  );
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      SplashScreen()
  ));
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       //debug 배너 제외
      title: '탄소일기장',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
      ),
      home:
      DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              TodoListPage(),
              RankScreen(),
              MainPage(),
              RegisterPage(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

//위젯
  @override //오버라이드
  Widget build(BuildContext context) {
    //위젯을 반환하는 빌드함수
    return Scaffold(
        body: Center(child: new Image.asset('assets/loadingP.jpg')));
    // //기본 레이아웃
    // resizeToAvoidBottomInset: false,
    // backgroundColor: Color(0xFF6e6053), //배경색 #6e6053
    // body: SingleChildScrollView(
    //   child: Column(
    //     //세로 정렬
    //     mainAxisAlignment: MainAxisAlignment.center, //중앙에 배치
    //     children: [
    //       //자식 위젯
    //       Image.asset(
    //         //이미지
    //         'assets/miracle.jpeg', //이미지 경로
    //       ),
    //       CircularProgressIndicator(
    //         //로딩 위젯
    //         color: Colors.white, //로딩 위젯 색상
    //       )
    //     ],
    //   ),
    // ));
  }

  void navigationPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SplashScreen()));
  }

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyApp())));
  }

  Widget Build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Image.asset('assets/loadingP.jpg'),
      ),
    );
  }
}