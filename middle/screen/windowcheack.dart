import 'dart:ui';

import 'package:flutter/material.dart';

class MyAppSize extends StatefulWidget {
  @override
  _MyAppSizeState createState() => _MyAppSizeState();
}

class _MyAppSizeState extends State<MyAppSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('displaySize : ${MediaQuery.of(context).size}'),
            Text('displayHeight : ${MediaQuery.of(context).size.height}'),
            Text('displayWidth : ${MediaQuery.of(context).size.width}'),
            Text('devicePixelRatio : ${MediaQuery.of(context).devicePixelRatio}'),
            Text('statusBarHeight : ${MediaQuery.of(context).padding.top}'),
            Text('window.physicalSize : ${window.physicalSize}'),
          ],
        ),
      ),
    );
  }
}
