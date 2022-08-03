import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_by_roger_li/const/AssetsPath.dart';

import 'HomePage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    nextNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.all(10),
              width: 150,
              child: Image.asset(AssetsPath.path_app_icon)),
        ],
      )),
    );
  }

  Future<void> nextNavigation() async {
    await Timer(Duration(seconds: 2), () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    });
  }
}
