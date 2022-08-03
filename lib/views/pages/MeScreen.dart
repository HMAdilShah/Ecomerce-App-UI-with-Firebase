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

class MeScreen extends StatefulWidget {
  HomeScreenController homeScreenController;

  MeScreen(this.homeScreenController);

  @override
  _MeScreenState createState() => _MeScreenState(this.homeScreenController);
}

class _MeScreenState extends State<MeScreen> {
  HomeScreenController homeScreenController;

  _MeScreenState(this.homeScreenController);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileWidget(),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextField(AppStrings.my_cats_title, 34,
                          FontWeight.w700, MyColors.black),
                    ],
                  ),
                  myCatsWidget(),
                ],
              ),
            )
          ],
        )));
  }

  Widget profileWidget() {
    return homeScreenController.profileLoadingFailed.value == true
        ? ErrorMsg(AppStrings.profile_loading_error, 16, FontWeight.w400,
            MyColors.grey)
        : homeScreenController.userProfile == null
            ? shimmerLoadingEffect(1)
            : _userProfile(homeScreenController.userProfile!);
  }

  Widget myCatsWidget() {
    return homeScreenController.myCatsLoadingFailed.value == true
        ? ErrorMsg(AppStrings.my_cats_loading_error, 16, FontWeight.w400,
            MyColors.grey)
        : homeScreenController.myCatsEmpty == true
            ? ErrorMsg(AppStrings.my_cats_empty_msg, 16, FontWeight.w400,
                MyColors.grey)
            : homeScreenController.myCatsList.length > 0
                ? CatList(homeScreenController.myCatsList, homeScreenController)
                : shimmerLoadingEffect(2);
  }

  Widget _userProfile(UserProfile userProfile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
                userProfile.username, 34, FontWeight.w800, MyColors.black),
            Row(
              children: [
                CustomTextField(
                    AppStrings.age_title, 16, FontWeight.w800, MyColors.black),
                CustomTextField(
                    userProfile.Age, 16, FontWeight.w500, MyColors.black),
              ],
            ),
          ],
        ),
        CustomImageView(userProfile.picture, 76, 77),
      ],
    );
  }
}
