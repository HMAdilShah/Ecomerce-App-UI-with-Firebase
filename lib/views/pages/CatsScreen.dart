import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_by_roger_li/const/AppStrings.dart';
import 'package:task_by_roger_li/const/MyColors.dart';
import 'package:task_by_roger_li/controllers/HomeScreenController.dart';
import 'package:task_by_roger_li/models/UserProfile.dart';
import 'package:task_by_roger_li/utils/ErrorMsg.dart';
import 'package:task_by_roger_li/views/widgets/generic/CustomImageView.dart';
import 'package:task_by_roger_li/views/widgets/generic/CustomTextView.dart';
import 'package:task_by_roger_li/views/widgets/generic/shimmerLoadingEffect.dart';
import 'package:task_by_roger_li/views/widgets/modules/cats_list/CatList.dart';

class CatsScreen extends StatefulWidget {
  HomeScreenController homeScreenController;

  CatsScreen(this.homeScreenController);

  @override
  _CatsScreenState createState() => _CatsScreenState(this.homeScreenController);
}

class _CatsScreenState extends State<CatsScreen> {
  HomeScreenController homeScreenController;

  _CatsScreenState(this.homeScreenController);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextField(AppStrings.featured_title, 34,
                      FontWeight.w700, MyColors.black),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                featuredCatsWidget(),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextField(AppStrings.all_cats_title, 34,
                          FontWeight.w700, MyColors.black),
                    ],
                  ),
                ),
                allCatsWidget(),
              ],
            )
          ],
        )));
  }

  Widget featuredCatsWidget() {
    return homeScreenController.featuredCatsLoadingFailed.value == true
        ? ErrorMsg(AppStrings.featured_cats_loading_error, 16, FontWeight.w400,
            MyColors.grey)
        : homeScreenController.featuredCatsList.length > 0
            ? CatList(
                homeScreenController.featuredCatsList, homeScreenController)
            : shimmerLoadingEffect(2);
  }

  Widget allCatsWidget() {
    return homeScreenController.allCatLoadingFailed.value == true
        ? ErrorMsg(AppStrings.all_cats_loading_error, 16, FontWeight.w400,
            MyColors.grey)
        : homeScreenController.allCatsList.length > 0
            ? CatList(homeScreenController.allCatsList, homeScreenController)
            : shimmerLoadingEffect(3);
  }
}
