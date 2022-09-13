import 'package:flutter/material.dart';

class Menus {
  Menus(this.title, this.icon, this.color, this.inactiveIcon);
  final String title;
  final Color color;
  final Widget icon;
  final Widget inactiveIcon;
}




class HomeBottomNavigation{
  static const String home ="assets/images/home-icon.png";
  static const String event ="assets/images/event-icon.png";
  static const String notification ="assets/images/profile-icon.png";

  static final Menus homeMenu = Menus("Accueil", Image.asset(home, width: 23.75, height: 25,), const Color(0xff7A7D86), Image.asset(home, width: 23.75, height: 25,));
  static final Menus homeEvent = Menus("Evènements", Image.asset(event, width: 23.75, height: 25,), const Color(0xff7A7D86), Image.asset(event, width: 23.75, height: 25,));
  static final Menus homeNotification = Menus("Profil", Image.asset(notification, width: 23.75, height: 25,), const Color(0xff7A7D86), Image.asset(notification, width: 23.75, height: 25,));

  static final List<Menus> menus = <Menus>[
    homeMenu,
    homeEvent,
    homeNotification
  ];

}