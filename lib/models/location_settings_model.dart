

import 'dart:ui';

import 'package:flutter/widgets.dart';

class LocationSettingsModel {

  String headerItem;
  String? desc;
  Color txtColor;
  Color bgColor;
  String leading;
  String smallIcon;
  String locationNumber;
  Color iconColor;
  Color bgLeading;

  LocationSettingsModel({
    required this.headerItem,
    this.desc,
    required this.txtColor,
    required this.bgColor,
    required this.leading,
    required this.smallIcon,
    required this.locationNumber,
    required this.iconColor,
    required this.bgLeading,});

  factory LocationSettingsModel.fromJson( Map<String, dynamic> jsonData){
    return LocationSettingsModel(
        headerItem: jsonData['headerItem'],
        desc: jsonData['desc'],
        txtColor: jsonData['txtColor'],
        bgColor: jsonData['bgColor'],
        leading: jsonData['leading'],
        smallIcon: jsonData['smallIcon'],
        locationNumber: jsonData['locationNumber'],
        iconColor: jsonData['iconColor'],
        bgLeading: jsonData['bgLeading'],
    );
  }


  static Map<String, dynamic> toMap(Map map) => {
    'headerItem': map['headerItem'],
    'desc': map['desc'],
    'txtColor': map['txtColor'],
    'bgColor': map['bgColor'],
    'leading': map['leading'],
    'smallIcon': map['smallIcon'],
    'locationNumber': map['locationNumber'],
    'iconColor': map['iconColor'],
    'bgLeading': map['bgLeading']
  };

}