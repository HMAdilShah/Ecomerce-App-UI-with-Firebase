import 'package:flutter/material.dart';
import 'package:task_by_roger_li/controllers/HomeScreenController.dart';
import 'package:task_by_roger_li/models/CatsModel.dart';
import 'package:task_by_roger_li/views/widgets/modules/cats_list/CatCards.dart';

class CatList extends StatefulWidget {
  List<CatsModel> _catsList = [];
  HomeScreenController homeScreenController;

  CatList(this._catsList, this.homeScreenController);

  @override
  _CatListState createState() => _CatListState(_catsList, homeScreenController);
}

class _CatListState extends State<CatList> {
  List<CatsModel> _catsList;
  HomeScreenController homeScreenController;

  _CatListState(this._catsList, this.homeScreenController);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: _catsList.length,
          itemBuilder: (BuildContext context, int index) {
            CatsModel _catsModel = _catsList.elementAt(index);
            return buildCatsList(context, index, _catsModel);
          }),
    );
  }

  buildCatsList(BuildContext context, int index, CatsModel _catsModel) {
    bool addButton = _catsModel.isAdded == "false";

    return CatCards(
        _catsModel.cat_name,
        _catsModel.cat_details,
        addButton,
        _catsModel.img_url,
        homeScreenController,
        _catsModel.doc_id,
        _catsModel.collection);
  }
}
