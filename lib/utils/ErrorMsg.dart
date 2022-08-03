import 'package:flutter/material.dart';
import 'package:task_by_roger_li/const/MyColors.dart';

class ErrorMsg extends StatefulWidget {
  String label = "";
  double textSize = 14;
  FontWeight _fontWeight = FontWeight.normal;
  Color _color = MyColors.black;

  ErrorMsg(this.label, this.textSize, this._fontWeight, this._color);

  @override
  _ErrorMsgState createState() =>
      _ErrorMsgState(this.label, this.textSize, this._fontWeight, this._color);
}

class _ErrorMsgState extends State<ErrorMsg> {
  String label = "";
  double textSize = 14;
  FontWeight _fontWeight = FontWeight.normal;
  Color _color = MyColors.black;

  _ErrorMsgState(this.label, this.textSize, this._fontWeight, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, bottom: 24),
      child: Text(
        label,
        style: TextStyle(
            color: _color,
            fontSize: textSize,
            fontWeight: _fontWeight,
            fontFamily: 'RobotoMono'),
      ),
    );
  }
}
