import 'package:carbon_fp/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fp/widget/model_main.dart';



class BoxSlider extends StatelessWidget {
  late final List<Main> mains;
  BoxSlider({required this.mains});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('지금 또는 콘텐츠'),
          Container(
            height: 60,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, mains),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages (BuildContext context, List<Main> mains) {
  List<Widget> results = [];
  for (var i = 0; i < mains.length; i++) {
    results.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute<Null>(
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
              child: Image.network(mains[i].poster),

            ),
          ),
        ));
  }
  return results;
}
