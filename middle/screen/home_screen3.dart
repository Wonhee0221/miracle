import 'package:carbon_fp/widget/model_main.dart';
import 'package:carbon_fp/widget/box_slider.dart';
import 'package:carbon_fp/widget/carousel_slider.dart';
import 'package:carbon_fp/widget/circle_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('main').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('main').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildBody(BuildContext context,
      List<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    List<Main> mains = snapshot.map((d) => Main.fromSnapshot(d)).toList();
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: <Widget>[
              CarouselImage(mains: mains),
              TopBar(),
            ],
          ),
          CircleSlider(mains: mains),
          BoxSlider(mains: mains),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/m_logo.png',
            fit: BoxFit.contain,
            height: 60,)
        ],
      ),
    );

  }
}

