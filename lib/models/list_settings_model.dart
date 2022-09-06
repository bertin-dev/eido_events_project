

import 'dart:ui';

import 'package:flutter/widgets.dart';

class ListSettingsModel {

  String headerItem;
  String positionName;
  String? desc;
  Color bgColor;
  String screenshot;
  String smallIcon;
  String locationNumber;
  Color iconColor;
  String state;

  ListSettingsModel({
    required this.headerItem,
    required this.positionName,
    this.desc,
    required this.bgColor,
    required this.screenshot,
    required this.smallIcon,
    required this.locationNumber,
    required this.iconColor,
    required this.state,});

  factory ListSettingsModel.fromJson( Map<String, dynamic> jsonData){
    return ListSettingsModel(
        headerItem: jsonData['headerItem'],
        positionName: jsonData['positionName'],
        desc: jsonData['desc'],
        bgColor: jsonData['bgColor'],
        screenshot: jsonData['screenshot'],
        smallIcon: jsonData['smallIcon'],
        locationNumber: jsonData['locationNumber'],
        iconColor: jsonData['iconColor'],
        state: jsonData['state'],
    );
  }


  static Map<String, dynamic> toMap(Map map) => {
    'headerItem': map['headerItem'],
    'positionName': map['positionName'],
    'desc': map['desc'],
    'bgColor': map['bgColor'],
    'screenshot': map['screenshot'],
    'smallIcon': map['smallIcon'],
    'locationNumber': map['locationNumber'],
    'iconColor': map['iconColor'],
    'state': map['state']
  };

}