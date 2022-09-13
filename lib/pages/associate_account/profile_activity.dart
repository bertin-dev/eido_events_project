import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';

class ProfileActivityAssociateAccountPageView extends StatefulWidget {
  static const String pageName = "associate_account/profile_activity";
  const ProfileActivityAssociateAccountPageView({Key? key}) : super(key: key);

  @override
  State<ProfileActivityAssociateAccountPageView> createState() => _ProfileActivityAssociateAccountPageViewState();
}

class _ProfileActivityAssociateAccountPageViewState extends State<ProfileActivityAssociateAccountPageView> {

  late List _currencies = [];
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
      _currencies = [
      "16 oct 2021 - 14 oct 2021",
      "16 nov 2021 - 14 nov 2021",
      "16 dec 2021 - 14 dec 2021"
    ];

  }

  @override
  Widget build(BuildContext context) {
    String currentSelectedValue = "16 oct 2021 - 14 oct 2021";

    return MenuEditBaseAssociateAccountWidget(
        containerWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 298, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Activités du profil",
                    style: TextStyle(fontSize: 23.0, color: kPrimaryColor.withOpacity(0.84), fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.left,),
                  const SizedBox(height: 3,),
                  const Text("Pour voir les activités du profil",
                    style: TextStyle(fontSize: 13.0, color: Color(0xff07394B), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(color: kPrimaryColor, height: 3,),
            const SizedBox(height: 17,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    dropdownColor: whiteColor,
                    focusColor: whiteColor,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down, color: labelColorTextField),
                    /*items: const [
                      DropdownMenuItem<String>(
                        value: 'oct',
                        child: Text('16 oct 2021 - 14 oct 2021',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13.0, color: labelColorTextField, fontFamily: "Inter")),
                      ),
                      DropdownMenuItem<String>(
                        value: 'nov',
                        child: Text('16 nov 2021 - 14 nov 2021',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13.0, color: labelColorTextField, fontFamily: "Inter")),
                      ),
                      DropdownMenuItem<String>(
                        value: 'dec',
                        child: Text('16 dec 2021 - 14 dec 2021',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13.0, color: labelColorTextField, fontFamily: "Inter")),
                      ),
                    ],*/
                    items: _currencies.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.0, color: labelColorTextField, fontFamily: "Inter")),
                      );
                    }).toList(),
                    /*hint: const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text("Identification"),
                  ),*/
                    onChanged: (String? value) {
                      setState(() {
                        currentSelectedValue = value!;
                      });
                      print(currentSelectedValue);
                    },
                    value: currentSelectedValue
                ),
              )
            ),
            const SizedBox(height: 31,),
            /*Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/associate_account/bg-profile-activity.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text("16",style: TextStyle(fontSize: 23.0, color: labelColorTextField, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.right,),
                          Text("Oct",style: TextStyle(fontSize: 23.0, color: labelColorTextField, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.left,),
                          Image.asset("assets/images/associate_account/courbe-activity-profile.png", width: 69.33, height: 24.5,)
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 5,
                            color: Colors.black.withOpacity(0.1),
                          ),
                          Positioned(
                              child: Row(
                                children: [
                                  Material(
                                    color: redColor,
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(100),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: CircleAvatar(
                                        radius: 6,
                                        backgroundColor: whiteColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 24.8,),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xffFFF0EF),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("15:00",
                                          style: TextStyle(fontSize: 9.0, color: Color(0xff7A7D86), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                        Wrap(
                                          children: const [
                                            Text("A supprimer l'utilisateur",
                                              style: TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                            Text("ljhu125",
                                              style: TextStyle(fontSize: 13.0, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            ),*/
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/associate_account/bg-profile-activity.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text("16",style: TextStyle(fontSize: 23.0, color: labelColorTextField, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.right,),
                      const Text("Oct",style: TextStyle(fontSize: 23.0, color: labelColorTextField, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.left,),
                      Image.asset("assets/images/associate_account/courbe-activity-profile.png", width: 69.33, height: 24.5,)
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 9),
                        height: 100,
                        width: 5,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      Positioned(
                        child: Row(
                          children: [
                            Material(
                              color: redColor,
                              elevation: 4,
                              borderRadius: BorderRadius.circular(100),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: whiteColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 24.8,),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xffFFF0EF),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("15:00",
                                    style: TextStyle(fontSize: 9.0, color: Color(0xff7A7D86), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                  Wrap(
                                    children: const [
                                      Text("A supprimer l'utilisateur",
                                        style: TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                      Text("ljhu125",
                                        style: TextStyle(fontSize: 13.0, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
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
                image: DecorationImage(
                  image: AssetImage("assets/images/associate_account/bg-profile-activity.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 69.5,),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 9),
                          height: 100,
                          width: 5,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        Positioned(
                          child: Row(
                            children: [
                              Material(
                                color: const Color(0xff65BF73),
                                elevation: 4,
                                borderRadius: BorderRadius.circular(100),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: whiteColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24.8,),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xffDBFFE0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("15:00",
                                      style: TextStyle(fontSize: 9.0, color: Color(0xff7A7D86), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                    Wrap(
                                      children: const [
                                        Text("A supprimer l'utilisateur",
                                          style: TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                        Text("ljhu125",
                                          style: TextStyle(fontSize: 13.0, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/associate_account/bg-profile-activity.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 69.5,),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 9),
                          height: 100,
                          width: 5,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        Positioned(
                          child: Row(
                            children: [
                              Material(
                                color: redColor,
                                elevation: 4,
                                borderRadius: BorderRadius.circular(100),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: whiteColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24.8,),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xffFFF0EF),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("15:00",
                                      style: TextStyle(fontSize: 9.0, color: Color(0xff7A7D86), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                    Wrap(
                                      children: const [
                                        Text("A supprimer l'utilisateur",
                                          style: TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                        Text("ljhu125",
                                          style: TextStyle(fontSize: 13.0, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/associate_account/bg-profile-activity.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text("14",style: TextStyle(fontSize: 23.0, color: labelColorTextField, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.right,),
                        Text("Oct",style: TextStyle(fontSize: 23.0, color: labelColorTextField, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.left,),
                        Image.asset("assets/images/associate_account/courbe-activity-profile.png", width: 69.33, height: 24.5,)
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 9),
                          height: 100,
                          width: 5,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        Positioned(
                          child: Row(
                            children: [
                              Material(
                                color: redColor,
                                elevation: 4,
                                borderRadius: BorderRadius.circular(100),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: whiteColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24.8,),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xffFFF0EF),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("15:00",
                                      style: TextStyle(fontSize: 9.0, color: Color(0xff7A7D86), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                    Wrap(
                                      children: const [
                                        Text("A supprimer l'utilisateur",
                                          style: TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                        Text("ljhu125",
                                          style: TextStyle(fontSize: 13.0, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        title: "",
        iconMenu: "assets/images/associate_account/more_square.png",
        isNavBar:true,
        profileName:"Chatnoir123",
        onPressedMenu:() {
          _scaffoldKey.currentState!.openEndDrawer();
        },
        devKey: _scaffoldKey
    );
  }

}
