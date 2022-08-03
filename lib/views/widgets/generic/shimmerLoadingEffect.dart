import 'package:flutter/material.dart';
import 'package:task_by_roger_li/const/MyColors.dart';

class shimmerLoadingEffect extends StatefulWidget {
  int count = 2;

  shimmerLoadingEffect(this.count);

  @override
  _shimmerLoadingEffectState createState() =>
      _shimmerLoadingEffectState(this.count);
}

class _shimmerLoadingEffectState extends State<shimmerLoadingEffect> {
  int count = 2;

  _shimmerLoadingEffectState(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            return shimmerList(context, index);
          }),
    );
  }

  Widget shimmerList(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 96,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFFE0E0E0),
              Color(0xFFFFFFFE),
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
    );
  }
}
