// more_screen.dart
import 'package:carbon_fp/screen/home_screen3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fp/model/User_data.dart';




class MoreScreen extends StatefulWidget {
  _MoreScreenState createState() => _MoreScreenState();

}
class _MoreScreenState extends State<MoreScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('User').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('User').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildBody(BuildContext context,
      List<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    List<Users> titles = snapshot.map((d) => Users.fromSnapshot(d)).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50),
            child: CircleAvatar(
              backgroundImage: NetworkImage(titles[0].profile),
              radius: 100,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              titles[0].name,
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
            color: Colors.green,
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Container(
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '프로필 수정하기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          cancelButton()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }

  Widget cancelButton() {
    return Padding(
        padding: EdgeInsets.only(top: 50),
        child: Container(height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
              fixedSize: Size(300, 100),
            ),
            child: Text('로그아웃'),
            onPressed: (){},
          ),
        )
    );
  }


}
