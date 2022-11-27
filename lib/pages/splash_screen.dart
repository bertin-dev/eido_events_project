import 'dart:async';

import 'package:eido_events_project/constants.dart';
import 'package:eido_events_project/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'onboarding_page.dart';

//Page de chargement

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String pageName = "splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            (){
          Navigator.of(context, rootNavigator: true)
              .popAndPushNamed(OnboardingPage.pageName);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final hv =MediaQuery.of(context).size.height/100;
    final wv =MediaQuery.of(context).size.width/100;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg2.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  //width: wv*60,
                  width: 162,
                  height: 223,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(height: 10.0),
                //Text('Chargement En Cours...', style:TextStyle(fontSize: 17.0, color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w600))
              ],
            ),
        /*    Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage('assets/images/bottom_bar.png'),
                  ),
                ))*/
          ],
        ),
      ),
    );
  }
}