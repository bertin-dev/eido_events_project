import 'dart:io';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

//const String TRAC_URL = 'http://demo3.traccar.org:5055';
class IApp {
  static Orientation? orientation;

  /* static String imei;
  //static const String BASE_URL ='https://backend-sfa3n.its-nh.com:48001/api/v11';
  //static const String BASE_URL = 'http://173.212.226.250:48001/api/v11';
  static const String BASE_URL = 'http://sfa-test.its-nh.com:8001/api/v11';
  //static const String BASE_URL ='http://192.168.1.185:8011/api/v11';
  //static const String TRAC_URL = 'http://demo4.traccar.org:5055';
  static const String TRAC_URL = 'https://traccar.adisco-cm.com:4443';*/
  // temps de synchronisation 5 mn
  static const int SYNCRO_TIME = 2;

  static Size? screenSize;


  static double kheight(double height,
      {bool relative: true, bool percent: false}) {
    var logger = Logger();
    Orientation orientation = IApp.orientation!;
    var d = 774.9;
    try {
      var maxHeight;
      if (Orientation.landscape == orientation) {
        maxHeight = IApp.screenSize!.width;
      } else {
        maxHeight = IApp.screenSize!.height;
      }

      if (percent == true || relative == false) {
        return height * maxHeight / 100;
      }

      return height * maxHeight / d;
    } catch (e) {
      logger.e("erreur calcule relative height $e");
      return height;
    }
  }

  static double kwidth(double width,
      {bool relative: true, bool percent: false}) {
    var logger = Logger();
    try {
      Orientation orientation = IApp.orientation!;
      var maxWidth;
      var d = 441.4;
      if (Orientation.landscape == orientation) {
        maxWidth = IApp.screenSize!.height;
      } else {
        maxWidth = IApp.screenSize!.width;
      }

      if (percent == true || relative == false) {
        return width * maxWidth / 100;
      }

      return width * maxWidth / d;
    } catch (e) {
      logger.e("erreur calcule relative width $e");
      return width;
    }
  }
}
