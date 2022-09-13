
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/menus.dart';
import '../pages/associate_account/detail_profils_associate_account.dart';
import '../pages/associate_account/menu_edit_associate_account.dart';
import '../pages/associate_account/privilege_associate_account.dart';


class LocationBaseSettingsWidget extends StatefulWidget {

  final Widget containerWidget;
  final String title;
  final String? iconMenu;
  final VoidCallback? onPressedMenu;
  bool? bottomNav = true;

    LocationBaseSettingsWidget({
     Key? key,
     required this.containerWidget,
     required this.title,
     this.iconMenu,
     this.onPressedMenu,
     this.bottomNav}) : super(key: key);

  @override
  State<LocationBaseSettingsWidget> createState() => _LocationBaseSettingsWidgetState();
}

class _LocationBaseSettingsWidgetState extends State<LocationBaseSettingsWidget> {
  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          return Scaffold(
              backgroundColor: whiteColor,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: 0,
                onTap: (int index){
                },
                items: HomeBottomNavigation.menus.map((Menus menus) {
                  return BottomNavigationBarItem(
                    icon: menus.inactiveIcon,
                    activeIcon: menus.icon,
                    label: menus.title
                  );
                }).toList(),

              ),
              body: ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/location_settings/bg-body-add-location.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          //fit: StackFit.expand,
                          children: [
                            Container(
                              height: 125,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/location_settings/bg-header-add-location.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 25,
                              left: 1,
                              right: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.58),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),

                                     Expanded(child: Text(widget.title,
                                      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: whiteColor,
                                          fontFamily: "Inter"),textAlign: TextAlign.center,),),
                                    if(widget.iconMenu != null)...{
                                      IconButton(
                                        onPressed: widget.onPressedMenu,
                                        icon: Image.asset(widget.iconMenu!,
                                          width: 30,
                                          height: 30,),
                                      )
                                    }
                                  ],
                                ),
                              ),
                            ),
                            widget.containerWidget
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
          );
        });
  }
}




class LocationBaseAssociateAccountWidget extends StatefulWidget {

  final Widget containerWidget;
  final String title;
  final String? iconMenu;
  final VoidCallback? onPressedMenu;
  late final GlobalKey<ScaffoldState> devKey;
  final String fullBgImg;
  final VoidCallback? onPressedShared;


  LocationBaseAssociateAccountWidget({
    Key? key,
    required this.containerWidget,
    required this.title,
    this.iconMenu,
    this.onPressedMenu,
    required this.devKey,
    required this.fullBgImg,
    this.onPressedShared,}) : super(key: key);

  @override
  State<LocationBaseAssociateAccountWidget> createState() => _LocationBaseAssociateAccountWidgetState();
}

class _LocationBaseAssociateAccountWidgetState extends State<LocationBaseAssociateAccountWidget> {

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          return Scaffold(
              key: widget.devKey,
              endDrawer: Drawer(
                elevation: 16.0,
                width:(wv * 100) / 3,
                backgroundColor: labelColorTextField,
                child: ListView(
                  padding: const EdgeInsets.only(left: 15.91, right: 13.91),
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child:Image.asset("assets/images/associate_account/close_square_white.png", width: 33.92, height: 33.92,),
                          ),
                          const SizedBox(height: 17.04,),
                          const Text("Chatnoir123",
                            style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                    //const SizedBox(height: 34.51,),
                    Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                            },
                            hoverColor: kPrimaryColor,
                            focusColor: kPrimaryColor,
                            mouseCursor: MouseCursor.defer,
                            highlightColor: kPrimaryColor,
                            child: Column(
                              children: [
                                Image.asset("assets/images/associate_account/edit-white.png", width: 44, height: 44,),
                                const SizedBox(height: 8.34,),
                                const Text("Modifier",
                                  style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                                const SizedBox(height: 13.44,),
                              ],
                            ),
                          ),
                          const Divider(color: whiteColor,)
                        ],
                      ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                          },
                          hoverColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          mouseCursor: MouseCursor.defer,
                          highlightColor: kPrimaryColor,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/activity-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Activités",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: widget.onPressedShared,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/lock-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Code d'accès",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(PrivilegeAssociateAccountPageView.pageName);
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/role-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Privilèges",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    )
                  ],
                ),
              ),
              // Disable opening the end drawer with a swipe gesture.
              endDrawerEnableOpenDragGesture: false,
              backgroundColor: whiteColor,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: 0,
                onTap: (int index){
                },
                items: HomeBottomNavigation.menus.map((Menus menus) {
                  return BottomNavigationBarItem(
                      icon: menus.inactiveIcon,
                      activeIcon: menus.icon,
                      label: menus.title
                  );
                }).toList(),

              ),
              body: ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.fullBgImg),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          //fit: StackFit.expand,
                          children: [
                            Container(
                              height: 125,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/location_settings/bg-header-add-location.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 25,
                              left: 1,
                              right: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.58),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),

                                    Expanded(child: Text(widget.title,
                                      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: whiteColor,
                                          fontFamily: "Inter"),textAlign: TextAlign.center,),),
                                    if(widget.iconMenu != null)...{
                                      IconButton(
                                        onPressed: widget.onPressedMenu,
                                        icon: Image.asset(widget.iconMenu!,
                                          width: 30,
                                          height: 30,),
                                      )
                                    }
                                  ],
                                ),
                              ),
                            ),
                            widget.containerWidget
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          );
        });
  }

}




