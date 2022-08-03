import 'package:flutter/material.dart';
import 'package:task_by_roger_li/const/MyColors.dart';
import 'package:task_by_roger_li/controllers/HomeScreenController.dart';

class CustomButton extends StatefulWidget {
  String label = "";
  double textSize = 14;
  bool addButton = true;
  Color textColor = MyColors.white;
  HomeScreenController homeScreenController;
  String doc_id = "";
  String listType = "";

  CustomButton(this.label, this.textSize, this.addButton, this.textColor,
      this.homeScreenController, this.doc_id, this.listType);

  @override
  _CustomButtonState createState() => _CustomButtonState(
      this.label,
      this.textSize,
      this.addButton,
      this.textColor,
      this.homeScreenController,
      this.doc_id,
      this.listType);
}

class _CustomButtonState extends State<CustomButton> {
  String label = "";
  String listType = "";
  double textSize = 14;
  bool addButton = true;
  Color textColor = MyColors.white;
  String doc_id = "";
  HomeScreenController homeScreenController;

  _CustomButtonState(this.label, this.textSize, this.addButton, this.textColor,
      this.homeScreenController, this.doc_id, this.listType);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeScreenController.addOrRemoveFromAllCats(
            doc_id, addButton, listType);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(right: 10, top: 10),
        decoration: BoxDecoration(
            gradient: addButton == true
                ? LinearGradient(
                    colors: <Color>[
                      Color(0xFFFFAB91),
                      Color(0xFFFF6F43),
                    ],
                  )
                : LinearGradient(
                    colors: <Color>[
                      Color(0xFFFFFFFE),
                      Color(0xFFE0E0E0),
                    ],
                  ),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Center(
          child: Text(label,
              style: TextStyle(
                  fontSize: textSize,
                  fontFamily: 'RobotoMono',
                  color: textColor)),
        ),
      ),
    );
  }
}
