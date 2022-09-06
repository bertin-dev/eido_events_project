import 'package:flutter/material.dart';

import '../constants.dart';
import 'bottom_widget.dart';

class OfflinePagePageView extends StatelessWidget {
  const OfflinePagePageView({Key? key}) : super(key: key);
  static const String pageName = "widgets/offline_page";

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          return Scaffold(
            //backgroundColor: Colors.green,
            body: ListView(
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    if(orientation==Orientation.portrait)...{
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        height: hv*100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/location_settings/bg-offline.png'),
                            fit: BoxFit.cover,
                          ),
                          //color: Colors.green,
                        ),
                        child: Stack(
                          //fit: StackFit.expand,
                          children: [
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/location_settings/wifi.png"),
                                  const SizedBox(height: 30,),
                                  const Text("il y'a pas de connexion internet pour le moment, veuillez vous connecter à internet",
                                    style:TextStyle(fontSize: 16.0, color: Color(0xff333333), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.center,),
                                  const SizedBox(height: 17,),
                                  MaterialButton(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                                    color: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      side:  const BorderSide(width: 1.0, color: kPrimaryColor),
                                      borderRadius: BorderRadius.circular(100.0),
                                    ),
                                    onPressed: () {
                                      //TODO: Implement event associate functionality
                                      /*Navigator.of(context, rootNavigator: true)
                                        .pushNamed(HomeLocationSettingsPageView.pageName);*/
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Rafraichir',
                                          style: TextStyle(
                                              fontSize: 16.0, color: whiteColor),
                                        ),
                                        const SizedBox(width: 12.0),
                                        Image.asset('assets/images/location_settings/refresh.png',
                                          fit: BoxFit.cover,
                                          width: 24,
                                          height: 24,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    } else...{
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/location_settings/bg-offline.png'),
                            fit: BoxFit.cover,
                          ),
                          //color: Colors.green,
                        ),
                        child: Stack(
                          //fit: StackFit.expand,
                          children: [
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/location_settings/wifi.png"),
                                  const SizedBox(height: 30,),
                                  const Text("il y'a pas de connexion internet pour le moment, veuillez vous connecter à internet",
                                    style:TextStyle(fontSize: 16.0, color: Color(0xff333333), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.center,),
                                  const SizedBox(height: 17,),
                                  MaterialButton(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                                    color: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      side:  const BorderSide(width: 1.0, color: kPrimaryColor),
                                      borderRadius: BorderRadius.circular(100.0),
                                    ),
                                    onPressed: () {
                                      //TODO: Implement event associate functionality
                                      /*Navigator.of(context, rootNavigator: true)
                                        .pushNamed(HomeLocationSettingsPageView.pageName);*/
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Rafraichir',
                                          style: TextStyle(
                                              fontSize: 16.0, color: whiteColor),
                                        ),
                                        const SizedBox(width: 12.0),
                                        Image.asset('assets/images/location_settings/refresh.png',
                                          fit: BoxFit.cover,
                                          width: 24,
                                          height: 24,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    },
                    Positioned(
                        bottom: 0,
                        width: MediaQuery.of(context).size.width,
                        child: const BottomWidget())
                  ],
                )
              ],
            ),
          );
        });
  }
}
