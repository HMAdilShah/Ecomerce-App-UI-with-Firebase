import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_by_roger_li/const/MyColors.dart';
import 'package:task_by_roger_li/controllers/HomeScreenController.dart';
import 'package:task_by_roger_li/views/widgets/generic/CustomButton.dart';
import 'package:task_by_roger_li/views/widgets/generic/CustomImageView.dart';
import 'package:task_by_roger_li/views/widgets/generic/CustomTextView.dart';

class CatCards extends StatefulWidget {
  String _title = "";
  String _details = "";
  String img_url = "";
  String doc_id = "";
  String listType = "";
  bool addButton = true;
  HomeScreenController homeScreenController;

  CatCards(this._title, this._details, this.addButton, this.img_url,
      this.homeScreenController, this.doc_id, this.listType);

  @override
  _CatCardsState createState() => _CatCardsState(
      this._title,
      this._details,
      this.addButton,
      this.img_url,
      this.homeScreenController,
      this.doc_id,
      this.listType);
}

class _CatCardsState extends State<CatCards> {
  String _title = "";
  String _details = "";
  String doc_id = "";
  String img_url = "";
  String listType = "";
  bool addButton = true;
  HomeScreenController homeScreenController;

  _CatCardsState(this._title, this._details, this.addButton, this.img_url,
      this.homeScreenController, this.doc_id, this.listType);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            side: BorderSide(width: 0.3, color: MyColors.light_grey)),
        child: Row(
          children: [
            CustomImageView(img_url, 94, 94),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                        _title, 16, FontWeight.w800, MyColors.black),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                        _details, 12, FontWeight.w500, MyColors.grey),
                    ActionButton(addButton, doc_id, listType),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ActionButton(bool addButton, String doc_id, String listType) {
    return addButton
        ? CustomButton('Add', 14, true, MyColors.white, homeScreenController,
            doc_id, listType)
        : CustomButton('Remove', 14, false, MyColors.black,
            homeScreenController, doc_id, listType);
  }
}