class MenuEditBaseAssociateAccountWidget extends StatefulWidget {

  final Widget containerWidget;
  final String title;
  final String? iconMenu;
  final VoidCallback? onPressedMenu;
  final bool? isNavBar;
  final String? profileName;
  late final GlobalKey<ScaffoldState> devKey;
  final VoidCallback? onPressedShared;

  MenuEditBaseAssociateAccountWidget({
    Key? key,
    required this.containerWidget,
    required this.title,
    this.iconMenu,
    this.onPressedMenu,
    required this.isNavBar,
    this.profileName,
    required this.devKey,
    this.onPressedShared,}) : super(key: key);

  @override
  State<MenuEditBaseAssociateAccountWidget> createState() => _MenuEditBaseAssociateAccountWidgetState();
}

class _MenuEditBaseAssociateAccountWidgetState extends State<MenuEditBaseAssociateAccountWidget> {

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          return Scaffold(
              key: widget.devKey,
              endDrawer: Drawer(
                elevation: 16.0,
                width:(wv * 100) / 3,
                backgroundColor: labelColorTextField,
                child: ListView(
                  padding: const EdgeInsets.only(left: 15.91, right: 13.91),
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child:Image.asset("assets/images/associate_account/close_square_white.png", width: 33.92, height: 33.92,),
                          ),
                          const SizedBox(height: 17.04,),
                          const Text("Chatnoir123",
                            style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                    //const SizedBox(height: 34.51,),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                          },
                          hoverColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          mouseCursor: MouseCursor.defer,
                          highlightColor: kPrimaryColor,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/edit-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Modifier",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                          },
                          hoverColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          mouseCursor: MouseCursor.defer,
                          highlightColor: kPrimaryColor,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/activity-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Activités",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: widget.onPressedShared,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/lock-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Code d'accès",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(PrivilegeAssociateAccountPageView.pageName);
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/role-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Privilèges",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    )
                  ],
                ),
              ),
              // Disable opening the end drawer with a swipe gesture.
              endDrawerEnableOpenDragGesture: false,
              backgroundColor: whiteColor,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: 0,
                onTap: (int index){
                  if(index == 0){
                    print(index);
                    FocusScope.of(context).unfocus();
                  }
                  if(index == 1){
                    print(index);
                    FocusScope.of(context).unfocus();
                  }

                  if(index == 2){
                    print(index);
                    FocusScope.of(context).unfocus();
                  }
                },
                items: HomeBottomNavigation.menus.map((Menus menus) {
                  return BottomNavigationBarItem(
                      icon: menus.inactiveIcon,
                      activeIcon: menus.icon,
                      label: menus.title
                  );
                }).toList(),

              ),
              body: ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/associate_account/bg-menu-edit.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          //fit: StackFit.expand,
                          children: [
                            Container(
                              height: 264,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/associate_account/bg-header-ass-account.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 32, left: 88, right: 91),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100),
                                      topLeft: Radius.circular(100),
                                    ),
                                    color: whiteColor,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 20, left: 44, right: 41, bottom: 19),
                                        padding: const EdgeInsets.all(16),
                                        decoration:BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage("assets/images/home_page/avatar.png"),
                                          radius: 30,
                                          //backgroundColor: Color(0xfff1f3f5),
                                        ),
                                      ),
                                      Text(widget.profileName!,
                                          style: const TextStyle(fontSize: 24.0, color: labelColorTextField, fontWeight: FontWeight.w500, fontFamily: "Inter"), textAlign: TextAlign.center,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if(widget.isNavBar!)...{
                              Positioned(
                                top: 25,
                                left: 1,
                                right: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3.58),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      IconButton(
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),

                                      Expanded(child: Text(widget.title,
                                        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: whiteColor,
                                            fontFamily: "Inter"),textAlign: TextAlign.center,),),
                                      if(widget.iconMenu != null)...{
                                        IconButton(
                                          onPressed: widget.onPressedMenu,
                                          icon: Image.asset(widget.iconMenu!,
                                            width: 30,
                                            height: 30,),
                                        )
                                      }
                                    ],
                                  ),
                                ),
                              ),
                            },
                            widget.containerWidget
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
          );
        });
  }
}


