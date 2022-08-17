

import 'dart:ui';

class EventsDelegateDetailsModel {

  String discription;
  Color colorsItem;
  String img;
  String startDate;
  String endDate;
  String hour;

  EventsDelegateDetailsModel({
    required this.discription,
    required this.colorsItem,
    required this.img,
    required this.startDate,
    required this.endDate,
    required this.hour});

  factory EventsDelegateDetailsModel.fromJson( Map<String, dynamic> jsonData){
    return EventsDelegateDetailsModel(
      discription: jsonData['discription'],
      colorsItem: jsonData['colorsItem'],
      img: jsonData['img'],
      startDate: jsonData['startDate'],
      endDate: jsonData['endDate'],
      hour: jsonData['hour']
    );
  }


  static Map<String, dynamic> toMap(Map map) => {
    'discription': map['discription'],
    'colorsItem': map['colorsItem'],
    'img': map['img'],
    'startDate': map['startDate'],
    'endDate': map['endDate'],
    'hour': map['hour']
  };

}