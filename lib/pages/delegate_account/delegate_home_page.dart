import 'package:badges/badges.dart';
import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/screen_size.dart';
import '../notifications_page.dart';


class DelegateHomePageView extends StatefulWidget {
  const DelegateHomePageView({Key? key}) : super(key: key);
  static const String pageName = "delegate_home_page";

  @override
  State<DelegateHomePageView> createState() => _DelegateHomePageViewState();
}

class _DelegateHomePageViewState extends State<DelegateHomePageView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          final _media = MediaQuery.of(context).size;
          return Scaffold(
            //backgroundColor: Colors.green,
            body: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  //color: Colors.grey.shade50,
                  height: _media.height / 2 + 10,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Stack(
                              children: <Widget>[
                                Material(
                                  elevation: 4,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/delegate_account/wedding_del_home.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.6,
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          )
                        ],
                      ),
                      Positioned(
                        top: _media.longestSide <= 775
                            ? screenAwareSize(20, context)
                            : screenAwareSize(35, context),
                        left: 1,
                        right: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
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

                                  const Text("EidoEvents", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromRGBO(255, 255, 255, 0.8)),textAlign: TextAlign.center,),

                                  Container(
                                    width: 36,
                                    height: 36,
                                    //padding: const EdgeInsets.all(2),
                                    decoration:BoxDecoration(
                                      color: const Color.fromRGBO(255, 255, 255, 0.1),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Badge(
                                      position: BadgePosition.topEnd(top: 8, end: 5),
                                      badgeContent: null,
                                      animationType: BadgeAnimationType.scale,
                                      badgeColor: bottomNavSelected,
                                      borderSide: const BorderSide(color: whiteColor),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context, rootNavigator: true)
                                              .pushNamed(NotificationsPageView.pageName);
                                        },
                                        icon: Image.asset("assets/images/delegate_account/notif-icon.png", width: 15, height: 16.67,),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 37,
                              ),
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "1er mai 2022 - 14:00",
                                    style: TextStyle(
                                        fontSize: _media.longestSide <= 775 ? 12 : 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Inter'),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    "Mariage d'Aîcha",
                                    style: TextStyle(
                                        fontSize: _media.longestSide <= 775 ? 23 : 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Inter'),
                                  ),
                                  const SizedBox(height: 11,),
                                  Container(height: 1, color: const Color(0xff2D68E6), width: _media.width/2,),
                                  const SizedBox(height: 12.5,),
                                  Row(
                                    children: [
                                      Image.asset("assets/images/location-icon3.png", width: 16, height: 16,),
                                      const SizedBox(width: 6,),
                                      Text(
                                        "Mairie de Douala 5ème",
                                        style: TextStyle(
                                            fontSize: _media.longestSide <= 775 ? 11 : 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Inter'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          /*height: _media.longestSide <= 775
                              ? _media.height / 6
                              : _media.height / 6.3,
                          width: _media.width,*/
                          child:Container(
                            padding: const EdgeInsets.only(top: 220, left: 20, right: 20, bottom: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                  padding: const EdgeInsets.all(15),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: const [
                                            Text("25", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.5471, color: labelColorTextField, fontFamily: "Inter"),),
                                            Text("Invité crées", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: successTextColor, fontFamily: "Inter"),),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: const [
                                            Text("05", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.5471, color: greenColor, fontFamily: "Inter"),),
                                            Text("Comptes Associés", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: successTextColor, fontFamily: "Inter"),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0, top: 13),
                  child: Card(
                    //shadowColor: Colors.black.withOpacity(0.1),
                    color: yellowCardColor,
                    elevation: 1.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/home_page/arrow-left-black.png", width: 24, height: 24,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 13,),
                            const Text("Passer à premium",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textColor, fontFamily: "Inter", fontStyle: FontStyle.normal)),
                            const SizedBox(height: 3,),
                            const Text("Et économisez 20%", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: smallTextCard)),
                            const SizedBox(height: 13,),
                            SizedBox(
                                width: 88,
                                child: ElevatedButton(
                                  onPressed: () => print("it's pressed"),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(top: 10, bottom: 10, left: 6, right: 3.85)),
                                      backgroundColor: MaterialStateProperty.all<Color>(fullYellowButton),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6.0),
                                              side: const BorderSide(color: fullYellowButton)
                                          )
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      const Text("Allez-y"),
                                      const SizedBox.square(dimension: 5),
                                      Image.asset("assets/images/associate_account/group-user-icon.png", width: 24, height: 24,),
                                    ],
                                  ),
                                )),
                            const SizedBox(height: 7,),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(height: 50,),
                            Image.asset("assets/images/home_page/crown.png", width: 66.03,height: 66.76,),
                          ],
                        ),
                        Image.asset("assets/images/home_page/arrow-right-black.png", width: 24, height: 24,),
                      ],
                    ),
                  ),
                ),
                Container(
                  //padding: EdgeInsets.only(top: 15),
                  /*decoration: const BoxDecoration(
                    boxShadow: [
                       BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 16.0,
                      ),
                    ],
                  ),*/
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 15, top: 15),
                          child: Text("Gestion de l'évènement", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: successTextColor),),
                        ),
                        ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/controle_billet.png", width: 45, height: 45,),
                              title: const Text(
                                'Controle de billets',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: const Icon(Icons.keyboard_arrow_right, size: 17, color: Color(0xff7A7D86),),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(left: 75),
                            child: Divider(color: Color.fromRGBO(0, 0, 0, 0.1),),),
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/ges_salle.png", width: 45, height: 45),
                              title: const Text(
                                'Gestion de Salle',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: const Icon(Icons.keyboard_arrow_right, size: 17, color: Color(0xff7A7D86),),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 75),
                              child: Divider(color: Color.fromRGBO(0, 0, 0, 0.1),),),
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/ges_rubrique.png", width: 45, height: 45),
                              title: const Text(
                                'Gestion des Rubriques',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: const Icon(Icons.keyboard_arrow_right, size: 17, color: Color(0xff7A7D86),),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 75),
                              child: Divider(color: Color.fromRGBO(0, 0, 0, 0.1),),),
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/ges_compte.png", width: 45, height: 45),
                              title: const Text(
                                'Gestion de comptes',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: const Icon(Icons.keyboard_arrow_right, size: 17, color: Color(0xff7A7D86),),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 75),
                              child: Divider(color: Color.fromRGBO(0, 0, 0, 0.1),),),
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/notif_serveur.png", width: 45, height: 45),
                              title: const Text(
                                'Notification Serveur',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: const Icon(Icons.keyboard_arrow_right, size: 17, color: Color(0xff7A7D86),),
                            ),
                            const SizedBox(height: 15,)
                          ],
                        ),
                      ],
                    )
                  ),
                ),
                const SizedBox(height: 93,)
              ],
            ),
          );
        });
  }
}

