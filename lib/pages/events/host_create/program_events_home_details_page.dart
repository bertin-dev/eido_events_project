import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/program_model.dart';
import '../../../utils/screen_size.dart';
import '../../../widgets/custom_widgets.dart';

class ProgramEventsHomeDetailsPageView extends StatefulWidget {
  static const String pageName = "events/host_create/program_events_home_details_page";
  ProgramModel listProgramModel;
  ProgramEventsHomeDetailsPageView({Key? key, required this.listProgramModel}) : super(key: key);

  @override
  State<ProgramEventsHomeDetailsPageView> createState() => _ProgramEventsHomeDetailsPageViewState();
}

class _ProgramEventsHomeDetailsPageViewState extends State<ProgramEventsHomeDetailsPageView> {
  //late final GlobalKey<ScaffoldState> _scaffoldKey;
  late int counter = 0;
  String checkedIcon = "assets/images/events/check-box.png";
  String checkedIconSelected = "assets/images/events/check-box-green.png";

  @override
  void initState() {
    super.initState();
    print(widget.listProgramModel.isPackage);
    print(widget.listProgramModel.location);
    //_scaffoldKey = GlobalKey<ScaffoldState>();

    /*for(var dev in widget.listProgramModel){
      if(dev.isChecked!){
        counter++;
      }
    }*/
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
            body: Stack(
              children: <Widget>[
                SizedBox(
                  height: media.height/1.5,
                  child: Material(
                    elevation: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/images/events/weeding-detail.png'),
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
                                      //Navigator.of(context, rootNavigator: true).pushNamed(NotificationsPageView.pageName);
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
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Image.asset("assets/images/events/location-event-icon.png", width: 15, height: 15,),
                                    const SizedBox(width: 8,),
                                    Expanded(
                                      child: Text(widget.listProgramModel.location,
                                        style:const TextStyle(fontSize: 13.87, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          if(widget.listProgramModel.isPackage!)...{
                            Expanded(
                              child: InkWell(
                                onTap:(){
                                  Navigator.of(context)
                                      .pushNamed(ProgramEventsHomeDetailsPageView.pageName, arguments: {
                                    "listProgramModel": widget.listProgramModel
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffE6F2FF)
                                  ),
                                  child: const Text("Voir Package",
                                    style:TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Impact",), textAlign: TextAlign.center,),
                                ),
                              ),
                            )
                          }else...{
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(9),
                                decoration: const BoxDecoration(
                                    color: Color(0xffE6F2FF)
                                ),
                                child: Text("${widget.listProgramModel.amount} ${widget.listProgramModel.unity}",
                                  style:const TextStyle(fontSize: 17, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Impact",), textAlign: TextAlign.center,),
                              ),
                            )
                          },
                        ],
                      ),
                      const SizedBox(height: 31,),
                      const Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit. A amet cumque delectus et excepturi fugit illum labore maxime minus nihil odit, quaerat quidem ratione reiciendis similique suscipit tempora ullam veniam.",
                        style:TextStyle(fontSize: 14, color: blackColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),

                      if(widget.listProgramModel.isPackage!)...{
                        const SizedBox(height: 23,),
                        const Text("Nos Packages",style:TextStyle(fontSize: 13, color: blackColor, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                        Container(
                          margin: const EdgeInsets.only(top: 12.0, bottom: 23),
                          height: 92.0,
                          child: ListView(
                            primary: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                width: 120,
                                color: titleProgramEventManage,
                                child: Stack(
                                  children: [
                                    const Align( alignment: Alignment.bottomLeft,
                                      child: Image(image: AssetImage("assets/images/events/ellipse.png"), width: 40, height: 40,),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: (){
                                                print("ajouter package 2");
                                              },
                                              child: Center(
                                                child: Image.asset("assets/images/events/check-box-green.png", width: 16, height: 16,),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Center(
                                          child: Column(
                                            children: [
                                              const Text("vin+honneur",
                                                  style:TextStyle(fontSize: 11, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                              const SizedBox(height: 5,),
                                              RichText(
                                                text: TextSpan(
                                                  //style: TextStyle(color: Colors.red, fontSize: 16),
                                                  children: [
                                                    const TextSpan(text: "250 000",
                                                        style:TextStyle(fontSize: 19, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                                    WidgetSpan(
                                                      child: Transform.translate(
                                                        offset: const Offset(0.0, -12.0),
                                                        child: const Text("XAF",
                                                          style:TextStyle(fontSize: 8, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
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
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                width: 120,
                                color: grayLocation,
                                child: Stack(
                                  children: [
                                    const Align( alignment: Alignment.bottomLeft,
                                      child: Image(image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"), width: 40, height: 40,),
                                    ),
                                    Column(
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
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                width: 120,
                                color: grayLocation,
                                child: Stack(
                                  children: [
                                    const Align( alignment: Alignment.bottomLeft,
                                      child: Image(image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"), width: 40, height: 40,),
                                    ),
                                    Column(
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: const Color(0xffF2F2F2),
                          child: const Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit. A amet cumque delectus et excepturi fugit illum labore maxime minus nihil odit, quaerat quidem ratione reiciendis similique suscipit tempora ullam veniam.",
                            style:TextStyle(fontSize: 11, color: blackColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                        )
                      },
                      const SizedBox(height: 22,),
                      CustomButton(
                        color: titleProgramEventManage,
                        text: 'Ajouter au panier',
                        textColor: Colors.white,
                        textSize: 13.0,
                        onPressed: () async {
                          //Navigator.of(context, rootNavigator: true).pushNamed(AddNewEventStep2PageView.pageName);
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

