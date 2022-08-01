// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/bottom_widget.dart';
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
      appBar: AppBar(
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
      ),
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: <Widget>[
                        IntroView(
                            title: "Managez facilement vos évènements",
                            message:
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto aspernatur assumenda cum dicta ea enim ex fugiat id labore libero nisi, obcaecati porro quo quod ratione tempora velit vero voluptates!",
                            imageLink: 'assets/images/onboarding/mobile-app.png',
                            tabController:tabController,
                            position: activeTab
                        ),
                        IntroView(
                            title: "Organisez les évènements comme un(e) pro",
                            message:
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto aspernatur assumenda cum dicta ea enim ex fugiat id labore libero nisi, obcaecati porro quo quod ratione tempora velit vero voluptates!",
                            imageLink: 'assets/images/onboarding/support-team.png',
                            tabController:tabController,
                            position: activeTab
                        ),
                        IntroView(
                            title: "Restez organisé comme jamais auparavant",
                            message:
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto aspernatur assumenda cum dicta ea enim ex fugiat id labore libero nisi, obcaecati porro quo quod ratione tempora velit vero voluptates!",
                            imageLink: 'assets/images/onboarding/task.png',
                            tabController:tabController,
                            position: activeTab
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 30),
                    child: activeTab != 2
                        ?
                    Container(
                      alignment: FractionalOffset.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          Expanded(child:  FlatButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .popAndPushNamed(LoginPage.pageName);
                            },
                            child: const Text('Passer', style: TextStyle(color: Color(0xFF2E3233))),
                          ),),
                          Expanded(
                            child: FlatButton(
                              height: 54,
                              padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                              color: kPrimaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              onPressed: pageSliding,
                              child: const Text('Suivant', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
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

                          Expanded(child:  FlatButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .popAndPushNamed(LoginPage.pageName);
                            },
                            child: const Text('Passer', style: TextStyle(color: Color(0xFF2E3233))),
                          ),),
                          Expanded(
                            child: FlatButton(
                              height: 54,
                              padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                              color: kPrimaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              onPressed: pageSliding,
                              child: const Text('Commencer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                            ),
                          )


                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: const BottomWidget())
          ],
        ));
  }

  pageSliding() {
    if (tabController.index < tabController.length - 1) {
      setState(() {
        tabController.index += 1;
      });
    } else {
      setState(() {
        done = true;
        Navigator.of(context, rootNavigator: true)
            .popAndPushNamed(LoginPage.pageName);
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

