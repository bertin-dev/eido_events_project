
import 'package:badges/badges.dart';
import 'package:eido_events_project/pages/guests_space/program_guest_page.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/program_model.dart';
import '../../utils/screen_size.dart';
import '../../widgets/custom_widgets.dart';
import '../events/host_create/program_events_home_details_page.dart';

class GuestsSpaceDetailPageView extends StatefulWidget {
  ProgramModel listProgramModel;
  static const String pageName = "guests_space/detail";
  GuestsSpaceDetailPageView({Key? key, required this.listProgramModel}) : super(key: key);

  @override
  State<GuestsSpaceDetailPageView> createState() => _GuestsSpaceDetailPageViewState();
}

class _GuestsSpaceDetailPageViewState extends State<GuestsSpaceDetailPageView> {

  @override
  void initState() {
    super.initState();
    print(widget.listProgramModel.isPackage);
    print(widget.listProgramModel.location);
  }


  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final media = MediaQuery.of(context).size;
          return Scaffold(
            //backgroundColor: whiteColor,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: <Widget>[
                SizedBox(
                  height: media.height/1.5,
                  child: Material(
                    elevation: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage(widget.listProgramModel.img!),
                          fit: BoxFit.cover,
                          //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop)
                        ),
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
                    padding: const EdgeInsets.only(left: 0, top: 22, right: 9),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: Image.asset('assets/images/events/arrow-rounded-left-back.png', width: 32, height: 32,),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
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
                                badgeColor: const Color(0xff2D68E6),
                                borderSide: const BorderSide(color: whiteColor),
                                child: InkWell(
                                  //iconSize: 16,
                                  //padding: const EdgeInsets.all(0.0),
                                  //splashRadius: 10.0,  // (Material.defaultSplashRadius = 35.0)
                                  //color: whiteColor.withOpacity(0.1),
                                    onTap: () {
                                      print("Clique sur la notif");
                                    },
                                    child: Image.asset("assets/images/home_page/notification-icon.png", width: 16.57, height: 16.67,)
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)),
                  ),
                  margin: EdgeInsets.only(top: media.longestSide <= 775
                      ? screenAwareSize(350, context)
                      : screenAwareSize(400, context),
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ListView(
                    padding: const EdgeInsets.only(left: 24, right: 25, top: 27),
                    children: [
                      Text(widget.listProgramModel.title,
                        style:const TextStyle(fontSize: 18, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                      const SizedBox(height: 23,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/events/ant-design_clock-circle-filled.png", width: 15, height: 15,),
                                    const SizedBox(width: 8,),
                                    Text(widget.listProgramModel.startDate,
                                      style:const TextStyle(fontSize: 12.36, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                  ],
                                ),
                                const SizedBox(height: 7.07,),
                                Row(
                                  children: [
                                    Image.asset("assets/images/events/ant-design_clock-circle-filled.png", width: 15, height: 15,),
                                    const SizedBox(width: 8,),
                                    Text(widget.listProgramModel.endDate!,
                                      style:const TextStyle(fontSize: 12.36, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                  ],
                                ),
                                const SizedBox(height: 7.07,),
                                Row(
                                  children: [
                                    Image.asset("assets/images/events/location-event-icon.png", width: 15, height: 15,),
                                    const SizedBox(width: 8,),
                                    Expanded(
                                      child: Text(widget.listProgramModel.location,
                                        style:const TextStyle(fontSize: 13.87, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 23, top:5),
                                  child: Text("Voir itineraire",
                                    style:TextStyle(fontSize: 11, color: kPrimaryColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap:(){
                                /*Navigator.of(context)
                                    .pushNamed(ProgramEventsHomeDetailsPageView.pageName, arguments: {
                                  "listProgramModel": widget.listProgramModel
                                });*/
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Color(0xffE6F2FF)
                                ),
                                child: const Text("Rubriques",
                                  style:TextStyle(fontSize: 17, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Impact",), textAlign: TextAlign.center,),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40,),
                      const Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit. A amet cumque delectus et excepturi fugit illum labore maxime minus nihil odit, quaerat quidem ratione reiciendis similique suscipit tempora ullam veniam.",
                        style:TextStyle(fontSize: 14, color: blackColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),

                      const SizedBox(height: 22,),
                      CustomButton(
                        color: kPrimaryColor,
                        text: 'Solliciter un serveur',
                        textColor: Colors.white,
                        textSize: 13.0,
                        onPressed: () async {
                          Navigator.of(context)
                              .pushNamed(ProgramGuestPageView.pageName, arguments: {
                            "listProgramModel": widget.listProgramModel
                          });
                        },
                      ),
                      const SizedBox(height: 24,)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
