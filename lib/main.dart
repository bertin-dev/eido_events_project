import 'dart:io';
import 'package:eido_events_project/pages/splash_screen.dart';
import 'package:eido_events_project/routes/route_generators.dart';
import 'package:flutter/material.dart';


void main() {
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: "EidoEvents",
      initialRoute: SplashScreen.pageName,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Inter',
          disabledColor: Colors.white,
          brightness: Brightness.light,
          primaryColorDark: const Color(0xFF343434),
          primaryColor: const Color(0xFF17506A),
          // primaryColor: Color(0xFF068B68), SOACAM
          // primaryColor: Color(0xFF00009C), Solina
          primaryColorLight: Colors.white,
          accentColor: const Color(0xFFBC054A),
          // accentColor: Color(0xFF068B68), SOACAM
          // accentColor: Color(0xFF00009C), Solina
          buttonColor: Colors.white,
          errorColor: Colors.red,
          textTheme: TextTheme(
              headline6: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              subtitle2: TextStyle(color: Colors.grey[700])),
          appBarTheme: const AppBarTheme(
              color: Colors.black,
              brightness: Brightness.dark,
              textTheme: TextTheme(headline6: TextStyle(color: Colors.black)))),
    );
  }
}



