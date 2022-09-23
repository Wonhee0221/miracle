import 'package:carbon_fp/widget/model_main.dart';
import 'package:carbon_fp/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class CircleSlider extends StatelessWidget {
  final List<Main> mains;

  CircleSlider({Key? key, required this.mains}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('미리보기'),
          SizedBox(
            height: 60,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(context, mains),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Main> mains) {
  List<Widget> results = [];
  for (var i = 0; i < mains.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<void>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  main: mains[i],
                );
              }));
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: NetworkImage(mains[i].poster),
              radius: 48,
            ),
          ),
        ),
      ),
    );
  }
  return results;
}
