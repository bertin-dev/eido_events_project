import 'package:flutter/material.dart';

class Menus {
  Menus(this.title, this.icon, this.color, this.inactiveIcon);
  final String title;
  final Color color;
  final Widget icon;
  final Widget inactiveIcon;
}




class HomeBottomNavigation{
  static const String home ="";
  static const String event ="";
  static const String notification ="";

  static final Menus homeMenu = Menus("home", Icon(Icons.ice_skating), Colors.blue, Icon(Icons.ice_skating));
  static final Menus homeEvent = Menus("home", Icon(Icons.ice_skating), Colors.blue, Icon(Icons.ice_skating));
  static final Menus homeNotification = Menus("home", Icon(Icons.ice_skating), Colors.blue, Icon(Icons.ice_skating));

  static final List<Menus> menus = <Menus>[
    homeMenu,
    homeEvent,
    homeNotification
  ];

}