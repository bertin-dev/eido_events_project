import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';
import '../../models/location_settings_model.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';

class AddLocationSettingsPageView extends StatefulWidget {
  static const String pageName = "add_location_settings";
  AddLocationSettingsPageView({Key? key}): super(key: key);

  @override
  _AddLocationSettingsState createState() => _AddLocationSettingsState();
}

class _AddLocationSettingsState extends State<AddLocationSettingsPageView> {
  final _addLocationFormKey = GlobalKey<FormState>();
  final TextEditingController _addLocationTitleController = TextEditingController();
  final TextEditingController _addLocationDescController = TextEditingController();
  final TextEditingController _addLocationPositionController = TextEditingController();

  AutovalidateMode? _autovalidate;
  String? titleConfig;
  String? descConfig;
  String? positionConfig;
  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();

  late final GlobalKey<ScaffoldState> _scaffoldKey;


  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {

    return LocationBaseSettingsWidget(
      containerWidget: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120, left: 10, right: 10),
            child: Form(
              autovalidateMode: _autovalidate,
              key: _addLocationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const Text("Ajouter un emplacement pour pouvoir y assigner des configuations",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),),
                     const SizedBox(height: 25,),
                   const Text("Nom de l'emplacement",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                    focus: focusNode1,
                    //: labelColorTextField,
                    textColor: bottomNavUnSelected,
                    prefix: Image.asset("assets/images/location_settings/add-title-location.png", width: 32, height: 32,),
                    hintText: "Entrer un nom de la configuration",
                    controller: _addLocationTitleController,
                    keyboardType: TextInputType.text,
                    onChanged: (val) => titleConfig = val,
                    backgroundColor: grayLocation,
                    validator: _addLocationTitleFieldValidator,
                    emptyValidatorText: 'Entrer un nom de la configuration',
                    radius: 100.0,
                    pLeftPreffix: 15.0,
                    pTopPreffix: 10.0,
                    pBottomPreffix: 10.0,
                    pRightPreffix: 15.0,
                  ),
                  const SizedBox(height: 20,),
                  const Text("Description",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                      focus: focusNode2,
                      line: 4,
                      //: labelColorTextField,
                      textColor: bottomNavUnSelected,
                      //prefix: Image.asset("assets/images/location_settings/add-title-location.png", width: 32, height: 32,),
                      hintText: "Entrez la description",
                      controller: _addLocationDescController,
                      keyboardType: TextInputType.text,
                      onChanged: (val) => descConfig = val,
                      backgroundColor: grayLocation,
                      validator: _addLocationTitleFieldValidator,
                      emptyValidatorText: 'Entrer la description',
                      radius: 12.0
                  ),
                  const SizedBox(height: 20,),
                  const Text("Geolocalisation de l'emplacement",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                      focus: focusNode3,
                      textColor: bottomNavUnSelected,
                      prefix: Image.asset("assets/images/location_settings/location-icon.png", width: 32, height: 32,),
                      suffix: const Icon(Icons.arrow_forward, color: blackTextFieldRightIcon, size: 24,),
                      hintText: "Douala Bar 2022",
                      controller: _addLocationPositionController,
                      keyboardType: TextInputType.text,
                      onChanged: (val) => positionConfig = val,
                      backgroundColor: grayLocation,
                      validator: _addLocationTitleFieldValidator,
                      emptyValidatorText: 'Douala Bar 2022',
                      radius: 12.0,
                    pLeftPreffix: 15.0,
                    pTopPreffix: 10.0,
                    pBottomPreffix: 10.0,
                    pRightPreffix: 15.0,
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70.0, left: 10.0, right: 10.0),
                    child: CustomButton(
                      color: kPrimaryColor,
                      text: 'Ajouter',
                      textColor: Colors.white,
                      onPressed: () async {
                        //Navigator.of(context, rootNavigator: true).pushNamed(OtpCheckingPage.pageName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
      title: "Ajout d'un Emplacement",
      devKey: _scaffoldKey,
      fullBgImg: "assets/images/location_settings/bg-body-add-location.png",
      isBottomNav: true,
      isDrawerNavRight: false,
      bgHeader: "assets/images/location_settings/bg-header-add-location.png",
      heightBgHeader: 125,
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
}
