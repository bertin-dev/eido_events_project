
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';
import 'list_of_program_page.dart';

class AddRubriqueProgramPageView extends StatefulWidget {
  const AddRubriqueProgramPageView({Key? key}) : super(key: key);
  static const String pageName = "manage_rubrique/add_rubrique_program";

  @override
  State<AddRubriqueProgramPageView> createState() => _AddRubriqueProgramPageViewState();
}

class _AddRubriqueProgramPageViewState extends State<AddRubriqueProgramPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  AutovalidateMode? _autovalidate;
  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();
  final _addFormKey = GlobalKey<FormState>();
  final TextEditingController _addLastNameController = TextEditingController();
  final TextEditingController _addFirstNameController = TextEditingController();
  final TextEditingController _addDescriptionController = TextEditingController();
  late String firstName;
  late String lastName;
  late String description;

  late int hour;
  late int minute;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    hour = 07;
    minute = 00;
  }


  @override
  Widget build(BuildContext context) {
    return LocationBaseSettingsWidget(
      containerWidget: ListView(
        padding: const EdgeInsets.only(top: 125),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 30),
            child: Form(
              autovalidateMode: _autovalidate,
              key: _addFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Intitulé de l'intervention",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                    focus: focusNode1,
                    //: labelColorTextField,
                    textColor: bottomNavUnSelected,
                    prefix: Image.asset("assets/images/rubrique/product-icon.png", width: 32, height: 32,),
                    hintText: "Entrez le nom",
                    controller: _addLastNameController,
                    keyboardType: TextInputType.text,
                    onChanged: (val) => lastName = val,
                    backgroundColor: grayLocation,
                    validator: _addNameFieldValidator,
                    emptyValidatorText: 'Veuillez entrez le nom',
                    radius: 8.0,
                    pLeftPreffix: 15.0,
                    pTopPreffix: 10.0,
                    pBottomPreffix: 10.0,
                    pRightPreffix: 15.0,
                  ),
                  const SizedBox(height: 10,),
                  const Text("Nom de l'intervention",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                    focus: focusNode2,
                    //: labelColorTextField,
                    textColor: bottomNavUnSelected,
                    prefix: Image.asset("assets/images/rubrique/money.png", width: 32, height: 32,),
                    hintText: "Entrez le prenom",
                    controller: _addFirstNameController,
                    keyboardType: TextInputType.text,
                    onChanged: (val) => lastName = val,
                    backgroundColor: grayLocation,
                    validator: _addNameFieldValidator,
                    emptyValidatorText: 'Veuillez entrez le prenom',
                    radius: 8.0,
                    pLeftPreffix: 15.0,
                    pTopPreffix: 10.0,
                    pBottomPreffix: 10.0,
                    pRightPreffix: 15.0,
                  ),
                  const SizedBox(height: 10,),


                  const Text("Temps de passage",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(5.30),
                              color: const Color(0xffFEE2EA),
                              border: Border.all(width: 1.0, color: const Color(0xffFEE2EA)),
                            ),
                            height: 67,
                            child: Center(
                              child: Text("0$hour",
                                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 40, fontFamily: "Roboto", color: kPrimaryColor), textAlign: TextAlign.center,),
                            ),
                          )
                      ),
                      const Expanded(
                          child: SizedBox(
                            height: 67,
                            child: Center(
                              child: Text(":",
                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40, fontFamily: "Roboto", color: Color(0xff202124)), textAlign: TextAlign.center,),
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(5.30),
                              color: const Color.fromRGBO(33, 33, 33, 0.08),
                              border: Border.all(width: 1.0, color: const Color.fromRGBO(33, 33, 33, 0.08)),
                            ),
                            height: 67,
                            child: Center(
                              child: Text("0$minute",
                                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 40, fontFamily: "Roboto", color: Color.fromRGBO(0, 0, 0, 0.87)), textAlign: TextAlign.center,),
                            ),
                          )
                      ),
                      Expanded(
                          child: Row(
                            children: [
                              const SizedBox(width: 15.92,),
                              Container(
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.30),
                                  border: Border.all(width: 1.0, color: const Color(0xffDADCE0)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 51,
                                      height: 33,
                                      child: const Center(
                                        child: Text("PM",
                                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, fontFamily: "Roboto", color: Color.fromRGBO(0, 0, 0, 0.6)), textAlign: TextAlign.center,),
                                      ),
                                    ),
                                    Container(
                                      width: 51,
                                      height: 33,
                                      color: const Color(0xffFEE2EA),
                                      child: const Center(
                                        child: Text("AM",
                                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, fontFamily: "Roboto", color: kPrimaryColor), textAlign: TextAlign.center,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),


                  const Text("Raison de son intervention",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                      focus: focusNode3,
                      line: 5,
                      //: labelColorTextField,
                      textColor: bottomNavUnSelected,
                      hintText: "Ex: pour un petit discours",
                      controller: _addDescriptionController,
                      keyboardType: TextInputType.text,
                      onChanged: (val) => description = val,
                      backgroundColor: grayLocation,
                      validator: _addNameFieldValidator,
                      emptyValidatorText: 'Entrer la description',
                      radius: 12.0
                  ),
                  const SizedBox(height: 5,),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: CustomButtonRightIcon(
                      color: kPrimaryColor,
                      text: 'Ajouté le programme',
                      textColor: Colors.white,
                      onPressed: () async {
                        Navigator.of(context).pushNamed(ListOfProgramPageView.pageName);
                      }, radius: 100,
                      pVertical: 8,
                      pHorizontal: 80,
                      size: 13,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      title: "Ajouter un programme",
      iconMenuLeft: "assets/images/rubrique/arrow-rounded-left.png",
      onPressedMenuLeft: () async {
        Navigator.of(context).pop();
        },
      devKey: _scaffoldKey,
      fullBgImg: "",
      isBottomNav: false,
      isDrawerNavRight: false,
      bgHeader: "assets/images/rubrique/bg-img.png",
      heightBgHeader: 125,
    );
  }

  String? _addNameFieldValidator(String? value) {
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
