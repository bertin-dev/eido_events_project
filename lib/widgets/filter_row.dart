

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/filter_model.dart';

class FilterRow extends StatelessWidget {
  final FilterModel model;
   FilterRow(this.model);

  @override
  Widget build(BuildContext context) {
    print("-----${model.title}");
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0, bottom: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // I have used my own CustomText class to customise TextWidget.
          Text(model.title, style: const TextStyle(fontFamily: "Inter", fontSize: 13, fontWeight: FontWeight.w400),),
          model.selected
              ? const Icon(
            Icons.radio_button_checked,
            color: kPrimaryColor,
          )
              : const Icon(Icons.radio_button_unchecked, color: kPrimaryColor,),
        ],
      ),
    );
  }
}