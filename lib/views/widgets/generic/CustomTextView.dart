import 'package:flutter/material.dart';
import 'package:task_by_roger_li/const/MyColors.dart';

class CustomTextField extends StatefulWidget {
  String label = "";
  double textSize = 14;
  FontWeight _fontWeight = FontWeight.normal;
  Color _color = MyColors.black;

  CustomTextField(this.label, this.textSize, this._fontWeight, this._color);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState(
      this.label, this.textSize, this._fontWeight, this._color);
}

class _CustomTextFieldState extends State<CustomTextField> {
  String label = "";
  double textSize = 14;
  FontWeight _fontWeight = FontWeight.normal;
  Color _color = MyColors.black;

  _CustomTextFieldState(
      this.label, this.textSize, this._fontWeight, this._color);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: _color,
          fontSize: textSize,
          fontWeight: _fontWeight,
          fontFamily: 'RobotoMono'),
    );
  }
}
