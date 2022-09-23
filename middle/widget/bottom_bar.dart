import 'package:flutter/material.dart';

class Bottom extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber,
      child: Container(height: 60, child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black26,
        indicatorColor: Colors.transparent,
        tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.list_alt,
              size: 20,
            ),
            child: Text(
              '홈',
              style: TextStyle(fontSize: 9),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.add_a_photo,
              size: 20,
            ),
            child: Text(
              '사진등록',
              style: TextStyle(fontSize: 9),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.emoji_events,
              size: 20,
            ),
            child: Text(
              '랭킹',
              style: TextStyle(fontSize: 9),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.edit_note,
              size: 20,
            ),
            child: Text(
              '일기장',
              style: TextStyle(fontSize: 9),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.person,
              size: 20,
            ),
            child: Text(
              '회원가입',
              style: TextStyle(fontSize: 9),
            ),
          ),
        ],
      ),),
    );
  }
}