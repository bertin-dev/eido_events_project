//import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eido_events_project/constants.dart';
import 'package:eido_events_project/pages/location_settings/success_location_page.dart';
import 'package:flutter/material.dart';
import '../../models/location_settings_model.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';

class EditLocationSettingsPageView extends StatefulWidget {
  static const String pageName = "edit_location_settings";
  String title;
  LocationSettingsModel locationSettings;

  EditLocationSettingsPageView({Key? key, required this.locationSettings, required this.title}): super(key: key);

  @override
  _EditLocationSettingsState createState() => _EditLocationSettingsState();
}

class _EditLocationSettingsState extends State<EditLocationSettingsPageView> {
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


  @override
  void initState() {
    print("${widget.title}");
    print("${widget.locationSettings}");
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
                   const Text("Nom de l'emplacement",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                    focus: focusNode1,
                    //: labelColorTextField,
                    textColor: bottomNavUnSelected,
                    suffix: Image.asset("assets/images/location_settings/edit-location.png", width: 24, height: 24,),
                    prefix: Image.asset("assets/images/location_settings/add-title-location.png", width: 32, height: 32,),
                    hintText: widget.locationSettings.headerItem,
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
                    pRightSuffix: 14.0,
                    pBottomSuffix: 14.0,
                    pTopSuffix: 14.0,
                    pLeftSuffix: 14.0,
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
                      hintText: widget.locationSettings.desc,
                      controller: _addLocationDescController,
                      keyboardType: TextInputType.text,
                      onChanged: (val) => descConfig = val,
                      backgroundColor: grayLocation,
                      validator: _addLocationTitleFieldValidator,
                      emptyValidatorText: 'Entrer la description',
                      radius: 12.0
                  ),
                  const SizedBox(height: 20,),
                  const Text("Nombre de configuration",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 13.0, left: 0.0, bottom: 0.0,),
                    child: Row(
                      children: [
                        Stack(children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 0.0,
                                top: 0.5,
                              ),
                              child: Image.asset(widget.locationSettings.smallIcon,
                                width: 30, height: 30,)
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                              ),
                              child: Image.asset(widget.locationSettings.smallIcon,
                                width: 30, height: 30,)
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 32.0,
                              ),
                              child: Image.asset(widget.locationSettings.smallIcon,
                                width: 30, height: 30,)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:5.0, right: 1.0, left: 65.0),
                            child: Text(widget.locationSettings.locationNumber,
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: "Inter", color: labelColorTextField),),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text("Geolocalisation de l'emplacement",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                      focus: focusNode3,
                      textColor: bottomNavUnSelected,
                      suffix: Image.asset("assets/images/location_settings/edit-location.png", width: 24, height: 24,),
                      prefix: Image.asset("assets/images/location_settings/location-icon.png", width: 32, height: 32,),
                      hintText: widget.locationSettings.headerItem,
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
                    pRightSuffix: 14.0,
                    pBottomSuffix: 14.0,
                    pTopSuffix: 14.0,
                    pLeftSuffix: 14.0,
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialogDelete(
                                title: 'Suppression',
                                titleColor: successTextColor,
                                titleSize: 23.0,
                                body: "Voulez-vous vraiment supprimer cet emplacement ?",
                                bodyColor: Colors.black,
                                bodySize: 13.0,
                                radius: 20.0,
                                pLeft: 5.0,
                                pRight: 5.0,
                                pTop: 0,
                                pBottom: 15.17,
                                action: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomBtnForAlert(
                                          onPressedBtn: () {
                                            Navigator.of(context).pop();
                                          },
                                          textBtn: 'Annuler',
                                          textColorBtn: whiteColor,
                                          textSizeBtn: 13.0,
                                          colorBtn: labelColorTextField,
                                          radiusBtn: 100.0,
                                          heightBtn: 40.0,
                                          minWidthBtn: 117,
                                          pTopBtn: 0,
                                          pBottomBtn: 0,
                                          pLeftBtn: 0,
                                          pRightBtn: 0,),
                                        const SizedBox(width: 15,),
                                        CustomBtnForAlert(
                                          onPressedBtn: () {
                                            print("Supprimer");
                                          },
                                          textBtn: 'Supprimer',
                                          textColorBtn: whiteColor,
                                          textSizeBtn: 13.0,
                                          colorBtn: kPrimaryColor,
                                          radiusBtn: 100.0,
                                          heightBtn: 40.0,
                                          minWidthBtn: 117,
                                          pTopBtn: 2.0,
                                          pBottomBtn: 2.0,
                                          pLeftBtn: 0,
                                          pRightBtn: 0,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );

                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: redColor,
                            child: Image.asset("assets/images/home_page/delete.png", width: 24, height: 24,),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: CustomButton(
                            color: kPrimaryColor,
                            text: 'Sauvegarder',
                            textColor: Colors.white,
                            onPressed: () async {
                              Navigator.of(context)
                                  .pushNamed(SuccessLocationPageView.pageName,
                                  arguments: {
                                    "saved": true,
                                  });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70,),
                ],
              ),
            ),
          )
      ),
      title: widget.title
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
