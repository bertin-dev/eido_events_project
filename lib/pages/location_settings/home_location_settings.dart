import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';

import '../../models/events_delegate_details_model.dart';
import '../../models/events_delegate_model.dart';
import '../../models/location_settings_model.dart';
import 'add_location_settings.dart';
import 'edit_location_settings.dart';

class HomeLocationSettingsPageView extends StatefulWidget {
  const HomeLocationSettingsPageView({Key? key}) : super(key: key);
  static const String pageName = "home_location_settings";

  @override
  _HomeLocationSettingsState createState() => _HomeLocationSettingsState();
}

class _HomeLocationSettingsState extends State<HomeLocationSettingsPageView> {
  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          return Scaffold(
            backgroundColor: whiteColor,
            body: Stack(
              //fit: StackFit.expand,
              children: [
                Container(
                  height: 135,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/location_settings/bg_location.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
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

                        const Expanded(child: Text("Emplacements Enregistrés",
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: whiteColor,
                              fontFamily: "Inter"),textAlign: TextAlign.center,),),

                        IconButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                      .pushNamed(AddLocationSettingsPageView.pageName);
                          },
                          icon: Image.asset("assets/images/location_settings/plus.png",
                            width: 30,
                            height: 30,),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  //color: Colors.green,
                  padding: const EdgeInsets.only(left: 9, right: 10, top: 100),
                  child: ListView.builder(
                    itemCount: locationSettings.length,
                    itemBuilder: (BuildContext context, int position) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 3, top: 3),
                            decoration:BoxDecoration(
                            color: locationSettings[position].bgColor,
                            borderRadius: BorderRadius.circular(200),
                          ),
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side:const BorderSide(color: Colors.green),),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: ListTile(
                                enabled: true,
                                onTap: (){
                                  Navigator.of(context)
                                      .pushNamed(EditLocationSettingsPageView.pageName, arguments: {
                                    "title": locationSettings[position].headerItem,
                                    "locationSettings": locationSettings.first
                                  });
                                },
                                leading: Container(
                                  padding: const EdgeInsets.only(left: 11.0, bottom: 12, top: 13, right: 11),
                                  decoration:BoxDecoration(
                                    color: locationSettings[position].bgLeading,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Image.asset(locationSettings[position].leading,
                                    )
                                ),
                                title: Text(locationSettings[position].headerItem,
                                  style: const TextStyle(fontFamily: "Inter", fontSize: 14, fontWeight: FontWeight.w700, color: labelColorTextField),),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 13.0, bottom: 0.0,),
                                  child: Row(
                                    children: [
                                      Stack(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 0.0,
                                            top: 0.5,
                                          ),
                                          child: Image.asset(locationSettings[position].smallIcon,
                                            width: 30, height: 30,)
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16.0,
                                          ),
                                          child: Image.asset(locationSettings[position].smallIcon,
                                            width: 30, height: 30,)
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32.0,
                                          ),
                                          child: Image.asset(locationSettings[position].smallIcon,
                                            width: 30, height: 30,)
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top:5.0, right: 1.0, left: 65.0),
                                          child: Text(locationSettings[position].locationNumber,
                                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: "Inter", color: titleProgramEventManage),),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward, size: 24, color: locationSettings[position].iconColor,),
                              ),
                            )
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<LocationSettingsModel> locationSettings = <LocationSettingsModel>[
    LocationSettingsModel(
        headerItem: 'Douala bar 2022',
        desc: 'bonjour bonjour',
        bgColor: const Color(0xffCCF9FF),
        txtColor: kPrimaryColor,
        leading: "assets/images/delegate_account/event_details_blue.png",
        smallIcon: "assets/images/location_settings/small_location_blue.png",
        locationNumber: "+32",
        iconColor: const Color(0xff05B7D4),
        bgLeading: const Color(0xffA0F1FF),
    ),
    LocationSettingsModel(
      headerItem: 'Akwa Palace Hôtel 2022',
      desc: 'centre ville',
      bgColor: const Color(0xffCCFFCE),
      txtColor: kPrimaryColor,
      leading: "assets/images/delegate_account/event_details_green.png",
      smallIcon: "assets/images/delegate_account/small_location_green.png",
      locationNumber: "+32",
      iconColor: const Color(0xff05D40D),
      bgLeading: const Color(0xffA0FFA3),
    ),
    LocationSettingsModel(
      headerItem: 'Douala bar 2022',
      desc: 'bonjour bonjour',
      bgColor: const Color(0xffFFFDCC),
      txtColor: kPrimaryColor,
      leading: "assets/images/delegate_account/event_details_yellow.png",
      smallIcon: "assets/images/delegate_account/small_location_yellow.png",
      locationNumber: "+32",
      iconColor: const Color(0xffD4CC05),
      bgLeading: const Color(0xffFFFBA0),
    ),
    LocationSettingsModel(
      headerItem: 'Akwa Palace Hôtel 2022',
      desc: 'centre ville',
      bgColor: const Color(0xffFFDFCC),
      txtColor: kPrimaryColor,
      leading: "assets/images/delegate_account/event_details_orange.png",
      smallIcon: "assets/images/location_settings/small_location_orange.png",
      locationNumber: "+32",
      iconColor: kPrimaryColor,
      bgLeading: const Color(0xffFFC3A0),
    ),
    LocationSettingsModel(
      headerItem: 'Douala bar 2022',
      desc: 'bonjour bonjour',
      bgColor: const Color(0xffCDCCFF),
      txtColor: kPrimaryColor,
      leading: "assets/images/delegate_account/event_details_fullblue.png",
      smallIcon: "assets/images/delegate_account/small_location_fullblue.png",
      locationNumber: "+32",
      iconColor: const Color(0xff0905D4),
      bgLeading: const Color(0xffA1A0FF),
    ),
    LocationSettingsModel(
      headerItem: 'Akwa Palace Hôtel 2022',
      desc: 'centre ville',
      bgColor: const Color(0xffFFDFCC),
      txtColor: kPrimaryColor,
      leading: "assets/images/delegate_account/event_details_orange.png",
      smallIcon: "assets/images/location_settings/small_location_orange.png",
      locationNumber: "+32",
      iconColor: kPrimaryColor,
      bgLeading: const Color(0xffFFC3A0),
    ),
    LocationSettingsModel(
      headerItem: 'Douala bar 2022',
      desc: 'bonjour bonjour',
      bgColor: const Color(0xffCCF9FF),
      txtColor: kPrimaryColor,
      leading: "assets/images/delegate_account/event_details_blue.png",
      smallIcon: "assets/images/location_settings/small_location_blue.png",
      locationNumber: "+32",
      iconColor: const Color(0xff05B7D4),
      bgLeading: const Color(0xffA0F1FF),
    ),
    LocationSettingsModel(
      headerItem: 'Akwa Palace Hôtel 2022',
      desc: 'centre ville',
      bgColor: const Color(0xffFFDFCC),
      txtColor: kPrimaryColor,
      leading: "assets/images/delegate_account/event_details_orange.png",
      smallIcon: "assets/images/location_settings/small_location_orange.png",
      locationNumber: "+32",
      iconColor: kPrimaryColor,
      bgLeading: const Color(0xffFFC3A0),
    ),
  ];
}
