import 'package:carbon_fp/model/User_data.dart';
import 'package:flutter/material.dart';

class UserRank extends StatelessWidget {
  const UserRank({Key? key,required this.titles}): super(key: key);
  final List<Users> titles;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               //좌우로 스크롤 할수 있게해줌, 위아래는 vertical
              children: makeCircleImages(context, titles),
            ),

    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Users> titles) {
  List<Widget> results = [];
  for (var i = 0; i < titles.length; i++) {
    results.add(
      Container(
        child:
            Column(
              children: [
                Row(children: [
                  Container(
                padding: EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(titles[i].profile),
                    radius: 18,
                  ),
                ),
              ),
              Container(child: Text(titles[i].name+'\n')),
              Container(child: Text(titles[i].carbonData))
            ]),
          ]),
      )
      );
  }
  return results;
}