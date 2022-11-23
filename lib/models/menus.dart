import 'package:flutter/material.dart';

class Menus {
  Menus({required this.title, required this.icon, required this.color, required this.inactiveIcon});
  final String title;
  final Color color;
  final Widget icon;
  final Widget inactiveIcon;
}




class HomeBottomNavigation{
  static const String homeInactive ="assets/images/home-icon.png";
  static const String homeActive ="assets/images/home-active-icon.png";
  static const String eventActive ="assets/images/event-active-icon.png";
  static const String eventInactive ="assets/images/event-inactive-icon.png";
  static const String notificationInactive ="assets/images/profile-inactive-icon.png";
  static const String notificationActive ="assets/images/profile-active-icon.png";

  static const String homeProgramInactive ="assets/images/guests/program-inactive-icon.png";
  static const String homeProgramActive ="assets/images/guests/program-active-icon.png";

  static const String cartographyActive ="assets/images/guests/cartographie-active-icon.png";
  static const String cartographyInactive ="assets/images/guests/cartographie-inactive-icon.png";

  static const String productInactive ="assets/images/guests/product-inactive-icon.png";
  static const String productActive ="assets/images/guests/product-active-icon.png";

  static final Menus homeMenu = Menus(
      title: "Accueil",
      icon: Image.asset(homeActive, width: 23.75, height: 25,),
      color: const Color(0xff7A7D86),
      inactiveIcon: Image.asset(homeInactive, width: 23.75, height: 25,));

  static final Menus homeEvent = Menus(
      title: "Evènements",
      icon: Image.asset(eventActive, width: 23.75, height: 25,),
      color: const Color(0xff7A7D86),
      inactiveIcon: Image.asset(eventInactive, width: 23.75, height: 25,));

  static final Menus homeNotification = Menus(
      title: "Profil",
      icon: Image.asset(notificationActive, width: 23.75, height: 25,),
      color: const Color(0xff7A7D86),
      inactiveIcon: Image.asset(notificationInactive, width: 23.75, height: 25,));



  static final Menus homeProgram = Menus(
      title: "Programmes",
      icon: Image.asset(homeProgramActive, width: 23.75, height: 25,),
      color: const Color(0xff7A7D86),
      inactiveIcon: Image.asset(homeProgramInactive, width: 23.75, height: 25,));

  static final Menus homeCartography = Menus(
      title: "Cartographie",
      icon: Image.asset(cartographyActive, width: 23.75, height: 25,),
      color: const Color(0xff7A7D86),
      inactiveIcon: Image.asset(cartographyInactive, width: 23.75, height: 25,));

  static final Menus homeProduct = Menus(
      title: "Produits",
      icon: Image.asset(productActive, width: 23.75, height: 25,),
      color: const Color(0xff7A7D86),
      inactiveIcon: Image.asset(productInactive, width: 23.75, height: 25,));


  static final List<Menus> menus = <Menus>[
    homeMenu,
    homeEvent,
    homeNotification
  ];

  static final List<Menus> menus2 = <Menus>[
    homeProgram,
    homeCartography,
    homeProduct
  ];

}