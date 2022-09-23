import 'package:carbon_fp/model/User_data.dart';
import 'package:flutter/material.dart';

class UserRank extends StatefulWidget {
  final List<Users> titles;

  UserRank({required this.titles});

  _UserRankState createState() => _UserRankState();
}

class _UserRankState extends State<UserRank> {
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
      height: 250,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          //좌우로 스크롤 할수 있게해줌, 위아래는 vertical
          children: rankList(context, titles)),
    );
  }



    List<Widget> rankList(BuildContext context, List<Users> titles) {
      List<Widget> results = [];
      for (var i = 3; i < titles.length; i++) {
        results.add(
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Row(children: [
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text((i + 1).toString() + '위',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(titles[i].profile),
                        radius: 20,
                      ),
                    ),
                  ),
                  Container(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                              child: Text('닉네임 : ' + titles[i].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 8),
                              child:
                              Text('사용탄소량 : ' + titles[i].carbonData.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)))
                        ],
                      ))
                ]),
              ),
            ],
          ),
        );
      }
      return results;
    }
  }
