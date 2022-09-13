import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../../constants.dart';
import '../../models/privilege_model.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';
import '../delegate_account/delegate_login_page.dart';

class DetailProfileAssociateAccountPageView extends StatefulWidget {
  static const String pageName = "associate_account/detail_profile";
  const DetailProfileAssociateAccountPageView({Key? key}) : super(key: key);

  @override
  State<DetailProfileAssociateAccountPageView> createState() => _DetailProfileAssociateAccountPageViewState();
}

class _DetailProfileAssociateAccountPageViewState extends State<DetailProfileAssociateAccountPageView> {

  final _editProfileFormKey = GlobalKey<FormState>();
  final TextEditingController _addPositionTitleController = TextEditingController();
  final TextEditingController _addPositionDescController = TextEditingController();
  AutovalidateMode? _autovalidate;
  String? profileName;
  String? profilePhone;
  String? profileEmail;
  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();
  late List _currencies = [];
  late List _accountList = [];
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _currencies = [
      "Mariage d'Ali",
      "Mariage de Mozart",
      "Mariage sylvestre"
    ];

    _accountList = [
      "Associé",
      "Délégué",
      "Serveur"
    ];
  }

  @override
  Widget build(BuildContext context) {
    String currentSelectedValue = "Mariage d'Ali";
    String currentAccountSelectedValue = "Associé";
    return MenuEditBaseAssociateAccountWidget(
        containerWidget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 298, left: 10, right: 10),
              child: Form(
                autovalidateMode: _autovalidate,
                key: _editProfileFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Detail du profil",
                      style: TextStyle(fontSize: 23.0, color: kPrimaryColor.withOpacity(0.84), fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.left,),
                    const SizedBox(height: 3,),
                    const Text("Vous avez également la possibilité d'éditer un profil",
                      style: TextStyle(fontSize: 13.0, color: Color(0xff07394B), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),

                    const SizedBox(height: 43,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          //padding: EdgeInsets.all(15),
                          decoration: const ShapeDecoration(
                            color: whiteColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color(0xffE4DFDF)),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                          child: DropdownButtonFormField<String>(
                            isDense: true,
                              decoration: InputDecoration(
                                  hintText: '',
                                  enabledBorder: InputBorder.none,
                                  disabledBorder:InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset("assets/images/associate_account/event-icon.png", width: 22, height: 22,),
                                ),
                              ),
                              dropdownColor: whiteColor,
                              focusColor: whiteColor,
                              //borderRadius: BorderRadius.circular(12.0),
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down, color: labelColorTextField),
                              items: _currencies.map((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: labelColorTextField, fontFamily: "Inter")),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  currentSelectedValue = value!;
                                });
                                print(currentSelectedValue);
                              },
                              value: currentSelectedValue
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ItextFieldImgIcon(
                          focus: focusNode1,
                          labelColor: labelColorTextField,
                          textColor: labelColorTextField,
                          prefix: Image.asset("assets/images/associate_account/message-icon.png", width: 22, height: 22,),
                          hintText: "Chat125",
                          controller: _addPositionTitleController,
                          keyboardType: TextInputType.text,
                          onChanged: (val) => profileName = val,
                          backgroundColor: whiteColor,
                          validator: _addLocationTitleFieldValidator,
                          emptyValidatorText: 'Entrer un nome de profil',
                          radius: 12.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 15.0,
                          pBottomPreffix: 15.0,
                          pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 20,),
                        ItextFieldImgIcon(
                          focus: focusNode2,
                          labelColor: labelColorTextField,
                          textColor: labelColorTextField,
                          prefix: Image.asset("assets/images/associate_account/lock-blue-icon.png", width: 22, height: 22,),
                          suffix: Image.asset("assets/images/associate_account/group-user-icon.png", width: 22, height: 22,),
                          hintText: "+237 690 000 000",
                          controller: _addPositionDescController,
                          keyboardType: TextInputType.number,
                          onChanged: (val) => profilePhone = val,
                          backgroundColor: whiteColor,
                          validator: _addLocationTitleFieldValidator,
                          emptyValidatorText: 'Entrer le numero de telephone',
                          radius: 12.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 15.0,
                          pBottomPreffix: 15.0,
                          pRightPreffix: 15.0,
                          pLeftSuffix: 15.0,
                          pTopSuffix: 15.0,
                          pBottomSuffix: 15.0,
                          pRightSuffix: 15.0,
                          suffixbgColor: true
                        ),
                        const SizedBox(height: 20,),
                        ItextFieldImgIcon(
                          focus: focusNode3,
                          labelColor: labelColorTextField,
                          textColor: labelColorTextField,
                          prefix: Image.asset("assets/images/associate_account/message-icon.png", width: 22, height: 22,),
                          hintText: "moz@gmail.com",
                          controller: _addPositionDescController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) => profileEmail = val,
                          backgroundColor: whiteColor,
                          validator: _addLocationTitleFieldValidator,
                          emptyValidatorText: 'Entrer votre adresse email',
                          radius: 12.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 15.0,
                          pBottomPreffix: 15.0,
                          pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          //padding: EdgeInsets.all(15),
                          decoration: const ShapeDecoration(
                            color: whiteColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color(0xffE4DFDF)),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                          child: DropdownButtonFormField<String>(

                              decoration: InputDecoration(
                                hintText: '',
                                enabledBorder: InputBorder.none,
                                disabledBorder:InputBorder.none,
                                focusedBorder: InputBorder.none,
                                prefixIcon: Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset("assets/images/associate_account/paper-icon.png", width: 22, height: 22,),
                                ),
                              ),
                              dropdownColor: whiteColor,
                              focusColor: whiteColor,
                              //borderRadius: BorderRadius.circular(12.0),
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down, color: labelColorTextField),
                              items: _accountList.map((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: labelColorTextField, fontFamily: "Inter")),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  currentAccountSelectedValue = value!;
                                });
                                print(currentAccountSelectedValue);
                              },
                              value: currentAccountSelectedValue
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: CustomButton(
                            color: kPrimaryColor,
                            text: 'Sauvegarder',
                            textColor: Colors.white,
                            onPressed: () async {
                              //Navigator.of(context, rootNavigator: true).pushNamed(OtpCheckingPage.pageName);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ],
        ),
        title: "",
        iconMenu: "assets/images/associate_account/more_square.png",
        isNavBar:true,
        profileName:"Chatnoir123",
        onPressedMenu:() {
          _scaffoldKey.currentState!.openEndDrawer();
        },
        devKey: _scaffoldKey,
        onPressedShared: share

    );
  }



  String? _addLocationTitleFieldValidator(String? value) {
    if (value!.isEmpty) {
      return "Entrez un numéro";
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]{9}\$";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the phone nber is valid
      return null;
    }
    // The pattern of the phone nber didn't match the regex above.
    return 'Phone number must be 9 characters long';
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'EidoEvents',
        text: 'Partage des accès',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'My EidoEvents'
    );
  }
}
