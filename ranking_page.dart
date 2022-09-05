// more_screen.dart
import 'package:flutter/material.dart';

class RankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Row(children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Wonhee',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
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
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Wonhee',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
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
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Wonhee',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
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
            ),
          ]),
        ));
  }
}
