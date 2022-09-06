
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/menus.dart';
import 'bottom_widget.dart';


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
                      ),
                      if(widget.bottomNav == true)...{
                        Positioned(
                            bottom: 0,
                            width: MediaQuery.of(context).size.width,
                            child: const BottomWidget())
                      }
                    ],
                  ),
                ],
              )
          );
        });
  }
}

