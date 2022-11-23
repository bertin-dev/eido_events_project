

import 'dart:ui';

class NotificationsModel{

  final int id;
  final String name;
  final String description;
  final int tasktime;
  final Color bgColorDelete;
  final bool isFgColor;
  final bool isDivider;
  late  bool isAccepted;
  final bool isRejected;
  final String createdBy;


  NotificationsModel(
  {
  required this.id,
  required this.name,
  required this.description,
  required this.tasktime,
  required this.bgColorDelete,
  required this.isFgColor,
  required this.isDivider,
  required this.isAccepted,
  required this.isRejected,
  required this.createdBy
  });



  /*bool get getNotificationsModelIsAccepted {
    return isAccepted;
  }

  set setNotificationsModelIsAccepted(bool state) {
    isAccepted = state;
  }*/

}