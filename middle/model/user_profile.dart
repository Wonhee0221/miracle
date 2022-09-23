

import 'package:carbon_fp/model/User_data.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  final List<Users> titles;

  ProfileCard({required this.titles});

  _ProfileCardState createState() => _ProfileCardState();
}

class User_inpo{

}


class _ProfileCardState extends State<ProfileCard> {
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
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                //좌우로 스크롤 할수 있게해줌, 위아래는 vertical
                children: makeCircleImages(context, titles)),
          ),
        ],
      ),
    );
  }



  List<Widget> makeCircleImages(BuildContext context, List<Users> titles) {
    List<Widget> results = [];
    for (var i = 0; i < titles.length; i++) {
      results.add(
        Column(
          children: [
            InkWell(
              onTap: () {},
              child: Row(children: [
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(titles[i].profile),
                      radius: 38,
                    ),
                  ),
                ),
                Container(
                    child: Column(
                  children: [
                    Container(child: Text(titles[i].name)),
                    Container(child: Text(titles[i].carbonData.toString()))
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
