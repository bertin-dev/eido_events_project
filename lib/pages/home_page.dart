
import 'package:badges/badges.dart';
import 'package:bottom_animation/bottom_animation.dart';
import 'package:eido_events_project/pages/delegate_account/delegate_login_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../models/bottom_sheet_menu.dart';
import 'associate_account/list_associate_account_page.dart';
import 'delegate_account/delegate_login_step2_page.dart';
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
          return Scaffold(
            //backgroundColor: Colors.green,
            resizeToAvoidBottomInset: true,
            key: scaffoldKey,
            appBar: AppBar(
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
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: bottomNavSelected,
              onPressed: () {
                print("floatingActionButton");
              },
              child: const Icon(Icons.add),
            ),
            body: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  //reverse: true,
                  //padding: const EdgeInsets.all(10),
                  //itemExtent: 100,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 242,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/home_page/bg-home.png'),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20.0, top: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children:  [
                                        Text("Bienvenue", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23, color: whiteColor),),
                                        SizedBox(height: hv*2,),
                                        Text("Mozart Modjo", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: whiteColor),),
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
                                        radius: 30,
                                        //backgroundColor: Color(0xfff1f3f5),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.only(top: 36, left: 10, right: 10),
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: const [
                                                Text("25", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.5471, color: labelColorTextField),),
                                                Text("Evènements crées", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: successTextColor),),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: const [
                                                Text("05", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.5471, color: greenColor),),
                                                Text("Evènements en cours", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: successTextColor),),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: const [
                                                Text("22", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.5471, color: redColor),),
                                                Text("Evènements expirés", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: successTextColor)),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              colorCard("Emplacements", "assets/images/home_page/door.png", 56, "Enregistrés",context, bottomNavSelected, whiteColor),
                              const SizedBox(width: 10,),
                              colorCard("Abonnements", "assets/images/home_page/history.png", 22, "Payés",context, greyCardColor, successTextColor),
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

                                            Expanded(child: Image.asset("assets/images/home_page/crown.png", width: 78.03,height: 66.76,))
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0, top: 24.53),
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
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.0),)),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: kPrimaryColor,
                                        size: 13,
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
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
                          },
                          child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 2.0,
                                          color: Colors.red,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Container(
                                                        child: Text("Anniversaire de la copine...", style: TextStyle(
                                                            fontSize: 16.0,
                                                            color: labelColorTextField,
                                                            fontWeight: FontWeight.w700
                                                        ),
                                                        ),
                                                      ),
                                                    ),
                                                    Chip(
                                                      backgroundColor: Color(0xffD4FFE6),
                                                      label: Align(
                                                        alignment: Alignment.center,
                                                        child: Container(
                                                          child: Text("Classique", style: TextStyle(
                                                              fontSize: 11.0,
                                                              color: Color(0xff219653),
                                                              fontWeight: FontWeight.w400
                                                          ),
                                                          ),
                                                        ),
                                                      ),)
                                                  ],
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    child: Text("Douala B'ssadi, 12ieme", style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: greyColor,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          color: kPrimaryColor,
                                          size: 25,
                                        ),
                                        const Expanded(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("02 Avr - 03 avr 2022", style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: successTextColor,
                                                  fontWeight: FontWeight.w500
                                              ),
                                              ),
                                            )
                                        ),

                                       Expanded(
                                         child:Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           Icon(
                                             Icons.history_rounded,
                                             color: kPrimaryColor,
                                             size: 25,
                                           ),
                                           SizedBox(width: 6.19,),
                                           Align(
                                             alignment: Alignment.topRight,
                                             child: Text("JJ-5", style: TextStyle(
                                                 fontSize: 11.0,
                                                 color: redColor,
                                                 fontWeight: FontWeight.w500
                                             ),
                                             ),
                                           )
                                         ],
                                       ),)

                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 2.0,
                                          //color: Colors.red,
                                          decoration: BoxDecoration(
                                            color: iconColor
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            color: Color(0xffF2F2F2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Container(
                                                          child: Text("Mariage d'Alice", style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: labelColorTextField,
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                      Chip(
                                                        backgroundColor: Color(0xffFCD4FF),
                                                        label: Align(
                                                          alignment: Alignment.center,
                                                          child: Container(
                                                            child: Text("Spécial", style: TextStyle(
                                                                fontSize: 11.0,
                                                                color: Color(0xff9B51E0),
                                                                fontWeight: FontWeight.w400
                                                            ),
                                                            ),
                                                          ),
                                                        ),)
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text("Baffoussam entrée de la ville", style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: greyColor,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          color: kPrimaryColor,
                                          size: 25,
                                        ),
                                        const Expanded(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Jeudi 25 - Sam 28", style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: successTextColor,
                                                  fontWeight: FontWeight.w500
                                              ),
                                              ),
                                            )
                                        ),


                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0.0, left: 0.0, bottom: 0.0),
                                            child: Row(
                                              children: [
                                                Stack(children: [
                                                  // Material(
                                                  //   elevation: 0,
                                                  //   borderRadius: BorderRadius.circular(100),
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.only(top: 2.0),
                                                  //     child: CircleAvatar(
                                                  //         radius: 10,
                                                  //         backgroundImage: NetworkImage(
                                                  //           'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78',
                                                  //         )),
                                                  //   ),
                                                  // ),

                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 0.0,
                                                      top: 0.5,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 16.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 32.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 48.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                          radius: 10,
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
                                        ),


                                        Expanded(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.history_rounded,
                                                color: iconColor,
                                                size: 25,
                                              ),
                                              SizedBox(width: 6.19,),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text("JJ-55", style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: iconColor,
                                                    fontWeight: FontWeight.w500
                                                ),
                                                ),
                                              )
                                            ],
                                          ),)

                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),

                        InkWell(
                          onTap: (){},
                          child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 2.0,
                                          //color: Colors.red,
                                          decoration: BoxDecoration(
                                              color: iconColor
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            color: Color(0xffF2F2F2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Container(
                                                          child: Text("Mariage d'Alice", style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: labelColorTextField,
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                      Chip(
                                                        backgroundColor: Color(0xffFCD4FF),
                                                        label: Align(
                                                          alignment: Alignment.center,
                                                          child: Container(
                                                            child: Text("Spécial", style: TextStyle(
                                                                fontSize: 11.0,
                                                                color: Color(0xff9B51E0),
                                                                fontWeight: FontWeight.w400
                                                            ),
                                                            ),
                                                          ),
                                                        ),)
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text("Baffoussam entrée de la ville", style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: greyColor,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          color: kPrimaryColor,
                                          size: 25,
                                        ),
                                        const Expanded(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Jeudi 25 - Sam 28", style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: successTextColor,
                                                  fontWeight: FontWeight.w500
                                              ),
                                              ),
                                            )
                                        ),


                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0.0, left: 0.0, bottom: 0.0),
                                            child: Row(
                                              children: [
                                                Stack(children: [
                                                  // Material(
                                                  //   elevation: 0,
                                                  //   borderRadius: BorderRadius.circular(100),
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.only(top: 2.0),
                                                  //     child: CircleAvatar(
                                                  //         radius: 10,
                                                  //         backgroundImage: NetworkImage(
                                                  //           'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78',
                                                  //         )),
                                                  //   ),
                                                  // ),

                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 0.0,
                                                      top: 0.5,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 16.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 32.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 48.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                          radius: 10,
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
                                        ),


                                        Expanded(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.history_rounded,
                                                color: iconColor,
                                                size: 25,
                                              ),
                                              SizedBox(width: 6.19,),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text("JJ-55", style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: iconColor,
                                                    fontWeight: FontWeight.w500
                                                ),
                                                ),
                                              )
                                            ],
                                          ),)

                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 2.0,
                                          //color: Colors.red,
                                          decoration: BoxDecoration(
                                              color: iconColor
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            color: Color(0xffF2F2F2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Container(
                                                          child: Text("Mariage d'Alice", style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: labelColorTextField,
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                      Chip(
                                                        backgroundColor: Color(0xffFCD4FF),
                                                        label: Align(
                                                          alignment: Alignment.center,
                                                          child: Container(
                                                            child: Text("Spécial", style: TextStyle(
                                                                fontSize: 11.0,
                                                                color: Color(0xff9B51E0),
                                                                fontWeight: FontWeight.w400
                                                            ),
                                                            ),
                                                          ),
                                                        ),)
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text("Baffoussam entrée de la ville", style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: greyColor,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          color: kPrimaryColor,
                                          size: 25,
                                        ),
                                        const Expanded(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Jeudi 25 - Sam 28", style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: successTextColor,
                                                  fontWeight: FontWeight.w500
                                              ),
                                              ),
                                            )
                                        ),


                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0.0, left: 0.0, bottom: 0.0),
                                            child: Row(
                                              children: [
                                                Stack(children: [
                                                  // Material(
                                                  //   elevation: 0,
                                                  //   borderRadius: BorderRadius.circular(100),
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.only(top: 2.0),
                                                  //     child: CircleAvatar(
                                                  //         radius: 10,
                                                  //         backgroundImage: NetworkImage(
                                                  //           'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78',
                                                  //         )),
                                                  //   ),
                                                  // ),

                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 0.0,
                                                      top: 0.5,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 16.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 32.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 48.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                          radius: 10,
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
                                        ),


                                        Expanded(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.history_rounded,
                                                color: iconColor,
                                                size: 25,
                                              ),
                                              SizedBox(width: 6.19,),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text("JJ-55", style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: iconColor,
                                                    fontWeight: FontWeight.w500
                                                ),
                                                ),
                                              )
                                            ],
                                          ),)

                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 2.0,
                                          //color: Colors.red,
                                          decoration: BoxDecoration(
                                              color: iconColor
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            color: Color(0xffF2F2F2),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Container(
                                                          child: Text("Mariage d'Alice", style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: labelColorTextField,
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                      Chip(
                                                        backgroundColor: Color(0xffFCD4FF),
                                                        label: Align(
                                                          alignment: Alignment.center,
                                                          child: Container(
                                                            child: Text("Spécial", style: TextStyle(
                                                                fontSize: 11.0,
                                                                color: Color(0xff9B51E0),
                                                                fontWeight: FontWeight.w400
                                                            ),
                                                            ),
                                                          ),
                                                        ),)
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text("Baffoussam entrée de la ville", style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: greyColor,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          color: kPrimaryColor,
                                          size: 25,
                                        ),
                                        const Expanded(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Jeudi 25 - Sam 28", style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: successTextColor,
                                                  fontWeight: FontWeight.w500
                                              ),
                                              ),
                                            )
                                        ),


                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0.0, left: 0.0, bottom: 0.0),
                                            child: Row(
                                              children: [
                                                Stack(children: [
                                                  // Material(
                                                  //   elevation: 0,
                                                  //   borderRadius: BorderRadius.circular(100),
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.only(top: 2.0),
                                                  //     child: CircleAvatar(
                                                  //         radius: 10,
                                                  //         backgroundImage: NetworkImage(
                                                  //           'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78',
                                                  //         )),
                                                  //   ),
                                                  // ),

                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 0.0,
                                                      top: 0.5,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 16.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 32.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius:
                                                      BorderRadius.circular(100),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: CircleAvatar(
                                                            radius: 9,
                                                            backgroundImage: NetworkImage(
                                                              'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: 48.0,
                                                    ),
                                                    child: Material(
                                                      elevation: 4,
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: CircleAvatar(
                                                          radius: 10,
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
                                        ),


                                        Expanded(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.history_rounded,
                                                color: iconColor,
                                                size: 25,
                                              ),
                                              SizedBox(width: 6.19,),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text("JJ-55", style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: iconColor,
                                                    fontWeight: FontWeight.w500
                                                ),
                                                ),
                                              )
                                            ],
                                          ),)

                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ],
                    ),

                  ],
                )

              ],
            ),
          );

        });
  }



  Widget colorCard(
      String text, String pathIcon, int number, String unity, BuildContext context, Color color, Color textColor) {
    //final media = MediaQuery.of(context).size;
    return Container(
      //margin: const EdgeInsets.only(top: 15, right: 15),
      padding: const EdgeInsets.all(25),
      //height: 90 * MediaQuery.of(context).size.height / 650.0,
      //height: 136,
      //width: media.width / 2 - 25,
      //width: 149,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        /*boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: 0.2,
                offset: Offset(0, 8)),
          ]*/),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(pathIcon, width: 26.25, height: 31.49,),
          const SizedBox(height: 5,),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: textColor,
              fontWeight: FontWeight.w400,
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
                ),
              ),
              SizedBox(width: 2,),
              Text(
                unity,
                style: TextStyle(
                  fontSize: 11,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }


  List<BottomSheetMenu> listBottomSheetMenu = [
    BottomSheetMenu("Configuration de Salle", Image.asset("assets/images/home_page/config-salle.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Modèles du billet", Image.asset("assets/images/home_page/model-billet.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Planning de l'évènement", Image.asset("assets/images/home_page/planing-event.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Partager le lien invité", Image.asset("assets/images/home_page/partager-lien.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Liste des rubriques", Image.asset("assets/images/home_page/list-rubrique.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Liste des invités", Image.asset("assets/images/home_page/list-invite.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Liste des comptes associés", Image.asset("assets/images/home_page/liste-compte-associe.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Visualiser le QR Code", Image.asset("assets/images/home_page/see-qrcode.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Details de l'évènement", Image.asset("assets/images/home_page/details-event.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Suivi des activités", Image.asset("assets/images/home_page/suivi-activite.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Reporter l'évènement", Image.asset("assets/images/home_page/reporter-event.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
    BottomSheetMenu("Supprimer l'évènement", Image.asset("assets/images/home_page/supprimer-event.png", width: 20, height: 20,), const Icon(Icons.arrow_forward, size: 16,)),
  ];
}



