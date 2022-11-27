// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:eido_events_project/pages/transitionPage.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/introView.dart';
import 'login_page.dart';

class OnboardingPage extends StatefulWidget {
  final bool goToLogin;

  const OnboardingPage({Key? key, this.goToLogin = true}) : super(key: key);
  static const String pageName = "boarding";

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late int activeTab = 0;
  bool done = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_setActiveTabIndex);
    /*Timer(const Duration(seconds: 5), () {
      if (tabController.index < tabController.length - 1) {
        setState(() {
          tabController.index += 1;
        });
        tabController.addListener(() {
          print('my index is' + tabController.index.toString());
        });
      } else {
        return;
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
        /*appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo-text.png',
                width:39,
                height: 23,
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),*/
        body: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  IntroView(
                      title: "Managez facilement vos évènements",
                      message:
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto aspernatur assumenda cum.",
                      imageLink: 'assets/images/onboarding/mobile-app.png',
                      tabController:tabController,
                      position: activeTab
                  ),
                  IntroView(
                      title: "Organisez les évènements comme un(e) pro",
                      message:
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto aspernatur assumenda cum.",
                      imageLink: 'assets/images/onboarding/support-team.png',
                      tabController:tabController,
                      position: activeTab
                  ),
                  IntroView(
                      title: "Restez organisé comme jamais auparavant",
                      message:
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto aspernatur assumenda cum.",
                      imageLink: 'assets/images/onboarding/task.png',
                      tabController:tabController,
                      position: activeTab
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 10.0, right: 24, bottom: 20),
              child: activeTab != 2
                  ?
              Container(
                alignment: FractionalOffset.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Expanded(child:  MaterialButton(
                      onPressed: () {
                        /*Navigator.of(context, rootNavigator: true)
                                  .popAndPushNamed(LoginPage.pageName);*/
                        Navigator.of(context, rootNavigator: true)
                            .popAndPushNamed(TransitionPageView.pageName);
                      },
                      child: const Text('Passer', style: TextStyle(color: Color(0xFF7A7D86), fontSize: 15, fontWeight: FontWeight.w500, fontFamily: "Inter")),
                    ),),
                    Expanded(
                      child: MaterialButton(
                        height: 54,
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                        onPressed: pageSliding,
                        child: const Text('Suivant', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700, fontFamily: "Inter"),),
                      ),
                    )


                  ],
                ),
              )
                  : Container(
                alignment: FractionalOffset.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Expanded(child:  MaterialButton(
                      onPressed: () {
                        /*Navigator.of(context, rootNavigator: true)
                                  .popAndPushNamed(LoginPage.pageName);*/
                        Navigator.of(context, rootNavigator: true)
                            .popAndPushNamed(TransitionPageView.pageName);
                      },
                      child: const Text('Passer', style: TextStyle(color: Color(0xFF7A7D86), fontSize: 15, fontWeight: FontWeight.w500, fontFamily: "Inter")),
                    ),),
                    Expanded(
                      child: MaterialButton(
                        height: 54,
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                        onPressed: pageSliding,
                        child: const Text('Commencer', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700, fontFamily: "Inter"),),
                      ),
                    )


                  ],
                ),
              ),
            )
          ],
        ),
    );
  }

  pageSliding() {
    if (tabController.index < tabController.length - 1) {
      setState(() {
        tabController.index += 1;
      });
    } else {
      setState(() {
        done = true;
        /*Navigator.of(context, rootNavigator: true)
            .popAndPushNamed(LoginPage.pageName);*/

        Navigator.of(context, rootNavigator: true)
            .popAndPushNamed(TransitionPageView.pageName);
      });
    }
  }

  void _setActiveTabIndex() {
    activeTab = tabController.index;
    setState(() {
      activeTab = tabController.index;
    });
  }
}

