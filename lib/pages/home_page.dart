
import 'package:badges/badges.dart';
import 'package:bottom_animation/bottom_animation.dart';
import 'package:eido_events_project/pages/delegate_account/delegate_login_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../models/bottom_sheet_menu.dart';
import '../utils/screen_size.dart';
import 'associate_account/list_associate_account_page.dart';
import 'delegate_account/delegate_login_step2_page.dart';
import 'events/manage_tickets_page.dart';
import 'guests/guests_list_page.dart';
import 'guests_space/home_guests_space_page.dart';
import 'manage_event_programs/program_home_page.dart';
import 'manage_rubrique/rubrique_list_page.dart';
import 'notifications_page.dart';

class HomePageView extends StatefulWidget {
  static const String pageName = "home_page";
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          final media = MediaQuery.of(context).size;
          return Scaffold(
            backgroundColor: whiteColor,
            resizeToAvoidBottomInset: true,
            key: scaffoldKey,
            /*appBar: AppBar(
              title: const Text("EidoEvents", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: whiteColor),),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
              elevation: 0.0,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(DelegateLoginPage.pageName);
                  },
                  icon: const Icon(Icons.calendar_month, color: whiteColor,),
                ),
                Badge(
                  position: BadgePosition.topEnd(top: 15, end: 15),
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

              ],
            ),*/
            floatingActionButton: FloatingActionButton(
              backgroundColor: bottomNavSelected,
              onPressed: () {
                print("floatingActionButton");
                Navigator.of(context).pushNamed(HomeGuestsSpacePageView.pageName);
              },
              child: const Icon(Icons.add),
            ),
            body: Stack(
              children: [
                if(orientation==Orientation.landscape)...{
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 248,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/home_page/bg-home3.png'),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  Positioned(
                    top: 45,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          //padding: EdgeInsets.zero,
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back, color: whiteColor, size: 25,),
                        ),
                        const Expanded(
                            child: Center(
                              child: Text("EidoEvents", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: whiteColor, fontStyle: FontStyle.normal, fontFamily: "Inter"),),
                            )
                        ),
                        InkWell(
                          //padding: EdgeInsets.zero,
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(DelegateLoginPage.pageName);
                            },
                            child: Image.asset("assets/images/home_page/calendar-icon.png", width: 19.89, height: 20,)
                        ),
                        const SizedBox(width: 15.47,),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color:whiteColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Badge(
                            position: BadgePosition.topStart(top: -2, start: 10),
                            badgeContent: null,
                            animationType: BadgeAnimationType.scale,
                            badgeColor: bottomNavSelected,
                            borderSide: const BorderSide(color: whiteColor),
                            child: InkWell(
                              //iconSize: 16,
                              //padding: const EdgeInsets.all(0.0),
                              //splashRadius: 10.0,  // (Material.defaultSplashRadius = 35.0)
                              //color: whiteColor.withOpacity(0.1),
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(NotificationsPageView.pageName);
                                },
                                child: Image.asset("assets/images/home_page/notification-icon.png", width: 16.57, height: 16.67,)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    right: 10.0,
                    top: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children:  const [
                            Text("Bienvenue",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23, color: whiteColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                            SizedBox(height: 5,),
                            Text("Mozart Modjo",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: whiteColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration:BoxDecoration(
                            color: bgAvatar,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage("assets/images/home_page/avatar.png"),
                            radius: 25,
                            //backgroundColor: Color(0xfff1f3f5),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 205,
                    left: 5,
                    right: 5,
                    child: Container(
                      //padding: const EdgeInsets.only(bottom: 30),
                      decoration:BoxDecoration(
                        //color: whiteColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 16,
                                spreadRadius: 0.2,
                                offset: const Offset(0, 8)),
                          ]
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        shadowColor: Colors.black.withOpacity(0.1),
                        child: Container(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 20),
                            width: double.infinity,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      Text("25",
                                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.55, color: labelColorTextField, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                      Text("Evènements crées", textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: successTextColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      Text("05",
                                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.55, color: greenColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                      Text("Evènements encours", textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: successTextColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      Text("22",
                                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.55, color: redColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                      Text("Evènements expirés", textAlign: TextAlign.center,
                                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: successTextColor, fontFamily: "Inter", fontStyle: FontStyle.normal)),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: media.longestSide <= 775
                        ? screenAwareSize(500, context)
                        : screenAwareSize(323, context),
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 34.0,right: 34.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              colorCard("Emplacements", "assets/images/home_page/door.png", 56, "Enregistrés",context, const Color(0xff2D68E6), whiteColor),
                              const SizedBox(width: 10,),
                              colorCard("Abonnements", "assets/images/home_page/history.png", 22, "Payés",context, greyCardColor, successTextColor),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0, top: 36),
                          child: Card(
                            //shadowColor: Colors.black.withOpacity(0.1),
                            color: yellowCardColor,
                            elevation: 5.0,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0, top: 26),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Derniers évènements", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: successTextColor)),
                              Center(
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            print("voir Plus");
                                          },
                                          child: const Text("Voir plus",
                                            style: TextStyle(color: kPrimaryColor, fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 13.0, fontFamily: "Inter",),)),
                                      Image.asset("assets/images/home_page/arrow-right-red.png", width: 16, height: 16,),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            getBottomSheetMenu3();
                          },
                          child: Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                              decoration:BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 8,
                                      //spreadRadius: 0.2,
                                      //offset: const Offset(0, 8)
                                    ),
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 2.0,
                                          color: Colors.red,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  children: [
                                                    const Text("Anniversaire de la copine... ", style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: labelColorTextField,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: "Inter"
                                                    ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                      decoration:BoxDecoration(
                                                        color: const Color(0xffD4FFE6),
                                                        borderRadius: BorderRadius.circular(50),
                                                      ),
                                                      child: const Text("Classique", style: TextStyle(
                                                          fontSize: 11.0,
                                                          color: Color(0xff219653),
                                                          fontWeight: FontWeight.w400,
                                                          fontStyle: FontStyle.normal,
                                                          fontFamily: "Inter"
                                                      ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Text("Douala B'ssadi, 12ieme", style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/home_page/calendar-icon-red.png", width: 19, height: 19,),
                                          const SizedBox(width: 7.38,),
                                          const Expanded(
                                            child: Text("02 Avr - 03 avr 2022", style: TextStyle(
                                                fontSize: 11.0,
                                                color: successTextColor,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Inter",
                                                fontStyle: FontStyle.normal
                                            ),
                                            ),
                                          ),
                                          Expanded(
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset("assets/images/home_page/ant-design_clock-circle-filled.png", width: 19, height: 19,),
                                                const SizedBox(width: 5,),
                                                const Text("JJ-5", style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: redColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            getBottomSheetMenu3();
                          },
                          child: Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                              decoration:BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 8,
                                      //spreadRadius: 0.2,
                                      //offset: const Offset(0, 8)
                                    ),
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: const Color(0xffF2F2F2),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 47,
                                            width: 2.0,
                                            color: iconColor,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10.0, right: 0, top: 5.0, bottom: 5.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Wrap(
                                                    children: [
                                                      const Text("Mariage d'Alice ", style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: labelColorTextField,
                                                          fontWeight: FontWeight.w700,
                                                          fontStyle: FontStyle.normal,
                                                          fontFamily: "Inter"
                                                      ),
                                                      ),
                                                      Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                        decoration:BoxDecoration(
                                                          color: const Color(0xffFCD4FF),
                                                          borderRadius: BorderRadius.circular(50),
                                                        ),
                                                        child: const Text("Spécial", style: TextStyle(
                                                            fontSize: 11.0,
                                                            color: Color(0xff9B51E0),
                                                            fontWeight: FontWeight.w400,
                                                            fontStyle: FontStyle.normal,
                                                            fontFamily: "Inter"
                                                        ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const Text("Baffoussam, Entrée de la ville", style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: greyColor,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: "Inter"
                                                  ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset("assets/images/home_page/rounded-icon-red.png", width: 13, height: 13,),
                                                    const SizedBox(width: 5,),
                                                    const Text("25 Mai 2022", style: TextStyle(
                                                        fontSize: 7.0,
                                                        color: successTextColor,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: "Inter",
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset("assets/images/home_page/rounded-icon-black.png", width: 13, height: 13,),
                                                    const SizedBox(width: 5,),
                                                    const Text("28 Juin 2022", style: TextStyle(
                                                        fontSize: 7.0,
                                                        color: successTextColor,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: "Inter",
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              //crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Stack(children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0.0, top: 0.5,),
                                                    child: Material(
                                                      color: kPrimaryColor,
                                                      elevation: 4,
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                            radius: 13,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 16.0,),
                                                    child: Material(
                                                      color: kPrimaryColor,
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                            radius: 13,
                                                            backgroundImage: NetworkImage(
                                                              'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 32.0,),
                                                    child: Material(
                                                      color: kPrimaryColor,
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                            radius: 13,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 48.0,),
                                                    child: Material(
                                                      color: kPrimaryColor,
                                                      elevation: 4,
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                          radius: 12,
                                                          backgroundColor: whiteColor,
                                                          child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400),),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset("assets/images/home_page/ant-design_clock-circle-filled-blue.png", width: 19, height: 19,),
                                                const SizedBox(width: 5,),
                                                const Text("JJ-5", style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: Color(0xff2D68E6),
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                }else...{
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 320,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/home_page/bg-home3.png'),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  Positioned(
                    top: 45,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          //padding: EdgeInsets.zero,
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back, color: whiteColor, size: 25,),
                        ),
                        const Expanded(
                            child: Center(
                              child: Text("EidoEvents", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: whiteColor, fontStyle: FontStyle.normal, fontFamily: "Inter"),),
                            )
                        ),
                        InkWell(
                          //padding: EdgeInsets.zero,
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(DelegateLoginPage.pageName);
                            },
                            child: Image.asset("assets/images/home_page/calendar-icon.png", width: 19.89, height: 20,)
                        ),
                        const SizedBox(width: 15.47,),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color:whiteColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Badge(
                            position: BadgePosition.topStart(top: -2, start: 10),
                            badgeContent: null,
                            animationType: BadgeAnimationType.scale,
                            badgeColor: bottomNavSelected,
                            borderSide: const BorderSide(color: whiteColor),
                            child: InkWell(
                              //iconSize: 16,
                              //padding: const EdgeInsets.all(0.0),
                              //splashRadius: 10.0,  // (Material.defaultSplashRadius = 35.0)
                              //color: whiteColor.withOpacity(0.1),
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(NotificationsPageView.pageName);
                                },
                                child: Image.asset("assets/images/home_page/notification-icon.png", width: 16.57, height: 16.67,)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    right: 10.0,
                    top: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children:  const [
                            Text("Bienvenue",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23, color: whiteColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                            SizedBox(height: 5,),
                            Text("Mozart Modjo",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: whiteColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration:BoxDecoration(
                            color: bgAvatar,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage("assets/images/home_page/avatar.png"),
                            radius: 25,
                            //backgroundColor: Color(0xfff1f3f5),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 205,
                    left: 5,
                    right: 5,
                    child: Container(
                      //padding: const EdgeInsets.only(bottom: 30),
                      decoration:BoxDecoration(
                        //color: whiteColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 16,
                                spreadRadius: 0.2,
                                offset: const Offset(0, 8)),
                          ]
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        shadowColor: Colors.black.withOpacity(0.1),
                        child: Container(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 20),
                            width: double.infinity,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      Text("25",
                                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.55, color: labelColorTextField, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                      Text("Evènements crées", textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: successTextColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      Text("05",
                                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.55, color: greenColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                      Text("Evènements encours", textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: successTextColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      Text("22",
                                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.55, color: redColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                                      Text("Evènements expirés", textAlign: TextAlign.center,
                                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: successTextColor, fontFamily: "Inter", fontStyle: FontStyle.normal)),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: media.longestSide <= 775
                        ? screenAwareSize(308, context)
                        : screenAwareSize(323, context),
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 34.0,right: 34.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              colorCard("Emplacements", "assets/images/home_page/door.png", 56, "Enregistrés",context, const Color(0xff2D68E6), whiteColor),
                              const SizedBox(width: 10,),
                              colorCard("Abonnements", "assets/images/home_page/history.png", 22, "Payés",context, greyCardColor, successTextColor),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0, top: 36),
                          child: Card(
                            //shadowColor: Colors.black.withOpacity(0.1),
                            color: yellowCardColor,
                            elevation: 5.0,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0, top: 26),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Derniers évènements", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: successTextColor)),
                              Center(
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            print("voir Plus");
                                          },
                                          child: const Text("Voir plus",
                                            style: TextStyle(color: kPrimaryColor, fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 13.0, fontFamily: "Inter",),)),
                                      Image.asset("assets/images/home_page/arrow-right-red.png", width: 16, height: 16,),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            getBottomSheetMenu3();
                          },
                          child: Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                              decoration:BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 8,
                                      //spreadRadius: 0.2,
                                      //offset: const Offset(0, 8)
                                    ),
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 2.0,
                                          color: Colors.red,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  children: [
                                                    const Text("Anniversaire de la copine... ", style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: labelColorTextField,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: "Inter"
                                                    ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                      decoration:BoxDecoration(
                                                        color: const Color(0xffD4FFE6),
                                                        borderRadius: BorderRadius.circular(50),
                                                      ),
                                                      child: const Text("Classique", style: TextStyle(
                                                          fontSize: 11.0,
                                                          color: Color(0xff219653),
                                                          fontWeight: FontWeight.w400,
                                                          fontStyle: FontStyle.normal,
                                                          fontFamily: "Inter"
                                                      ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Text("Douala B'ssadi, 12ieme", style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/home_page/calendar-icon-red.png", width: 19, height: 19,),
                                          const SizedBox(width: 7.38,),
                                          const Expanded(
                                            child: Text("02 Avr - 03 avr 2022", style: TextStyle(
                                                fontSize: 11.0,
                                                color: successTextColor,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Inter",
                                                fontStyle: FontStyle.normal
                                            ),
                                            ),
                                          ),
                                          Expanded(
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset("assets/images/home_page/ant-design_clock-circle-filled.png", width: 19, height: 19,),
                                                const SizedBox(width: 5,),
                                                const Text("JJ-5", style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: redColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            getBottomSheetMenu3();
                          },
                          child: Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                              decoration:BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 8,
                                      //spreadRadius: 0.2,
                                      //offset: const Offset(0, 8)
                                    ),
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: const Color(0xffF2F2F2),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 47,
                                            width: 2.0,
                                            color: iconColor,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10.0, right: 0, top: 5.0, bottom: 5.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Wrap(
                                                    children: [
                                                      const Text("Mariage d'Alice ", style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: labelColorTextField,
                                                          fontWeight: FontWeight.w700,
                                                          fontStyle: FontStyle.normal,
                                                          fontFamily: "Inter"
                                                      ),
                                                      ),
                                                      Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                        decoration:BoxDecoration(
                                                          color: const Color(0xffFCD4FF),
                                                          borderRadius: BorderRadius.circular(50),
                                                        ),
                                                        child: const Text("Spécial", style: TextStyle(
                                                            fontSize: 11.0,
                                                            color: Color(0xff9B51E0),
                                                            fontWeight: FontWeight.w400,
                                                            fontStyle: FontStyle.normal,
                                                            fontFamily: "Inter"
                                                        ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const Text("Baffoussam, Entrée de la ville", style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: greyColor,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontFamily: "Inter"
                                                  ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset("assets/images/home_page/rounded-icon-red.png", width: 13, height: 13,),
                                                    const SizedBox(width: 5,),
                                                    const Text("25 Mai 2022", style: TextStyle(
                                                        fontSize: 7.0,
                                                        color: successTextColor,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: "Inter",
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset("assets/images/home_page/rounded-icon-black.png", width: 13, height: 13,),
                                                    const SizedBox(width: 5,),
                                                    const Text("28 Juin 2022", style: TextStyle(
                                                        fontSize: 7.0,
                                                        color: successTextColor,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: "Inter",
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              //crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Stack(children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0.0, top: 0.5,),
                                                    child: Material(
                                                      color: kPrimaryColor,
                                                      elevation: 4,
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                            radius: 13,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 16.0,),
                                                    child: Material(
                                                      color: kPrimaryColor,
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                            radius: 13,
                                                            backgroundImage: NetworkImage(
                                                              'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 32.0,),
                                                    child: Material(
                                                      color: kPrimaryColor,
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                            radius: 13,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 48.0,),
                                                    child: Material(
                                                      color: kPrimaryColor,
                                                      elevation: 4,
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                          radius: 12,
                                                          backgroundColor: whiteColor,
                                                          child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400),),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.asset("assets/images/home_page/ant-design_clock-circle-filled-blue.png", width: 19, height: 19,),
                                                const SizedBox(width: 5,),
                                                const Text("JJ-5", style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: Color(0xff2D68E6),
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                }
              ],
            )
          );

        });
  }



  Widget colorCard(
      String text, String pathIcon, int number, String unity, BuildContext context, Color color, Color textColor) {
    //final media = MediaQuery.of(context).size;
    return Container(
      //margin: const EdgeInsets.only(top: 15, right: 15),
      padding: const EdgeInsets.all(18),
      //height: 90 * MediaQuery.of(context).size.height / 650.0,
      //height: 136,
      //width: media.width / 2 - 25,
      //width: 149,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 16,
                spreadRadius: 0.4,
                offset: const Offset(0, 8)),
          ]),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              const SizedBox(width: 9,),
              Image.asset(pathIcon, width: 26.25, height: 31.49,),
            ],
          ),
          const SizedBox(height: 5.26,),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: textColor,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontFamily: "Inter"
            ),
          ),
          const SizedBox(height: 17,),
          Row(
            children: [
              Text(
                "$number",
                style: TextStyle(
                  fontSize: 23,
                  color: textColor,
                  fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: "Inter"
                ),
              ),
              const SizedBox(width: 3,),
              Text(
                unity,
                style: TextStyle(
                  fontSize: 11,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontFamily: "Inter"
                ),
              )
            ],
          )
        ],
      ),
    );
  }


  List<BottomSheetMenu> listBottomSheetMenu = [
    BottomSheetMenu("Configuration de Salle", Image.asset("assets/images/events/config-salle-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Modèles du billet", Image.asset("assets/images/events/model-billet-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Planning de l'évènement", Image.asset("assets/images/events/planing-event-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Historique de Paiement des billets", Image.asset("assets/images/events/historique-paiement-billets-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Liste des rubriques", Image.asset("assets/images/events/list-rubrique-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Liste des invités", Image.asset("assets/images/events/list-invite-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Liste des comptes associés", Image.asset("assets/images/events/liste-compte-associe-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Visualiser le QR Code", Image.asset("assets/images/events/see-qrcode-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Details de l'évènement", Image.asset("assets/images/events/details-event-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Suivi des activités", Image.asset("assets/images/events/suivi-activite-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Reporter l'évènement", Image.asset("assets/images/events/reporter-event-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Supprimer l'évènement", Image.asset("assets/images/events/supprimer-event-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
  ];

   getBottomSheetMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      //backgroundColor: Colors.transparent,
      builder: (context) {
        return InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            //color: const Color.fromRGBO(0, 0, 0, 0.001),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/home_page/bg-homepage-bottomsheet.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 13, top: 25, bottom: 33),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/home_page/bg-homepage-bottomsheet.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top:10, right: 10, left: 10),
                      //padding: EdgeInsets.only(left: 10, right: 10),
                      //color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            //padding: EdgeInsets.zero,
                            onTap: () => Navigator.of(context).pop(),
                            child: Image.asset("assets/images/home_page/arrow-left-black.png", width: 24, height: 24,)
                          ),
                          const SizedBox(width: 8,),
                          const Expanded(
                              child: Text("EidoEvents", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: titleProgramEventManage, fontStyle: FontStyle.normal, fontFamily: "Inter"),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/3,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/home_page/event_management_platform_op.webp"),
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: ListView.separated(
                        itemCount: listBottomSheetMenu.length,
                        itemBuilder: (_, position) {
                          return InkWell(
                            onTap: (){

                              //liste des comptes associés
                              if(position==2){
                                Navigator.of(context).pop();
                                Navigator.of(context).pushNamed(ProgramPageView.pageName);
                              }

                              //liste des invités
                              if(position==5){
                                Navigator.of(context).pop();
                                Navigator.of(context).pushNamed(GuestsListPageView.pageName);
                              }


                              //liste des comptes associés
                              if(position==6){
                                Navigator.of(context).pop();
                                Navigator.of(context).pushNamed(ListAssociateAccountPageView.pageName);
                              }
                            },
                            child: Container(
                                decoration:BoxDecoration(
                                  //color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                child: Row(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        listBottomSheetMenu[position].icon,
                                        const SizedBox(width: 8,),
                                        Text(listBottomSheetMenu[position].title,
                                          style: TextStyle(fontSize: 15, color: listBottomSheetMenu[position].color, fontWeight: FontWeight.w400, fontFamily: 'Inter', fontStyle: FontStyle.normal),),
                                      ],
                                    ),
                                    listBottomSheetMenu[position].arrowRight,
                                  ],
                                )
                            )
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                        return const Divider(height: 2,);
                      },
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
        );
      },
    );
  }

   getBottomSheetMenu2() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.75,
                builder: (_, controller) {
                  return Container(
                    padding: const EdgeInsets.only(left: 10, right: 13, top: 25, bottom: 33),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        //Icon(Icons.remove, color: Colors.grey[600],),
                        Expanded(
                          child: ListView.builder(
                            controller: controller,
                            itemCount: listBottomSheetMenu.length,
                            itemBuilder: (_, position) {
                              return InkWell(
                                onTap: (){

                                  //liste des comptes associés
                                  if(position==2){
                                    Navigator.of(context).pushNamed(ProgramPageView.pageName);
                                  }

                                  //liste des comptes associés
                                  if(position==6){
                                    Navigator.of(context).pushNamed(ListAssociateAccountPageView.pageName);
                                  }
                                },
                                child: Card(
                                  child: Container(
                                      decoration:BoxDecoration(
                                        //color: Colors.green,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                      child: Row(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              listBottomSheetMenu[position].icon,
                                              const SizedBox(width: 8,),
                                              Text(listBottomSheetMenu[position].title,
                                                style: const TextStyle(fontSize: 15, color: successTextColor, fontWeight: FontWeight.w400, fontFamily: 'Inter'),),
                                            ],
                                          ),
                                          listBottomSheetMenu[position].arrowRight,
                                        ],
                                      )
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

   getBottomSheetMenu3() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      //backgroundColor: Colors.transparent,
      builder: (context) {
        return InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 13, top: 25, bottom: 33),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/events/bg-homepage-bottomsheet.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height/3,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/events/event_bottomsheet.png"),
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: ListView.separated(
                        itemCount: listBottomSheetMenu.length,
                        itemBuilder: (_, position) {
                          return InkWell(
                              onTap: (){
                                //gestion des billets
                                if(position==1){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(ManageTicketsPageView.pageName);
                                }

                                //planing de l'évenement
                                if(position==2){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(ProgramPageView.pageName);
                                }

                                print("position=$position");

                                //liste des rubriques
                                if(position==4){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(RubriqueListPageView.pageName);
                                }


                                //liste des invités
                                if(position==5){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(GuestsListPageView.pageName);
                                }

                                //liste des comptes associés
                                if(position==6){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(ListAssociateAccountPageView.pageName);
                                }

                              },
                              child: Container(
                                  decoration:BoxDecoration(
                                    //color: Colors.green,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                                  child: Row(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          listBottomSheetMenu[position].icon,
                                          const SizedBox(width: 8,),
                                          Text(listBottomSheetMenu[position].title,
                                            style: TextStyle(fontSize: 15, color: listBottomSheetMenu[position].color, fontWeight: FontWeight.w400, fontFamily: 'Inter', fontStyle: FontStyle.normal),),
                                        ],
                                      ),
                                      listBottomSheetMenu[position].arrowRight,
                                    ],
                                  )
                              )
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                        return const Divider(height: 2,);
                      },
                      ),
                    ),
                  ],
                ),
              )
          ),
        );
      },
    );
  }

}



