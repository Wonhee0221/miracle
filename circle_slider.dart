import 'package:carbon_fp/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fp/model/model_movie.dart';

class CircleSlider extends StatelessWidget{
  final List<Movie> movies;
  CircleSlider({required this.movies});
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('미리보기'),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal, //좌우로 스크롤 할수 있게해줌, 위아래는 vertical
            children: makeCircleImages(context, movies),
          ),
        )

      ],),
    );
  }
}
List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(
      InkWell(
        onTap: () {Navigator.of(context).push(MaterialPageRoute<Null>(
            fullscreenDialog: true,
            builder: (BuildContext context){
              return DetailScreen(movie: movies[i]);
            }));},
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: NetworkImage(movies[i].poster),
              radius: 48,
            ),
          ),
        ),
      ),
    );
  }
  return results;
}