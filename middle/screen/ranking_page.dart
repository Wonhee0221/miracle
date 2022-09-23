// more_screen.dart
import 'package:carbon_fp/model/User_data.dart';
import 'package:carbon_fp/screen/home_screen3.dart';
import 'package:carbon_fp/widget/user_rank.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RankScreen extends StatefulWidget {
  _RankScreenState createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('User').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('User').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data!.docs);
      },
    );
  }


  Widget _buildBody(BuildContext context,
      List<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    List<Users> titles = snapshot.map((d) => Users.fromSnapshot(d)).toList();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TopBar(),
        body: Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Rank_user1(),
              Rank_user2(),
              Rank_user3()]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Text("이번달 랭킹",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(width: 10),
              Text('${titles.length - 3}',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
        UserRank(titles: titles),
    Container(child: Text('내 순위'),alignment:Alignment.centerLeft,padding: EdgeInsets.fromLTRB(10,10,0,0), ),

        Row(children: [
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(('1').toString() + '위',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16))),
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/dog.jpg'),
                radius: 20,
              ),
            ),
          ),
          Container(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                      child: Text('닉네임 : 강아지발자국' ,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12))),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 8),
                      child:
                      Text('사용탄소량 : 140',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)))
                ],
              ))
        ],
        )]));
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

List<Widget>mostrankList(BuildContext context, List<Users> titles){
  List<Widget> rankresults = [];
  for (var i = 0; i < 3; i++) {
    rankresults.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5),
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(titles[i].profile)),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('닉네임 : ' + titles[i].name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text((i + 1).toString() + '위',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: 100,
              height: 5,
              color: Colors.amber,
            ),
          ],
        )
    );
  }
  return rankresults;

}

class Rank_user1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5),
            child: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('assets/dog.jpg')),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '강아지발자국',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              '1위',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: 100,
            height: 5,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}

class Rank_user2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5),
            child: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('assets/koo.jpg')),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '말 발자국',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '2위',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: 100,
            height: 5,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}

class Rank_user3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            child: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('assets/Lee.png')),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '곰 발자국',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 18),
            child: Text(
              '3위',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: 100,
            height: 5,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
