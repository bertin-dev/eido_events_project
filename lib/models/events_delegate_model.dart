

import 'dart:ui';

import 'events_delegate_details_model.dart';

class EventsDelegateModel {

  bool expanded;
  String headerItem;
  Color txtColor;
  Color bgColor;
  List<EventsDelegateDetailsModel> eventsDelegateDetailsModel = [];

  EventsDelegateModel({
    this.expanded: false,
    required this.headerItem,
    required this.txtColor,
    required this.bgColor,
    required this.eventsDelegateDetailsModel});

  factory EventsDelegateModel.fromJson( Map<String, dynamic> jsonData){
    return EventsDelegateModel(
        expanded: jsonData['expanded'],
        headerItem: jsonData['headerItem'],
        txtColor: jsonData['txtColor'],
        bgColor: jsonData['bgColor'],
      eventsDelegateDetailsModel: List.from(jsonData['eventsDelegateDetails']),
    );
  }


  static Map<String, dynamic> toMap(Map map) => {
    'expanded': map['expanded'],
    'headerItem': map['headerItem'],
    'txtColor': map['txtColor'],
    'bgColor': map['bgColor'],
    'eventsDelegateDetailsModel': map['eventsDelegateDetailsModel']
  };

}