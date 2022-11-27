import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:qr_flutter/qr_flutter.dart';

import '../../utils/screen_size.dart';


class ControllerHomePageView extends StatefulWidget {
  const ControllerHomePageView({Key? key}) : super(key: key);
  static const String pageName = "controller_home_page";

  @override
  State<ControllerHomePageView> createState() => _ControllerHomePageViewState();
}

class _ControllerHomePageViewState extends State<ControllerHomePageView> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    List<String> suggestions = ["Ngakam Kontchou", "Ngakaoup Eric Fernand", "Ngakap beaudelaire", "Uruguay", "United Arab Emirates"];
    return OrientationBuilder(
        builder: (context, orientation){
          final media = MediaQuery.of(context).size;
          return Scaffold(
            //backgroundColor: Colors.green,
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/controller_account/bg_qrcode.png'),
                    fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.multiply,)
                  )
              ),
              child: Stack(
                //fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 35,
                    left: 1,
                    right: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3.58),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset("assets/images/rubrique/arrow-rounded-left.png", width: 30, height: 30,),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(width: 14,),
                          const Expanded(child: Text("Recherche d'invité",
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: whiteColor,
                                fontFamily: "Inter"),textAlign: TextAlign.left,),),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: media.longestSide <= 775
                        ? screenAwareSize(110, context)
                        : screenAwareSize(160, context),
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        left: 30, right: 36),
                    child: ListView(
                      children: [
                        TypeAheadField(
                          getImmediateSuggestions: false,
                          animationStart: 0,
                          animationDuration: Duration.zero,
                          textFieldConfiguration: TextFieldConfiguration(
                              autofocus: true,
                              style: const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter"),
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                  padding:  const EdgeInsets.only(left: 15, right: 14, top: 15, bottom: 15),
                                  child: Image.asset("assets/images/controller_account/profile-user.png", width: 22, height: 22,),
                                ),
                                //labelText: hintText,
                                hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: whiteColor, fontFamily: 'Inter'), //hint
                                hintText: "Rechercher un nom / Téléphone",
                                fillColor: Colors.transparent,
                                filled: true,
                                labelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: whiteColor, fontFamily: 'Inter'),
                                contentPadding: const EdgeInsets.all(15.0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(color: iconColor,),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(color: Color(0xffE4DFDF), width: 1.0,
                                  ),
                                ),
                              )
                          ),
                          suggestionsBoxDecoration: SuggestionsBoxDecoration(
                            elevation: 5.0,
                              color: const Color.fromRGBO(255, 255, 255, 0.25),
                            //borderRadius: BorderRadius.circular(12.0),
                            shape:  RoundedRectangleBorder(
                              side: const BorderSide(width: 1.0, color: Color(0xff2D68E6)),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          suggestionsCallback: (pattern){
                            List<String> matches = <String>[];
                            matches.addAll(suggestions);

                            matches.retainWhere((s){
                              return s.toLowerCase().contains(pattern.toLowerCase());
                            });
                            return matches;
                          },
                          itemBuilder: (context, sone) {
                            return Container(
                              /*decoration: BoxDecoration(
                                color: Colors.transparent,
                                //border: Border.all(style: BorderStyle.solid, color: const Color(0xff2D68E6), width: 1.0, strokeAlign: StrokeAlign.inside),
                              ),*/
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                              child:Text(sone.toString(),
                                style: const TextStyle(fontFamily: "Inter", fontSize: 14, fontWeight: FontWeight.w400, color: whiteColor),),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            print(suggestion);
                            _detailProfil();
                          },
                        ),
                        const SizedBox(height: 35.5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 115.0,
                                color: whiteColor,
                              ),
                            ),
                            const Text(
                              'OU',
                              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: whiteColor),
                            ),
                            Padding(
                              padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 115.0,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 47,),
                        Container(
                          decoration: BoxDecoration(
                            color: bottomNavSelected,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left: 45, right: 45),
                          child: const Text("Scanner le code d'une invitation",
                            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: whiteColor,
                                fontFamily: "Inter"),textAlign: TextAlign.center,),
                        ),
                        Image.asset("assets/images/controller_account/polygon.png", width: 12, height: 11,),
                        const SizedBox(height: 27,),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left: 45, right: 39),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            //borderRadius: BorderRadius.circular(14.0),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(14.0),
                                bottomRight: Radius.circular(14.0),
                            topLeft: Radius.circular(14.0),
                            bottomLeft: Radius.circular(14.0)),
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: const Color(0xff2D68E6),
                                width: 3,
                                strokeAlign: StrokeAlign.inside
                            ),

                          ),
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Center(
                              child: QrImage(
                                data: "1234567890",
                                version: QrVersions.auto,
                                //size: 100.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 190,),
                      ],
                    )
                  ),
                ],
              ),
            )
          );
        });
  }

  _detailProfil() {
    showDialog(
      barrierLabel: "dev",
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.only(top: 60),
          child: AlertDialog(
            //titlePadding: EdgeInsets.only(left: 43, top: 19, bottom: 8,right: 38),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            contentPadding: const EdgeInsets.only(top: 13.83),
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: whiteColor,
              ),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Fermer", textAlign: TextAlign.left,
                        style: TextStyle(color: kPrimaryColor, fontSize: 8, fontWeight: FontWeight.w400),),
                      const SizedBox(width: 5,),
                      Image.asset("assets/images/controller_account/close_square.png", width: 14, height: 14,)
                    ],
                  ),

                  const SizedBox(height: 14,),

                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        //color: Color(0xff01B2F1),
                        /*boxShadow: const [
                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 16.0,
                              ),
                            ],*/
                        border: Border.all(style: BorderStyle.solid, color: bottomNavSelected, width: 1.0, strokeAlign: StrokeAlign.inside),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/controller_account/bg_profil_controller.png'),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12,),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(style: BorderStyle.solid, color: kPrimaryColor, width: 1.0, strokeAlign: StrokeAlign.inside),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: ClipOval(
                            child: CircleAvatar(
                              radius: 28.0,
                              child: Image.asset("assets/images/home_page/avatar.png"),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3,),
                        const Text("Ngakam Kontchou",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: labelColorTextField, fontFamily: "Inter"),),
                        const SizedBox(height: 3,),
                        const Text("Président",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: labelColorTextField, fontFamily: "Inter"),),
                        const SizedBox(height: 3,),
                        const Text("Already verified",
                          style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: Color(0xff219653), fontFamily: "Inter"),),
                        const SizedBox(height: 12,),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 17.17),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/delegate_account/event_details_orange.png", width: 24, height: 24, color: kPrimaryColor,),
                        const SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Evenement concerné ",
                              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                            Text("Mariage de Sali ",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            SizedBox(height: 10,),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xffFFE5DE), height: 5, thickness: 1.0, indent: 45, endIndent: 50,),

                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/controller_account/call.png", width: 24, height: 24, color: kPrimaryColor,),
                        const SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Numéro de téléphone ",
                              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                            Text("+237 696 78 54 78 ",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            SizedBox(height: 10,),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xffFFE5DE), height: 5, thickness: 1.0, indent: 45, endIndent: 50,),

                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/controller_account/send.png", width: 24, height: 24, color: kPrimaryColor,),
                        const SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Email ",
                              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                            Text("Ngakamkontchou@gmail.com ",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            SizedBox(height: 10,),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xffFFE5DE), height: 5, thickness: 1.0, indent: 45, endIndent: 50,),

                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/controller_account/profile.png", width: 24, height: 24, color: kPrimaryColor,),
                        const SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Genre ",
                              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                            Text("Masculin ",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            SizedBox(height: 10,),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xffFFE5DE), height: 5, thickness: 1.0, indent: 45, endIndent: 50,),


                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/controller_account/location.png", width: 24, height: 24, color: kPrimaryColor,),
                        const SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Position dans la salle ",
                              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                            Text("S-D7, au fond à gauche ",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            SizedBox(height: 10,),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xffFFE5DE), height: 5, thickness: 1.0, indent: 45, endIndent: 50,),

                  const SizedBox(height: 39.7,),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 23.5),
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                      color: labelColorTextField,
                      shape:  RoundedRectangleBorder(
                        side: const BorderSide(width: 1.0, color: labelColorTextField),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      onPressed: () {
                        //TODO: Implement event associate functionality
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Voir la position',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w700, fontFamily: "Inter"),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(width: 13.0),
                          Image.asset('assets/images/controller_account/map.png',
                            fit: BoxFit.cover,
                            width: 22,
                            height: 22,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 36,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 23.5),
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                      color: kPrimaryColor,
                      shape:  RoundedRectangleBorder(
                        side: const BorderSide(width: 1.0, color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      onPressed: () {
                        //TODO: Implement event associate functionality
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Confirmer l\'identité',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w700, fontFamily: "Inter"),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(width: 10.0),
                          Image.asset('assets/images/controller_account/icons_check-box.png',
                            fit: BoxFit.cover,
                            width: 22,
                            height: 22,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 19.5,)
                ],
              ),
            ),

          ),
        );
      },
    );
  }
}
