import 'package:badges/badges.dart';
import 'package:eido_events_project/pages/events/host_create/panier_items_list_page.dart';
import 'package:eido_events_project/pages/events/host_create/program_events_home_details_page.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/program_model.dart';
import '../../../utils/screen_size.dart';
import '../../../widgets/custom_widgets.dart';

class ProgramEventsHomePageView extends StatefulWidget {
  static const String pageName = "events/host_create/program_events_home_page";
  const ProgramEventsHomePageView({Key? key}) : super(key: key);

  @override
  State<ProgramEventsHomePageView> createState() => _ProgramEventsHomePageViewState();
}

class _ProgramEventsHomePageViewState extends State<ProgramEventsHomePageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  List<ProgramModel> listProgramModel = [];
  late int counter = 0;
  String checkedIcon = "assets/images/events/check-box.png";
  String checkedIconSelected = "assets/images/events/check-box-green.png";

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    listProgramModel.add(ProgramModel(
        title: "Anniversaire de la copine de mon beau-frere",
        location: 'Au marché de Mfou',
        startDate: '1 JUIN 2023 * 14:00',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/events/img1.png"));
    listProgramModel.add(ProgramModel(
        title: "Anniversaire de la copine de mon beau-frere",
        location: 'Au palais des sports',
        startDate: 'Jeudi 25 jan 2020',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/events/img2.png"));
    listProgramModel.add(ProgramModel(
        title: "Anniversaire de la copine de mon beau-frere",
        location: 'Douala Bonamoussadi, Cameroun',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: null,
        unity: null,
        isPackage: true,
        img: "assets/images/events/img3.png"));
    listProgramModel.add(ProgramModel(
        title: "Anniversaire de la copine de mon beau-frere",
        location: 'Au marché de Mfou',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/events/img4.png"));

    for(var dev in listProgramModel){
      if(dev.isChecked!){
        counter++;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          final media = MediaQuery.of(context).size;
          return Scaffold(
            //backgroundColor: whiteColor,
            resizeToAvoidBottomInset: false,
            body: ListView(
              padding: EdgeInsets.zero,
              //physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  //color: Colors.grey.shade50,
                  height: media.height/2.5+1,//242,
                  child: Stack(
                    children: <Widget>[
                      Material(
                        elevation: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: const AssetImage('assets/images/events/img-wedding.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop)
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: media.longestSide <= 775
                            ? screenAwareSize(20, context)
                            : screenAwareSize(35, context),
                        left: 1,
                        right: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, top: 15, right: 9),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Image.asset('assets/images/events/close-event-icon.png', width: 32, height: 32,),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                      const SizedBox(width: 7,),
                                      const Text("Eido events", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: whiteColor),textAlign: TextAlign.left,),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color:whiteColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Badge(
                                      position: BadgePosition.topStart(top: -6, start: 10),
                                      badgeContent: const Text("3", style: TextStyle(color: whiteColor, fontSize: 7.7, fontWeight: FontWeight.w400, ),),
                                      animationType: BadgeAnimationType.scale,
                                      badgeColor: titleProgramEventManage,
                                      borderSide: const BorderSide(color: titleProgramEventManage),
                                      child: InkWell(
                                        //iconSize: 16,
                                        //padding: const EdgeInsets.all(0.0),
                                        //splashRadius: 10.0,  // (Material.defaultSplashRadius = 35.0)
                                        //color: whiteColor.withOpacity(0.1),
                                          onTap: () {

                                            Navigator.of(context, rootNavigator: true).pushNamed(PanierItemsListPageView.pageName,
                                            arguments: {
                                              "listProgramModel": listProgramModel
                                            });
                                          },
                                          child: Image.asset("assets/images/events/panier.png", width: 20, height: 20,)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.only(left: 7, bottom: 30, right: 50),
                          child: const Text("Mariage d'Aicha et de Michel pour leur bonheur ", style: TextStyle(
                              fontSize: 20.0, color: Color(0xffFFFAFB), fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontFamily: "Inter"),
                          ),
                        ),
                      )


                    ],
                  ),
                ),

                ColoredBox(
                  color: whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Nos programmes ", style: TextStyle(
                              fontSize: 18.0, color: labelColorTextField, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontFamily: "Inter"),
                          ),
                          Divider(height: 18, color: Color(0xffC90A42), endIndent: 245, thickness: 2.0,),
                          SizedBox(height: 10,),
                        ],
                      ),
                      ),

                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: listProgramModel.length,
                        itemBuilder: (_, position){
                          return Container(
                            padding: const EdgeInsets.only(bottom: 13),
                            child: InkWell(
                              splashColor: Colors.grey,
                              onTap: (){
                                setState(() {
                                 Navigator.of(context)
                                      .pushNamed(ProgramEventsHomeDetailsPageView.pageName, arguments: {
                                    "listProgramModel": listProgramModel[position]
                                  });
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.only(left: 0, top: 8.0, right: 8, bottom: 8),
                                decoration:BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 16,
                                          spreadRadius: 0.2,
                                          offset: const Offset(0, 8)),
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Image.asset(listProgramModel[position].img!, width: 79, height: 92,),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 0,),
                                          Text(listProgramModel[position].startDate,
                                            style:const TextStyle(fontSize: 10, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),

                                          const SizedBox(height: 4,),
                                          Text(listProgramModel[position].title,
                                            style:const TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                          const SizedBox(height: 8,),
                                          if(listProgramModel[position].isPackage!)...{
                                            InkWell(
                                              onTap:(){
                                                Navigator.of(context)
                                                    .pushNamed(ProgramEventsHomeDetailsPageView.pageName, arguments: {
                                                  "listProgramModel": listProgramModel[position]
                                                });
                                              },
                                              child: Container(
                                                //margin: const EdgeInsets.symmetric(vertical: 5),
                                                padding: const EdgeInsets.all(10),
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffE6F2FF)
                                                ),
                                                child: const Text("Voir Packages",
                                                  style:TextStyle(fontSize: 17, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Impact",), textAlign: TextAlign.center,),
                                              ),
                                            )
                                          }else...{
                                            Container(
                                              //margin: const EdgeInsets.symmetric(vertical: 5),
                                              padding: const EdgeInsets.all(10),
                                              decoration: const BoxDecoration(
                                                  color: Color(0xffE6F2FF)
                                              ),
                                              child: Text("${listProgramModel[position].amount} ${listProgramModel[position].unity}",
                                                style:const TextStyle(fontSize: 17, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Impact",), textAlign: TextAlign.center,),
                                            ),
                                          },
                                          const SizedBox(height: 9,),
                                          Row(
                                            children: [
                                              Image.asset("assets/images/events/location-event-icon.png", width: 14, height: 14,),
                                              const SizedBox(width: 6,),
                                              Text(listProgramModel[position].location,
                                                style:const TextStyle(fontSize: 10, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,)
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),



                     /* Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        height: 92.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            const SizedBox(width: 15,),
                            Container(
                              width: 120,
                              color: grayLocation,
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("vin+honneur",
                                        style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                    const SizedBox(height: 5,),
                                    RichText(
                                      text: TextSpan(
                                        //style: TextStyle(color: Colors.red, fontSize: 16),
                                        children: [
                                          const TextSpan(text: "250 000",
                                              style:TextStyle(fontSize: 19, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(0.0, -12.0),
                                              child: const Text("XAF",
                                                style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 40,),
                                    Center(
                                      child: Image.asset("assets/images/events/check-box-square.png", width: 16, height: 16,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            Container(
                              width: 120,
                              color: grayLocation,
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: <Widget>[
                                        InkWell(
                                          onTap: (){
                                            print("ajouter package 2");
                                          },
                                          child: Center(
                                            child: Image.asset("assets/images/events/check-box-square.png", width: 16, height: 16,),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Center(
                                      child: Column(
                                        children: [
                                          const Text("vin+honneur",
                                              style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                          const SizedBox(height: 5,),
                                          RichText(
                                            text: TextSpan(
                                              //style: TextStyle(color: Colors.red, fontSize: 16),
                                              children: [
                                                const TextSpan(text: "250 000",
                                                    style:TextStyle(fontSize: 19, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                                WidgetSpan(
                                                  child: Transform.translate(
                                                    offset: const Offset(0.0, -12.0),
                                                    child: const Text("XAF",
                                                      style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )


                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            Container(
                              width: 120,
                              color: grayLocation,
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Messe+Eclarage",
                                        style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                    const SizedBox(height: 5,),
                                    RichText(
                                      text: TextSpan(
                                        //style: TextStyle(color: Colors.red, fontSize: 16),
                                        children: [
                                          const TextSpan(text: "250 000",
                                              style:TextStyle(fontSize: 19, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(0.0, -12.0),
                                              child: const Text("XAF",
                                                style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Image.asset("assets/images/events/check-box-square.png", width: 16, height: 16,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //margin: const EdgeInsets.only(top: 10, bottom: 10),
                        //padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 2),
                        decoration:BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1.0, color: kPrimaryColor),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(checkedIcon, width: 20, height: 20,)
                              ],
                            ),

                            ListTile(
                              enabled: true,
                              selected: true,
                              selectedColor: Colors.green,
                              selectedTileColor: Colors.black,
                              leading: Container(
                                //padding: const EdgeInsets.only(bottom: 8.0),
                                child: Image.asset("assets/images/manage_event_programs/calendar-img.png"),
                              ),
                              title: const Text("Dote d'Aicha et Martial",
                                style:TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: Text("Au marché de Mfou",
                                      style:TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                  ),
                                  Row(children: [
                                    RichText(
                                      text: TextSpan(
                                        //style: TextStyle(color: Colors.red, fontSize: 16),
                                        children: [
                                          const TextSpan(text: "750000",
                                              style:TextStyle(fontSize: 20.578, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(0.0, -12.0),
                                              child: const Text("XAF",
                                                style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],)

                                ],
                              ),

                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 34),
                        child: CustomButton(
                          color: kPrimaryColor,
                          text: 'Continuer',
                          textColor: Colors.white,
                          onPressed: () async {
                            //Navigator.of(context, rootNavigator: true).pushNamed(AddNewEventStep2PageView.pageName);
                          },
                        ),
                      ),*/



                    ],
                  ),
                ),

                const SizedBox(height: 26,)
              ],
            ),
          );
        });
  }
}

