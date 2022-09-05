// more_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';



class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
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



            
            Container(
              padding: EdgeInsets.all(10),
              child: Linkify(
                onOpen: (link) async {
                  if (await canLaunchUrlString(link.url)) {
                    await launchUrlString(link.url);
                  }
                },
                text: "https://github.com/Wonhee0221",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                linkStyle: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(primary: Colors.red),
                child: Container(
                  color: Colors.red,
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
          ],
        ),
      ),
    );
  }
}
