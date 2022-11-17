
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../providers/app.dart';
import '../../utils/screen_size.dart';
import '../../widgets/custom_widgets.dart';
import 'invoice_page.dart';

class RenewEventPageView extends StatefulWidget {
  const RenewEventPageView({Key? key}) : super(key: key);
  static const String pageName = "events/renew";

  @override
  State<RenewEventPageView> createState() => _RenewEventPageViewState();
}

class _RenewEventPageViewState extends State<RenewEventPageView> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  AutovalidateMode? _autovalidate;
  String? name;
  String? location;
  String? start;
  String? end;
  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();
  var focusNode4 = FocusNode();
  late bool isCheckedPrivate;
  late bool isCheckedPublic;
  late final _creatFormKey;

  int positionCounter = 0;

  counterPlus(){
    setState(() {
      positionCounter++;
    });
  }

  counterMoin(){
    setState(() {
      if(positionCounter > 0){
        positionCounter--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isCheckedPrivate = Global.shared.isInstructionView;
    isCheckedPublic = Global.shared.isInstructionView;
    _creatFormKey = GlobalKey<FormState>();
    positionCounter = 45;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final media = MediaQuery.of(context).size;
          return Scaffold(
            backgroundColor: whiteColor,
            resizeToAvoidBottomInset: false,
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
                          icon: Image.asset("assets/images/rubrique/arrow-rounded-left.png", width: 30, height: 30,),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(width: 14,),
                        const Expanded(child: Text("Gestion des évènements",
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: whiteColor,
                              fontFamily: "Inter"),textAlign: TextAlign.left,),),
                        IconButton(
                          icon: Image.asset("assets/images/rubrique/plus-red-icon.png", width: 30, height: 30,),
                          onPressed: () => Navigator.of(context).pop(),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: media.longestSide <= 775
                      ? screenAwareSize(145, context)
                      : screenAwareSize(160, context),
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    //primary: false,
                    padding: const EdgeInsets.only(left: 30),
                    children:  [
                      const Text("Renouveler un évènement",
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: kPrimaryColor,
                            fontFamily: "Inter"),textAlign: TextAlign.left,),
                      const SizedBox(height: 25,),

                      const Text("Type d'évènement",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: titleProgramEventManage,
                            fontFamily: "Inter"),textAlign: TextAlign.left,),
                      const SizedBox(height: 5,),
                      Container(
                        padding: const EdgeInsets.only(top: 17),
                        height: 112,
                        child: ListView(
                          primary: true,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SizedBox(
                              width: 97,
                              child: Column(
                                children: [
                                  //Image(image: AssetImage("assets/images/events/couvert-red.png"), width: 63.29, height: 63.29,),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration:BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: AssetImage("assets/images/events/cuisine-icon.png"),
                                      radius: 18,
                                      //backgroundColor: Color(0xfff1f3f5),
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  const Center(
                                    child: Text("Anniversaire",
                                        style:TextStyle(fontSize: 14, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                  )
                                ],
                              )
                            ),
                            SizedBox(
                                width: 97,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration:BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(width: 1.0, color: const Color(0xffE5E5E5),),
                                      ),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage("assets/images/events/zik-icon.png"),
                                        radius: 18,
                                        //backgroundColor: Color(0xfff1f3f5),
                                      ),
                                    ),
                                    const SizedBox(height: 14,),
                                    const Center(
                                      child: Text("Concert",
                                          style:TextStyle(fontSize: 14, color: Color(0xff120D26), fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                    )
                                  ],
                                )
                            ),
                            SizedBox(
                                width: 97,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration:BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(width: 1.0, color: const Color(0xffE5E5E5),),
                                      ),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage("assets/images/events/basketball-icon.png"),
                                        radius: 18,
                                        //backgroundColor: Color(0xfff1f3f5),
                                      ),
                                    ),
                                    const SizedBox(height: 14,),
                                    const Center(
                                      child: Text("Sport",
                                          style:TextStyle(fontSize: 14, color: Color(0xff120D26), fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                    )
                                  ],
                                )
                            ),
                            SizedBox(
                                width: 97,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration:BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(width: 1.0, color: const Color(0xffE5E5E5),),
                                      ),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage("assets/images/events/art-icon.png"),
                                        radius: 18,
                                        //backgroundColor: Color(0xfff1f3f5),
                                      ),
                                    ),
                                    const SizedBox(height: 14,),
                                    const Center(
                                      child: Text("Art",
                                          style:TextStyle(fontSize: 14, color: Color(0xff120D26), fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18,),
                      Form(
                        autovalidateMode: _autovalidate,
                        key: _creatFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              padding: const EdgeInsets.only(right: 32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Nom de l'évènement",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                                  const SizedBox(height: 5,),
                                  ItextFieldImgIcon(
                                    focus: focusNode1,
                                    //: labelColorTextField,
                                    textColor: bottomNavUnSelected,
                                    prefix: Image.asset("assets/images/manage_event_programs/doc-blue-icon.png", width: 32, height: 32,),
                                    hintText: "Ex: Mariage de Aline & Christian",
                                    controller: _nameController,
                                    keyboardType: TextInputType.text,
                                    onChanged: (val) => name = val,
                                    backgroundColor: grayLocation,
                                    validator: _addLocationTitleFieldValidator,
                                    emptyValidatorText: 'Entrer un nom de la configuration',
                                    radius: 8.0,
                                    pLeftPreffix: 15.0,
                                    pTopPreffix: 10.0,
                                    pBottomPreffix: 10.0,
                                    pRightPreffix: 15.0,
                                  ),
                                  const SizedBox(height: 15,),
                                  const Text("Période de location",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                                  const SizedBox(height: 5,),
                                  ItextFieldImgIcon(
                                    focus: focusNode2,
                                    textColor: bottomNavUnSelected,
                                    prefix: Image.asset("assets/images/manage_event_programs/calendar-blue-icon.png", width: 32, height: 32,),
                                    hintText: "Début",
                                    controller: _startController,
                                    keyboardType: TextInputType.datetime,
                                    onChanged: (val) => start = val,
                                    backgroundColor: grayLocation,
                                    validator: _addLocationTitleFieldValidator,
                                    emptyValidatorText: '24 Mai 2022',
                                    radius: 8.0,
                                    pLeftPreffix: 15.0,
                                    pTopPreffix: 10.0,
                                    pBottomPreffix: 10.0,
                                    pRightPreffix: 15.0,
                                  ),
                                  const SizedBox(height: 10,),
                                  ItextFieldImgIcon(
                                    focus: focusNode3,
                                    //: labelColorTextField,
                                    textColor: bottomNavUnSelected,
                                    prefix: Image.asset("assets/images/manage_event_programs/calendar-blue-icon.png", width: 32, height: 32,),
                                    hintText: "Fin (JJ/MM/AAAA - HH:MM)",
                                    controller: _endController,
                                    keyboardType: TextInputType.datetime,
                                    onChanged: (val) => end = val,
                                    backgroundColor: grayLocation,
                                    validator: _addLocationTitleFieldValidator,
                                    emptyValidatorText: '28 Mai 2022',
                                    radius: 8.0,
                                    pLeftPreffix: 15.0,
                                    pTopPreffix: 10.0,
                                    pBottomPreffix: 10.0,
                                    pRightPreffix: 15.0,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 10,),
                            const Text("Catégorie",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: titleProgramEventManage,
                                  fontFamily: "Inter"),textAlign: TextAlign.left,),
                            const SizedBox(height: 5,),
                            Container(
                              margin: const EdgeInsets.only(top: 2.0, bottom: 15),
                              height: 92.0,
                              child: ListView(
                                primary: true,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                    width: 97.25,
                                    color: kPrimaryColor,
                                    child: Stack(
                                      children: [
                                        const Align( alignment: Alignment.bottomLeft,
                                          child: Image(image: AssetImage("assets/images/events/ellipse.png"), width: 40, height: 40,),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Image.asset("assets/images/events/free-icon-white.png", width: 45, height: 45,),
                                            ),
                                            const Center(
                                              child: Text("Gratuit",
                                                  style:TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: 97.25,
                                    color: grayLocation,
                                    child: Stack(
                                      children: [
                                        const Align( alignment: Alignment.bottomLeft,
                                          child: Image(image: AssetImage("assets/images/events/ellipse.png"), width: 40, height: 40,),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Image.asset("assets/images/events/hand-with-money.png", width: 45, height: 45,),
                                            ),
                                            const Center(
                                              child: Text("Payant",
                                                  style:TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: 97.25,
                                    color: grayLocation,
                                    child: Stack(
                                      children: [
                                        const Align( alignment: Alignment.bottomLeft,
                                          child: Image(image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"), width: 40, height: 40,),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Image.asset("assets/images/events/free-icon-black.png", width: 45, height: 45,),
                                            ),
                                            const Center(
                                              child: Text("Gratuit",
                                                  style:TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                            ),
                                            const Center(
                                              child: Text("Sur Invitation",
                                                  style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w300, fontFamily: "Inter")),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: 97.25,
                                    color: grayLocation,
                                    child: Stack(
                                      children: [
                                        const Align( alignment: Alignment.bottomLeft,
                                          child: Image(image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"), width: 40, height: 40,),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Image.asset("assets/images/events/free-icon-black.png", width: 45, height: 45,),
                                            ),
                                            const Center(
                                              child: Text("Gratuit",
                                                  style:TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                            ),
                                            const Center(
                                              child: Text("Sur Invitation",
                                                  style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w300, fontFamily: "Inter")),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text("Nombre d'invités",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                            const SizedBox(height: 5,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffE0E0E0),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: GestureDetector(
                                              onTap: () => counterMoin(),
                                              child: Image.asset("assets/images/location_settings/btn-moin.png", width: 28, height: 30,),
                                            ),),
                                          Expanded(
                                              flex: 3,
                                              child: Container(
                                                  width: 28,
                                                  height: 30,
                                                  color: whiteColor,
                                                  child:  Center(
                                                    child: Text("$positionCounter",
                                                      style: TextStyle(fontFamily: "Inter", fontSize: 14, fontWeight: FontWeight.w400, color: labelColorTextField), textAlign: TextAlign.center,),
                                                  )
                                              )
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: GestureDetector(
                                              onTap: () => counterPlus(),
                                              child: Image.asset("assets/images/location_settings/btn-plus.png", width: 28, height: 30,),
                                            ),),
                                        ],
                                      ),
                                    )
                                ),
                                Expanded(
                                    flex:1,
                                    child: Container()
                                )
                              ],
                            ),
                            const SizedBox(height: 15,),
                            const Text("Selectionner votre localisation",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                            const SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(right: 32),
                              child: ItextFieldImgIcon(
                                focus: focusNode4,
                                textColor: bottomNavUnSelected,
                                prefix: Image.asset("assets/images/manage_event_programs/location-blue-icon.png", width: 32, height: 32,),
                                suffix: const Icon(Icons.arrow_forward, color: blackTextFieldRightIcon, size: 24,),
                                hintText: "Cameroun, Douala",
                                controller: _locationController,
                                keyboardType: TextInputType.text,
                                onChanged: (val) => location = val,
                                backgroundColor: grayLocation,
                                validator: _addLocationTitleFieldValidator,
                                emptyValidatorText: 'Douala Bar 2022',
                                radius: 8.0,
                                pLeftPreffix: 15.0,
                                pTopPreffix: 10.0,
                                pBottomPreffix: 10.0,
                                pRightPreffix: 15.0,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
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
                                            value: isCheckedPublic,
                                            onChanged: (bool isOn) {
                                              if (kDebugMode) {
                                                print(isOn);
                                              }
                                              setState(() {
                                                isCheckedPublic = isOn;
                                                Global.shared.isInstructionView = isOn;
                                                isOn =!isOn;
                                                if (kDebugMode) {
                                                  print(isCheckedPublic);
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
                                        child: Text("Public",
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
                                            value: isCheckedPrivate,
                                            onChanged: (bool isOn) {
                                              if (kDebugMode) {
                                                print(isOn);
                                              }
                                              setState(() {
                                                isCheckedPrivate = isOn;
                                                Global.shared.isInstructionView = isOn;
                                                isOn =!isOn;
                                                if (kDebugMode) {
                                                  print(isCheckedPrivate);
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
                                        child: Text("Privé",
                                            style: TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter")),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: const [
                                Image(image: AssetImage("assets/images/events/check-box-square.png"), width: 24, height: 24,),
                                SizedBox(width: 8,),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 32),
                                    child: Text("Aimeriez-vous souscrire à un forfait sms  pour les notifications à vos invités ?",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, fontFamily: "Inter", color: labelColorTextField),),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.97, right: 32.0),
                              child: CustomButton(
                                color: kPrimaryColor,
                                text: 'Continuer',
                                textColor: Colors.white,
                                onPressed: () async {
                                  Navigator.of(context, rootNavigator: true).pushNamed(InvoicePageView.pageName);
                                },
                              ),
                            ),
                            //const SizedBox(height: 15.97,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
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
