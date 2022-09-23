import 'package:carousel_slider/carousel_slider.dart';
import 'package:carbon_fp/widget/model_main.dart';
import 'package:carbon_fp/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fp/widget/main_page.dart';

class CarouselImage extends StatefulWidget {
  final List<Main> mains;

  CarouselImage({required this.mains});

  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Main> mains;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  late List<bool> check;
  int _currentPage = 0;
  late String _currentKeyword;

  get onPageChanged => null;

  @override
  void initState() {
    super.initState();
    mains = widget.mains;
    images = mains.map((m) => Image.network(m.poster)).toList();
    keywords = mains.map((m) => m.keyword).toList();
    likes = mains.map((m) => m.like).toList();
    check = mains.map((m) => m.check).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[_currentPage];
              });
            }),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            padding: EdgeInsets.all(50),
            height: 5,
            color: Colors.amber,
          ),
          Container(
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[_currentPage]
                          ? IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = !likes[_currentPage];
                                  mains[_currentPage]
                                      .reference
                                      .update({'like': likes[_currentPage]});
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = !likes[_currentPage];
                                  mains[_currentPage]
                                      .reference
                                      .update({'like': likes[_currentPage]});
                                });
                              },
                            ),
                      Text(
                        '추가하기',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                return MainPage();
                              }));
                        },
                      ),
                      Text(
                        '일기장 이동',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                return DetailScreen(
                                  main: mains[_currentPage],
                                );
                              }));
                        },
                      ),
                      Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(50),
            height: 5,
            color: Colors.amber,
          ),
          Container(
            height: 20,
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: makeIndicator(likes, _currentPage),
          )),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }

  return results;
}
