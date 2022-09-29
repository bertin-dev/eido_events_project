import 'package:dotted_border/dotted_border.dart';
import 'package:eido_events_project/constants.dart';
import 'package:eido_events_project/pages/manage_event_programs/success_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../providers/app.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';

class AddProgramPageView extends StatefulWidget {
  static const String pageName = "manage_event_programs/add_program";
  const AddProgramPageView({Key? key}): super(key: key);

  @override
  _AddProgramState createState() => _AddProgramState();
}

class _AddProgramState extends State<AddProgramPageView> {
  final _addLocationFormKey = GlobalKey<FormState>();
  final TextEditingController _addLocationTitleController = TextEditingController();
  final TextEditingController _addLocationDescController = TextEditingController();
  final TextEditingController _addTownController = TextEditingController();
  final TextEditingController _addAmountController = TextEditingController();

  final TextEditingController _addPackageTitleController = TextEditingController();
  final TextEditingController _addPackageDescController = TextEditingController();
  final TextEditingController _addPackageAmountController = TextEditingController();
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  AutovalidateMode? _autovalidate;
  String? title;
  String? description;
  String? town;
  String? start;
  String? end;
  String? amount;

  String? titlePackage;
  String? descriptionPackage;
  String? amountPackage;
  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();
  var focusNode4 = FocusNode();
  var focusNode5 = FocusNode();
  var focusNode6 = FocusNode();
  var focusNode7 = FocusNode();
  var focusNode8 = FocusNode();
  var focusNode9 = FocusNode();
  late bool isCheckedAmountSimple;
  late bool isCheckedPackage;
  late final _creatProgramFormKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    isCheckedAmountSimple = Global.shared.isInstructionView;
    isCheckedPackage = Global.shared.isInstructionView;
    _creatProgramFormKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {

    return LocationBaseSettingsWidget(
        containerWidget: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120, left: 22, right: 22),
              child: Form(
                autovalidateMode: _autovalidate,
                key: _addLocationFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Nom du programme",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                    const SizedBox(height: 5,),
                    ItextFieldImgIcon(
                      focus: focusNode1,
                      //: labelColorTextField,
                      textColor: bottomNavUnSelected,
                      prefix: Image.asset("assets/images/manage_event_programs/doc-blue-icon.png", width: 32, height: 32,),
                      hintText: "Ex: Dote",
                      controller: _addLocationTitleController,
                      keyboardType: TextInputType.text,
                      onChanged: (val) => title = val,
                      backgroundColor: grayLocation,
                      validator: _addLocationTitleFieldValidator,
                      emptyValidatorText: 'Entrer un nom de la configuration',
                      radius: 8.0,
                      pLeftPreffix: 15.0,
                      pTopPreffix: 10.0,
                      pBottomPreffix: 10.0,
                      pRightPreffix: 15.0,
                    ),
                    const SizedBox(height: 10,),
                    const Text("Description",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                    const SizedBox(height: 5,),
                    ItextFieldImgIcon(
                        focus: focusNode2,
                        line: 4,
                        //: labelColorTextField,
                        textColor: bottomNavUnSelected,
                        //prefix: Image.asset("assets/images/location_settings/add-title-location.png", width: 32, height: 32,),
                        hintText: "Ex: la cérémonie avant le mariage",
                        controller: _addLocationDescController,
                        keyboardType: TextInputType.text,
                        onChanged: (val) => description = val,
                        backgroundColor: grayLocation,
                        validator: _addLocationTitleFieldValidator,
                        emptyValidatorText: 'Entrer la description',
                        radius: 12.0
                    ),
                    const SizedBox(height: 10,),
                    const Text("Période de location",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                    const SizedBox(height: 5,),
                    ItextFieldImgIcon(
                      focus: focusNode3,
                      textColor: bottomNavUnSelected,
                      prefix: Image.asset("assets/images/manage_event_programs/calendar-blue-icon.png", width: 32, height: 32,),
                      hintText: "Début",
                      controller: _addLocationTitleController,
                      keyboardType: TextInputType.datetime,
                      onChanged: (val) => start = val,
                      backgroundColor: grayLocation,
                      validator: _addLocationTitleFieldValidator,
                      emptyValidatorText: 'Entrer une date de début',
                      radius: 8.0,
                      pLeftPreffix: 15.0,
                      pTopPreffix: 10.0,
                      pBottomPreffix: 10.0,
                      pRightPreffix: 15.0,
                    ),
                    const SizedBox(height: 5,),
                    ItextFieldImgIcon(
                      focus: focusNode4,
                      //: labelColorTextField,
                      textColor: bottomNavUnSelected,
                      prefix: Image.asset("assets/images/manage_event_programs/calendar-blue-icon.png", width: 32, height: 32,),
                      hintText: "Fin (JJ/MM/AAAA - HH:MM)",
                      controller: _addLocationTitleController,
                      keyboardType: TextInputType.datetime,
                      onChanged: (val) => end = val,
                      backgroundColor: grayLocation,
                      validator: _addLocationTitleFieldValidator,
                      emptyValidatorText: 'Entrer une date de fin',
                      radius: 8.0,
                      pLeftPreffix: 15.0,
                      pTopPreffix: 10.0,
                      pBottomPreffix: 10.0,
                      pRightPreffix: 15.0,
                    ),
                    const SizedBox(height: 10,),
                    const Text("Selectionner la ville",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                    const SizedBox(height: 5,),
                    ItextFieldImgIcon(
                      focus: focusNode5,
                      textColor: bottomNavUnSelected,
                      prefix: Image.asset("assets/images/manage_event_programs/location-blue-icon.png", width: 32, height: 32,),
                      suffix: const Icon(Icons.arrow_forward, color: blackTextFieldRightIcon, size: 24,),
                      hintText: "Douala",
                      controller: _addTownController,
                      keyboardType: TextInputType.text,
                      onChanged: (val) => town = val,
                      backgroundColor: grayLocation,
                      validator: _addLocationTitleFieldValidator,
                      emptyValidatorText: 'Douala Bar 2022',
                      radius: 8.0,
                      pLeftPreffix: 15.0,
                      pTopPreffix: 10.0,
                      pBottomPreffix: 10.0,
                      pRightPreffix: 15.0,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: SizedBox(
                                  width: 25,
                                  height: 15,
                                  child: Switch(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    value: isCheckedAmountSimple,
                                    onChanged: (bool isOn) {
                                      if (kDebugMode) {
                                        print(isOn);
                                      }
                                      setState(() {
                                        isCheckedAmountSimple = isOn;
                                        Global.shared.isInstructionView = isOn;
                                        isOn =!isOn;
                                        if (kDebugMode) {
                                          print(isCheckedAmountSimple);
                                        }
                                      });
                                    },
                                    activeColor: greenColor,
                                    inactiveTrackColor: Colors.grey,
                                    inactiveThumbColor: Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              const Expanded(
                                child: Text("Montant simple",
                                    style: TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter")),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: SizedBox(
                                  width: 25,
                                  height: 15,
                                  child: Switch(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    value: isCheckedPackage,
                                    onChanged: (bool isOn) {
                                      if (kDebugMode) {
                                        print(isOn);
                                      }
                                      setState(() {
                                        isCheckedPackage = isOn;
                                        Global.shared.isInstructionView = isOn;
                                        isOn =!isOn;
                                        if (kDebugMode) {
                                          print(isCheckedPackage);
                                        }
                                      });
                                    },
                                    activeColor: greenColor,
                                    inactiveTrackColor: Colors.grey,
                                    inactiveThumbColor: Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              const Expanded(
                                child: Text("Package",
                                    style: TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter")),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Visibility(
                      visible: isCheckedAmountSimple,
                        child: ItextFieldImgIcon(
                          focus: focusNode6,
                          textColor: bottomNavUnSelected,
                          prefix: Image.asset("assets/images/manage_event_programs/money-blue-icon.png", width: 32, height: 32,),
                          hintText: "52 0000 XAF",
                          controller: _addAmountController,
                          keyboardType: TextInputType.number,
                          onChanged: (val) => amount = val,
                          backgroundColor: grayLocation,
                          validator: _addLocationTitleFieldValidator,
                          emptyValidatorText: 'Veuillez entrer le montant',
                          radius: 8.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 10.0,
                          pBottomPreffix: 10.0,
                          pRightPreffix: 15.0,
                        ),
                    ),
                    const SizedBox(height: 10,),
                    Visibility(
                      visible: isCheckedPackage,
                        child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 92.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    getBottomSheet(context);
                                  },
                                  child: DottedBorder(
                                    color: const Color(0xffE0E0E0),
                                    strokeWidth: 1,
                                    child: Container(
                                      width: 97.25,
                                      decoration: const BoxDecoration(
                                        color: whiteColor,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset("assets/images/manage_event_programs/add-container.png", width: 18, height: 18,),
                                          const Text("Ajouter un package",
                                              style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                Container(
                                  width: 97.25,
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
                                                print("modifier package");
                                              },
                                              child: Container(
                                                alignment: Alignment.topRight,
                                                width: 20,
                                                height:20,
                                                padding: const EdgeInsets.all(5),
                                                color: kPrimaryColor,
                                                child: Center(
                                                  child: Image.asset("assets/images/manage_event_programs/small-edit.png", width: 10, height: 10,),
                                                ),
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
                                  width: 97.25,
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
                                              child: Container(
                                                alignment: Alignment.topRight,
                                                width: 20,
                                                height:20,
                                                padding: const EdgeInsets.all(5),
                                                color: kPrimaryColor,
                                                child: Center(
                                                  child: Image.asset("assets/images/manage_event_programs/small-edit.png", width: 10, height: 10,),
                                                ),
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
                                  width: 97.25,
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
                                                print("ajouter package 3");
                                              },
                                              child: Container(
                                                alignment: Alignment.topRight,
                                                width: 20,
                                                height:20,
                                                padding: const EdgeInsets.all(5),
                                                color: kPrimaryColor,
                                                child: Center(
                                                  child: Image.asset("assets/images/manage_event_programs/small-edit.png", width: 10, height: 10,),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Center(
                                          child: Column(
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
                                            ],
                                          ),
                                        )


                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 70.0, left: 10.0, right: 10.0),
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
              ),
            )
        ),
        title: "Ajouter un programme",
        iconMenuLeft: "assets/images/arrow-back-icon.png",
        onPressedMenuLeft:() {
          Navigator.of(context).pop();
        },
        devKey: _scaffoldKey,
        fullBgImg: "assets/images/location_settings/bg-body-add-location.png",
        isBottomNav: false,
        isDrawerNavRight: false,
        bgHeader: "assets/images/location_settings/bg-header-add-location.png",
        heightBgHeader: 125
    );
  }


  getBottomSheet(context) {
    final hv = MediaQuery.of(context).size.height / 100;
    final wv = MediaQuery.of(context).size.width / 100;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: whiteColor,
        elevation: 1.0,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0)),
        ),
        //enableDrag: true,
        builder: (context) => SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/associate_account/bg-bottomsheet.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 7,  right: 13,  left: 13,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Center(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right:10, top: 14.0, bottom: 15),
                          child: Container(
                            height: 5.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: bottomUnderline,
                            ),
                          ),
                        ),
                      )
                  ),
                  const Text(
                    'Ajouter un package',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19, fontFamily: "Inter", color: titleProgramEventManage),
                  ),
                  const SizedBox(height: 11.0,),
                  Container(height: 2, color: titleProgramEventManage,),
                  const SizedBox(height: 11.0,),
                  Container(width: (wv*100)/2, height: 2, color: titleProgramEventManage,),
                  const SizedBox(height: 39.0,),
                  Form(
                    autovalidateMode: _autovalidate,
                    key: _creatProgramFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        const Text("Nom du package",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                        const SizedBox(height: 5,),
                        ItextFieldImgIcon(
                          focus: focusNode7,
                          labelColor: labelColorTextField,
                          textColor: labelColorTextField,
                          prefix: Image.asset("assets/images/manage_event_programs/doc-blue-icon.png", width: 32, height: 32,),
                          hintText: "Ex: Starter",
                          controller: _addPackageTitleController,
                          keyboardType: TextInputType.text,
                          onChanged: (val) => titlePackage = val,
                          backgroundColor: grayLocation,
                          validator: _addLocationTitleFieldValidator,
                          emptyValidatorText: 'Entrer un nom du package',
                          radius: 8.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 15.0,
                          pBottomPreffix: 15.0,
                          pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 10,),
                        const Text("Entrez le montant",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                        const SizedBox(height: 5,),
                        ItextFieldImgIcon(
                            focus: focusNode8,
                            labelColor: labelColorTextField,
                            textColor: labelColorTextField,
                            prefix: Image.asset("assets/images/manage_event_programs/money-blue-icon.png", width: 32, height: 32,),
                            hintText: "52 000 XAF",
                            controller: _addPackageAmountController,
                            keyboardType: TextInputType.number,
                            onChanged: (val) => amountPackage = val,
                            backgroundColor: grayLocation,
                            validator: _addLocationTitleFieldValidator,
                            emptyValidatorText: 'Entrer le montant',
                            radius: 8.0,
                            pLeftPreffix: 15.0,
                            pTopPreffix: 15.0,
                            pBottomPreffix: 15.0,
                            pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 10,),
                        const Text("Description",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                        const SizedBox(height: 5,),
                        ItextFieldImgIcon(
                            focus: focusNode9,
                            line: 4,
                            //: labelColorTextField,
                            textColor: bottomNavUnSelected,
                            hintText: "Ex: la table 1 se trouve à côté de la porte d'entrée",
                            controller: _addPackageDescController,
                            keyboardType: TextInputType.text,
                            onChanged: (val) => descriptionPackage = val,
                            backgroundColor: grayLocation,
                            validator: _addLocationTitleFieldValidator,
                            emptyValidatorText: 'Entrer la description',
                            radius: 8.0
                        ),
                        const SizedBox(height: 10),

                        CustomButton(
                          color: kPrimaryColor,
                          text: 'Ajouter',
                          textColor: Colors.white,
                          onPressed: () async {
                            Navigator.of(context).pushNamed(SuccessProgramPageView.pageName);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ));
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
