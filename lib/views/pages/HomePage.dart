import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_by_roger_li/const/AppStrings.dart';
import 'package:task_by_roger_li/const/AssetsPath.dart';
import 'package:task_by_roger_li/controllers/HomeScreenController.dart';
import 'package:task_by_roger_li/views/pages/CatsScreen.dart';
import 'package:task_by_roger_li/views/pages/MeScreen.dart';

import '../../const/MyColors.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            tabScreenWidget(),
            bottomNavBarWidget(),
          ],
        ),
      ),
    );
  }

  getBottonNavBarItemColor(int selectedIndex) {
    if (_selectedIndex == selectedIndex) {
      return MyColors.primaryColor;
    } else {
      return MyColors.black;
    }
  }

  Widget selectedTabScreen(int selectedIndex) {
    if (selectedIndex == 0) {
      return CatsScreen(homeScreenController);
    } else {
      return MeScreen(homeScreenController);
    }
  }

  Widget tabScreenWidget() {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      width: double.infinity,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: selectedTabScreen(_selectedIndex)),
    );
  }

  Widget bottomNavBarWidget() {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffffffff),
              Color(0xffffc5b2),
            ],
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                _onItemTapped(0);
              },
              child: Container(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(AssetsPath.path_menu),
                      color: getBottonNavBarItemColor(0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.cat_title,
                      style: TextStyle(
                          color: getBottonNavBarItemColor(0),
                          fontFamily: 'RobotoMono'),
                    ),
                  ],
                ),
              )),
          GestureDetector(
              onTap: () {
                _onItemTapped(1);
              },
              child: Container(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(AssetsPath.path_tabar_me),
                      color: getBottonNavBarItemColor(1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Me',
                      style: TextStyle(
                          color: getBottonNavBarItemColor(1),
                          fontFamily: 'RobotoMono'),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
