

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/program_model.dart';
import '../../../utils/screen_size.dart';
import '../../../widgets/custom_widgets.dart';
import '../../../widgets/location_base_settings_widget.dart';

class PanierItemsListPageView extends StatefulWidget {
  static const String pageName = "events/host_create/panier_items_list";
  List<ProgramModel> listProgramModel = [];
  PanierItemsListPageView({Key? key, required this.listProgramModel}) : super(key: key);

  @override
  State<PanierItemsListPageView> createState() => _PanierItemsListPageViewState();
}


class _PanierItemsListPageViewState extends State<PanierItemsListPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late int total;
  AutovalidateMode? _autovalidate;
  late final _creatAssociateAccountFormKey;
  var focusNode1 = FocusNode();
  String? phone;
  final TextEditingController _addPhoneController = TextEditingController();
  String checkedIcon = "assets/images/events/check-box.png";
  String checkedIconSelected = "assets/images/events/check-box-green.png";

  @override
  void initState() {
    super.initState();
    total = 0;
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _creatAssociateAccountFormKey = GlobalKey<FormState>();
  }


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return LocationBaseAssociateAccountWidget(
      containerWidget: Container(
          margin: EdgeInsets.only(top: media.longestSide <= 775
              ? screenAwareSize(100, context)
              : screenAwareSize(115, context),
              bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ListView(
          //shrinkWrap: true,
          children: [
            ListView.separated(
              //padding: const EdgeInsets.only(top: 117),
              shrinkWrap: true,
              primary: false,
              itemCount: widget.listProgramModel.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 1, indent: 32, endIndent: 24, color: Color(0xffE4DFDF),);
              },
              itemBuilder: (_, position){
                /*setState(() {
                  total = widget.listProgramModel[position].amount != null ?
                  widget.listProgramModel[position].amount! : 0;
                });*/

                return InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32, right: 24, bottom: 15, top: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Image.asset(widget.listProgramModel[position].img!, width: 79, height: 92,),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.listProgramModel[position].startDate,
                                    style:const TextStyle(fontSize: 10, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                  Image.asset("assets/images/events/corbeille-red.png", width: 24, height: 24,),
                                ],
                              ),
                              const SizedBox(height: 4,),
                              Text(widget.listProgramModel[position].title,
                                style:const TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                              const SizedBox(height: 8,),
                              if(widget.listProgramModel[position].amount != null)...{
                                Text("${widget.listProgramModel[position].amount} ${widget.listProgramModel[position].unity}",
                                  style:const TextStyle(fontSize: 17, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Impact",), textAlign: TextAlign.center,),
                              },
                              const SizedBox(height: 9,),
                              Row(
                                children: [
                                  Image.asset("assets/images/events/location-event-icon.png", width: 14, height: 14,),
                                  const SizedBox(width: 6,),
                                  Text(widget.listProgramModel[position].location,
                                    style:const TextStyle(fontSize: 10, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,)
                                ],)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16,),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 18, right: 24, bottom: 17, top: 10),
                  decoration: const BoxDecoration(
                      color: grayLocation
                  ),
                  child: Row(
                    children: [
                      const Text("Total à payer : ",
                        style:TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Impact",), textAlign: TextAlign.center,),
                      Text("75 000 ${widget.listProgramModel.first.unity}",
                        style:const TextStyle(fontSize: 25, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Impact",), textAlign: TextAlign.center,),
                    ],
                  )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26.0, bottom: 18, left: 22, right: 24),
              child: CustomButton(
                color: kPrimaryColor,
                text: 'Payer',
                textColor: Colors.white,
                textSize: 13.0,
                onPressed: () async {
                  //Navigator.of(context, rootNavigator: true).pushNamed(AddNewEventStep2PageView.pageName);
                  getNumberBottomSheet(context);
                },
              ),
            ),
          ],
        )
      ),
      title: "Panier",
      iconMenuLeft: "assets/images/events/arrow-left-rounded-gray.png",
      onPressedMenuLeft:() {
        Navigator.of(context).pop();
      },
      devKey: _scaffoldKey,
      fullBgImg: "",
      bgHeader: "assets/images/events/bg-header-paner.png",
      isBottomNav: false,
      isDrawerNavRight: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
  getNumberBottomSheet(context) {
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
                  const SizedBox(height: 24.0,),
                  Form(
                    autovalidateMode: _autovalidate,
                    key: _creatAssociateAccountFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Numéro de téléphone',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),
                        ),
                        const SizedBox(height: 5,),
                        ItextFieldImgIcon(
                            focus: focusNode1,
                            labelColor: labelColorTextField,
                            textColor: labelColorTextField,
                            prefix: Image.asset("assets/images/events/phone-blue-icon.png", width: 22, height: 22,),
                            hintText: "Entrer votre numero de telephone",
                            controller: _addPhoneController,
                            keyboardType: TextInputType.number,
                            onChanged: (val) => phone = val,
                            backgroundColor: const Color(0xffE0E0E0),
                            validator: _addLocationTitleFieldValidator,
                            emptyValidatorText: 'Entrer votre numero de telephone',
                            radius: 12.0,
                            pLeftPreffix: 10.0,
                            pTopPreffix: 5.0,
                            pBottomPreffix: 5.0,
                            pRightPreffix: 10.0,
                            suffixbgColor: true
                        ),
                        const SizedBox(height: 25,),

                        CustomButton(
                          color: kPrimaryColor,
                          text: 'Continuer',
                          textColor: Colors.white,
                          onPressed: () async {
                            Navigator.of(context).pop();
                            //Future.delayed(const Duration(seconds: 4));
                            getPaymentMode(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 27),
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

  getPaymentMode(context) {
    final wv = MediaQuery.of(context).size.width / 100;
    bool isCheckedPaymentMode = false;
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
        builder: (context) => StatefulBuilder(
            builder: (context, StateSetter setState) {
              return SingleChildScrollView(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          'Choisir un mode de paiement',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19, fontFamily: "Inter", color: titleProgramEventManage),
                        ),
                        const SizedBox(height: 11.0,),
                        Container(height: 2, color: titleProgramEventManage,),
                        const SizedBox(height: 11.0,),
                        Container(width: (wv*100)/2, height: 2, color: titleProgramEventManage,),
                        const SizedBox(height: 25.0,),
                        ListView(
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 11),
                              child: InkWell(
                                splashColor: Colors.grey,
                                onTap: (){
                                  setState(() {
                                    isCheckedPaymentMode = !isCheckedPaymentMode;
                                  });
                                },
                                child: Container(
                                  //margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  //padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 2),
                                  decoration:BoxDecoration(
                                    color: !isCheckedPaymentMode ? whiteColor : titleProgramEventManage,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 1.0, color: kPrimaryColor),
                                  ),
                                  child: ListTile(
                                    enabled: true,
                                    selected: true,
                                    selectedColor: Colors.green,
                                    selectedTileColor: Colors.black,
                                    leading: Image.asset("assets/images/events/logos_mastercard.png", width: 50, height: 50,),
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Carte Master",
                                          style: TextStyle(fontSize: 16, color: !isCheckedPaymentMode ?titleProgramEventManage : whiteColor, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                        if(isCheckedPaymentMode)...{
                                          Image.asset(checkedIconSelected, width: 20, height: 20,)
                                        }else...{
                                          Image.asset(checkedIcon, width: 20, height: 20,)
                                        },
                                      ],
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text("**** **** **** 8587",
                                            style: TextStyle(fontSize: 13, color: !isCheckedPaymentMode ?titleProgramEventManage: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                        ),

                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 11),
                              child: InkWell(
                                splashColor: Colors.grey,
                                onTap: (){
                                  setState(() {
                                    isCheckedPaymentMode = !isCheckedPaymentMode;
                                  });
                                },
                                child: Container(
                                  //margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  //padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 2),
                                  decoration:BoxDecoration(
                                    color: !isCheckedPaymentMode ? whiteColor : titleProgramEventManage,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 1.0, color: kPrimaryColor),
                                  ),
                                  child: ListTile(
                                    leading: Image.asset("assets/images/events/logos_visa.png", width: 50, height: 50,),
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Carte Visa",
                                          style: TextStyle(fontSize: 16, color: !isCheckedPaymentMode ?titleProgramEventManage : whiteColor, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                        if(isCheckedPaymentMode)...{
                                          Image.asset(checkedIconSelected, width: 20, height: 20,)
                                        }else...{
                                          Image.asset(checkedIcon, width: 20, height: 20,)
                                        },
                                      ],
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text("**** **** **** 8587",
                                            style: TextStyle(fontSize: 13, color: !isCheckedPaymentMode ?titleProgramEventManage: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                        ),

                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 11),
                              child: InkWell(
                                splashColor: Colors.grey,
                                onTap: (){
                                  setState(() {
                                    isCheckedPaymentMode = !isCheckedPaymentMode;
                                  });
                                },
                                child: Container(
                                  //margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  //padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 2),
                                  decoration:BoxDecoration(
                                    color: !isCheckedPaymentMode ? whiteColor : titleProgramEventManage,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 1.0, color: kPrimaryColor),
                                  ),
                                  child: ListTile(
                                    leading: Image.asset("assets/images/events/logos_paypal.png", width: 50, height: 50,),
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Paypal",
                                          style: TextStyle(fontSize: 16, color: !isCheckedPaymentMode ?titleProgramEventManage : whiteColor, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                        if(isCheckedPaymentMode)...{
                                          Image.asset(checkedIconSelected, width: 20, height: 20,)
                                        }else...{
                                          Image.asset(checkedIcon, width: 20, height: 20,)
                                        },
                                      ],
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text("**** **** **** 8587",
                                            style: TextStyle(fontSize: 13, color: !isCheckedPaymentMode ?titleProgramEventManage: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                        ),

                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              height: 40,
                              minWidth: 152.5,
                              padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                              color: titleProgramEventManage,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Revenir',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                            ),
                            const SizedBox(width: 15,),
                            MaterialButton(
                                height: 40,
                                minWidth: 152.5,
                                padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                                color: kPrimaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                                onPressed: () {
                                  //Navigator.of(context, rootNavigator: true).pushNamed(SuccessEventsPageView.pageName);
                                  Navigator.of(context, rootNavigator: true).pop();
                                  showDialog(
                                      barrierColor: Colors.transparent,
                                      context: context,
                                      builder: (context){
                                        final hv =MediaQuery.of(context).size.height/100;
                                        final wv =MediaQuery.of(context).size.width/100;
                                        return Center(
                                          child: Container(
                                            margin: const EdgeInsets.only(left: 27, right: 27, bottom: 100, top: 130),
                                            decoration:BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                color: Colors.white,
                                                //border: Border.all(width: 1.0, color: kPrimaryColor),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black.withOpacity(0.1),
                                                      blurRadius: 32,
                                                      spreadRadius: 0.2,
                                                      offset: const Offset(0, 8)),
                                                ]
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                const SizedBox(height: 27,),
                                                SizedBox(
                                                  width: wv*40,
                                                  child: Image.asset('assets/images/check_success-green.png'),
                                                ),
                                                SizedBox(height: hv * 8.0),
                                                const Text("Le Paiement a été effectué",
                                                  style:TextStyle(fontSize: 20.0, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.center,),
                                                SizedBox(height: hv * 2),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 21, right: 37),
                                                  child: CustomButton(
                                                    color: kPrimaryColor,
                                                    text: 'Revenir',
                                                    textColor: Colors.white,
                                                    onPressed: () async {
                                                      Navigator.of(context).pop();
                                                      //Navigator.of(context).pushNamed(SuccessProgramPageView.pageName);
                                                    },
                                                  ),
                                                ),

                                                const SizedBox(height: 14,),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Row(
                                  children: const [
                                    Text('Continuer',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                                    SizedBox(width: 12,),
                                  ],
                                )
                            ),
                          ],
                        ),
                        const SizedBox(height: 41,),
                      ],
                    ),
                  ),
                ),
              );
            }
        ));
  }
}