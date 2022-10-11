import 'package:carbon_fp/model/authentication.dart';
import 'package:carbon_fp/screen/home_screen3.dart';
import 'package:carbon_fp/screen/more_screen.dart';
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
      home: LoginPage()
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
              MoreScreen(),
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
    var _duration = new Duration(seconds: 2);
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

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _userId;
  String _message = '';
  late Authentication auth;

  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  void initState() {
    auth = Authentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('로그인'),
          backgroundColor: Colors.amber,centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 30,color: Colors.brown) ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                emailInput(),
                passwordInput(),
                loginButton(),
                registerButton(),
                resultMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailInput() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: TextFormField(
        controller: txtEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(hintText: 'email', icon: Icon(Icons.mail), iconColor:Colors.amber),
      ),
    );
  }

  Widget passwordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: TextFormField(
        obscureText: true,
        controller: txtPassword,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: 'password',
            icon: Icon(Icons.enhanced_encryption)),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom( 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                fixedSize: Size(300, 100)),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
            child: Text('로그인'),
          ),
        )
    );
  }

  Widget logoutButton() {
    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              fixedSize: Size(300, 100),
            ),
            child: Text('로그아웃'),
            onPressed: logout,
          ),
        )
    );
  }

  Widget registerButton() {
    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
                fixedSize: Size(300, 100)),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
            },
            child: Text('회원가입을 안하셨나요? 회원가입하러가기',style: TextStyle(color: Colors.black, decoration: TextDecoration.underline)),
          ),
        )
    );
  }

  Future submit() async {
    try {
      _userId = (await auth.signUP(txtEmail.text, txtPassword.text))!;
    } catch(e) {
      setState(() {
        _message = e.toString();
      });
    }
    setState(() {
      _message = '${_userId} 로그인 성공';
    });
  }

  Future logout() async {
    try {
      await auth.singOut();
      setState(() {
        _message = '${_userId} 로그아웃 성공';
      });
    } catch(e) {
      setState(() {
        _message = e.toString();
      });
    }
  }

  Widget resultMessage() {
    return Text(_message, style: TextStyle(fontSize: 14, color: Colors.red,
        fontWeight: FontWeight.bold));
  }
}

