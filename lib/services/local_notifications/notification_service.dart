import 'dart:io';
import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
//import 'package:flutter_push_notifications/utils/download_util.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService();

  final _localNotifications = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<String> behaviorSubject = BehaviorSubject();

  Future<void> initializePlatformNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@drawable/logo_login');

    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotifications.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id');
  }

  void selectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      behaviorSubject.add(payload);
    }
  }


  Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    await _localNotifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    /*final bigPicture = await DownloadUtil.downloadAndSaveFile(
        "https://images.unsplash.com/photo-1624948465027-6f9b51067557?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
        "drinkwater");*/


    AndroidNotificationDetails androidPlatformChannelSpecifics =
    const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      groupKey: 'com.eido.events.eido_events_project',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',
      /*largeIcon: DrawableResourceAndroidBitmap('justwater'),
       styleInformation: BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicture),
        hideExpandedLargeIcon: false,
      ),*/
      color: Color(0xff2196f3),
    );

    /*IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails(
        threadIdentifier: "thread1",
        attachments: <IOSNotificationAttachment>[
          IOSNotificationAttachment(bigPicture)
        ]);*/

    IOSNotificationDetails iosNotificationDetails = const IOSNotificationDetails();

    final details = await _localNotifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      behaviorSubject.add(details.payload!);
    }
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

    return platformChannelSpecifics;
  }


}