import 'dart:ui';
import 'package:carbon_fp/widget/model_main.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Main main;
  DetailScreen({required this.main});
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;
  bool check = false;
  @override
  void initState() {
    super.initState();
    like = widget.main.like;
    check = widget.main.check;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.main.poster),
                          fit: BoxFit.cover
                      ),
                    ),
                    child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  child: Image.network(widget.main.poster),
                                height: 300,
                                  ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                     '미라클의 공식 어플',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    widget.main.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                  ),
                            ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  child: TextButton(
                                    style:TextButton.styleFrom( foregroundColor: Colors.amber),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: <Widget>[
                                    TextButton.icon(
                                    onPressed: (){
                                    print('TextButton Button');
                                    }, 
                                    icon: Icon(Icons.pan_tool_alt), label: Text(' '),
                                    )
                                      ],
                                    ),
                                )
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(widget.main.toString()),
                          ),
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Text(
                            '',
                                style: TextStyle(
                              color: Colors.amber,
                            fontSize: 20,
                          )
                          ),
                        )
                          ],
                      ),
                    ),
                  ),
                    ),
                  ),
                  Positioned(child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  )),
                ],
              ),
              Container(
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            check = !check;
                            widget.main.reference.update({'check':check});

                          });
                        },
                        child: Column(
                          children: <Widget>[
                            check ? Icon(Icons.check) : Icon(Icons.add),
                            Padding(padding: EdgeInsets.all(5),
                            ),
                            Text(
                              '즐겨찾기',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child:
                      InkWell(
                        onTap: () {
                          setState(() {
                            like = !like;
                            widget.main.reference.update({'like':like});

                          });
                        },
                        child: Column(
                          children: <Widget>[
                            like ? Icon(Icons.thumb_up) : Icon(Icons.favorite),
                            Padding(padding: EdgeInsets.all(5),
                            ),
                            Text('좋아요',
                            style: TextStyle(
                              fontSize: 11,color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: Column(
                            children: <Widget> [
                              Icon(Icons.send),
                              Padding(padding: EdgeInsets.all(5),
                              ),
                        Text('공유',
                            style: TextStyle(
                                fontSize: 11,color: Colors.black),
                        ),
                            ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(7),
                      child: Text(
                        widget.main.contents,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w100,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

