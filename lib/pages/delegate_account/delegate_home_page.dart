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
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  //color: Colors.grey.shade50,
                  height: _media.height / 2,
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
                                  opacity: 0.4,
                                  child: Container(
                                    color: successTextColor,
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
                        left: 10,
                        right: 10,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
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
                                      position: BadgePosition.topEnd(top: 10, end: 10),
                                      badgeContent: null,
                                      animationType: BadgeAnimationType.scale,
                                      badgeColor: bottomNavSelected,
                                      borderSide: const BorderSide(color: whiteColor),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context, rootNavigator: true)
                                              .pushNamed(NotificationsPageView.pageName);
                                        },
                                        icon: const Icon(Icons.notifications, color: whiteColor,),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 44,
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
                                  Text(
                                    "Mariage d'Aîcha",
                                    style: TextStyle(
                                        fontSize: _media.longestSide <= 775 ? 23 : 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Inter'),
                                  ),
                                  const SizedBox(height: 11,),
                                  Container(height: 1, color: bottomNavSelected, width: _media.width/2,),
                                  const SizedBox(height: 12.5,),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, color: bottomNavSelected, size: 15,),
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
                          height: _media.longestSide <= 775
                              ? _media.height / 6
                              : _media.height / 6.3,
                          width: _media.width,
                          child:Container(
                            padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
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
                                            Text("25", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.5471, color: labelColorTextField),),
                                            Text("Invité crées", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: successTextColor),),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: const [
                                            Text("05", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.5471, color: greenColor),),
                                            Text("Comptes Associés", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: successTextColor),),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0, top: 20),
                  child: Card(
                    color: yellowCardColor,
                    elevation: 1.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Icon(Icons.chevron_left, color: Color(0xff130F26)),
                        SizedBox(width: 7,),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 13,),
                                Text("Passer à premium", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textColor)),
                                SizedBox(height: 13,),
                                Text("Et économisez 20%", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: smallTextCard)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 98,
                                        child: ElevatedButton(
                                          onPressed: () => print("it's pressed"),
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
                                              backgroundColor: MaterialStateProperty.all<Color>(fullYellowButton),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(6.0),
                                                      side: const BorderSide(color: fullYellowButton)
                                                  )
                                              )
                                          ),
                                          child: Row(
                                            children: const [
                                              Text("Allez-y"),
                                              SizedBox.square(dimension: 5),
                                              Icon(Icons.group),
                                            ],
                                          ),
                                        )),

                                    Expanded(child: Image.asset("assets/images/home_page/crown.png", width: 82.03,height: 70.76,))
                                  ],
                                )
                              ],
                            )
                        ),
                        SizedBox(width: 7,),
                        Icon(Icons.chevron_right, color: Color(0xff130F26),),
                      ],
                    ),
                  ),
                ),
                Container(
                  //padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    boxShadow: [
                       BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 16.0,
                      ),
                    ],
                  ),
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    elevation: 05,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 15, top: 15),
                          child: Text("Gestion de l'évènement", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: successTextColor),),
                        ),
                        ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: [
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/controle_billet.png"),
                              title: Text(
                                'Controle de billets',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                            ),
                            Divider(),
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/ges_salle.png"),
                              title: Text(
                                'Gestion de Salle',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                            ),
                            Divider(),
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/ges_rubrique.png"),
                              title: Text(
                                'Gestion des Rubriques',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                            ),
                            Divider(),
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/ges_compte.png"),
                              title: Text(
                                'Gestion de comptes',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                            ),
                            Divider(),
                            ListTile(
                              leading: Image.asset("assets/images/delegate_account/notif_serveur.png"),
                              title: Text(
                                'Notification Serveur',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                            ),
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

