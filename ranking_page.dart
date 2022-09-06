// more_screen.dart
import 'package:carbon_fp/model/user.dart';
import 'package:carbon_fp/model/user_profile.dart';
import 'package:carbon_fp/screen/home_screen.dart';
import 'package:flutter/material.dart';

int name(n) {
  if (n == true);
  return n;
}

class RankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:TopBar(),
        body: Column(
            children:[Column(
              children: [Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Rank_user2(), Rank_user1(), Rank_user3()]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Text("랭킹"),
                      const SizedBox(width: 6),
                      Text("${friends.length}"),
                    ],
                  ),
                ), Container(
                    child: Container(height: 286,
                      child:
                      Row(
                        children: [
                          Expanded(
                              child: ListView(
                                  children: List.generate(
                                    friends.length,
                                        (index) => ProfileCard(user: friends[index]),
                                  )
                              )),
                        ],
                      ),
                    ))],
            )
            ]
        ));
  }
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
                radius: 50,
                backgroundImage: AssetImage('/dog.jpg')
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '한원희',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
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
            width: 140,
            height: 5,
            color: Colors.red,
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
            padding: EdgeInsets.only(top: 25),
            child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('/koo.jpg')
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              '구승회',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              '2위',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: 140,
            height: 5,
            color: Colors.red,
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
            padding: EdgeInsets.only(top: 30),
            child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('/Lee.png')
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              '이아현',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              '3위',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: 140,
            height: 5,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}


