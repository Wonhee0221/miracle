import 'package:carbon_fp/model/User_data.dart';
import 'package:flutter/material.dart';

class Ranker_User extends StatefulWidget {
  final List<Users> titles;

  Ranker_User({required this.titles});

  _Ranker_UserState createState() => _Ranker_UserState();
}

class User_inpo {}

class _Ranker_UserState extends State<Ranker_User> {
  late List<Users> titles;
  late List<String> names;
  late List<Widget> images;
  late List<int> carbonDate;

  get onPageChanged => null;

  @override
  void initState() {
    super.initState();
    titles = widget.titles;
    names = titles.map((m) => m.name).toList();
    images = titles.map((m) => Image.network(m.profile)).toList();
    carbonDate = titles.map((m) => m.carbonData).cast<int>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              height: 150,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: mostrankList(context, titles))),
        ],
      ),
    );
  }

  List<Widget> mostrankList(BuildContext context, List<Users> titles) {
    List<Widget> rankresults = [];
    for (var i = 0; i < 3; i++) {
      rankresults.add(Container(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5),
            child: CircleAvatar(
                radius: 30, backgroundImage: NetworkImage(titles[i].profile)),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '닉네임 : ' + titles[i].name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              (i + 1).toString() + '위',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: 70,
            height: 5,
            color: Colors.amber,
          ),
        ],
      )));
    }
    return rankresults;
  }
}
