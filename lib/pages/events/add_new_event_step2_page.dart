import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/program_model.dart';
import '../../utils/screen_size.dart';
import '../../widgets/custom_widgets.dart';
import '../notifications_page.dart';

class AddNewEventStep2PageView extends StatefulWidget {
  static const String pageName = "events/add_new_event_step2";
  const AddNewEventStep2PageView({Key? key}) : super(key: key);

  @override
  State<AddNewEventStep2PageView> createState() => _AddNewEventStep2PageViewState();
}

class _AddNewEventStep2PageViewState extends State<AddNewEventStep2PageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  List<ProgramModel> listProgramModel = [];
  late int counter = 0;
  String checkedIcon = "assets/images/events/check-box.png";
  String checkedIconSelected = "assets/images/events/check-box-green.png";
  AutovalidateMode? _autovalidate;
  late final _creatAssociateAccountFormKey;
  var focusNode1 = FocusNode();
  String? phone;
  final TextEditingController _addPhoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _creatAssociateAccountFormKey = GlobalKey<FormState>();
    listProgramModel.add(ProgramModel(
        title: "Mariage d'Aicha et Martial",
        location: 'Au marché de Mfou',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/manage_event_programs/calendar-img.png"));
    listProgramModel.add(ProgramModel(
        title: "Concert de Tenor",
        location: 'Au palais des sports',
        startDate: 'Jeudi 25 jan 2020',
        endDate: null,
        amount: null,
        unity: null,
        isPackage: true,
        img: "assets/images/manage_event_programs/wedding.png"));
    listProgramModel.add(ProgramModel(
        title: "Mariage d'Aicha et Martial",
        location: 'Au marché de Mfou',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/manage_event_programs/wedding.png"));

    for(var dev in listProgramModel){
      if(dev.isChecked!){
        counter++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          final media = MediaQuery.of(context).size;
          return Scaffold(
            //backgroundColor: Colors.green,
            resizeToAvoidBottomInset: false,
            body: ListView(
              padding: EdgeInsets.zero,
              //physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  //color: Colors.grey.shade50,
                  height: 230,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Stack(
                              children: <Widget>[
                                Material(
                                  elevation: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage('assets/images/events/wedding_del_home2.png'),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          )
                        ],
                      ),
                      Positioned(
                        top: media.longestSide <= 775
                            ? screenAwareSize(20, context)
                            : screenAwareSize(35, context),
                        left: 1,
                        right: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                  const Text("Ajouter un évènement", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color.fromRGBO(255, 255, 255, 0.8)),textAlign: TextAlign.left,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 0,
                        right: 0,
                        child: Container(
                        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 0),
                        child: Container(
                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          decoration:BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 16,
                                    spreadRadius: 0.2,
                                    offset: const Offset(0, 8)),
                              ]
                          ),
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              child: const Expanded(
                                child: Text("Mariage d'Aîcha et de Michael pour leur bonheur",
                                    style:TextStyle(fontSize: 23, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: 'Inter',)),
                              )
                          ),
                        ),
                      ),)
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 37),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const Text("Liste des programmes ", style: TextStyle(
                              fontSize: 18.0, color: labelColorTextField, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontFamily: "Inter"),
                          ),
                          RichText(
                            text: TextSpan(
                              //style: TextStyle(color: Colors.red, fontSize: 16),
                              children: [
                                const TextSpan(text: "45 000",
                                    style:TextStyle(fontSize: 20.578, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
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
                      const SizedBox(height: 15,),
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          itemCount: listProgramModel.length,
                          itemBuilder: (context, int position){
                            return Container(
                              padding: const EdgeInsets.only(bottom: 26),
                              child: InkWell(
                                splashColor: Colors.grey,
                                onTap: (){
                                  setState(() {

                                    if(listProgramModel[position].isChecked!){
                                      counter--;
                                      if(counter<0){
                                        counter = 0;
                                      }
                                    }else{
                                      counter++;
                                      if(counter<0){
                                        counter = 0;
                                      }
                                    }
                                    listProgramModel[position].isChecked = !listProgramModel[position].isChecked!;
                                    getBottomSheet(context);
                                  });
                                },
                                child: Container(
                                  //margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  //padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 2),
                                  decoration:BoxDecoration(
                                    color: !listProgramModel[position].isChecked! ? whiteColor : titleProgramEventManage,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 1.0, color: kPrimaryColor),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        enabled: true,
                                        selected: true,
                                        selectedColor: Colors.green,
                                        selectedTileColor: Colors.black,
                                        leading: Container(
                                          //padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Image.asset(listProgramModel[position].img!),
                                        ),
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(listProgramModel[position].title,
                                              style: TextStyle(fontSize: 16, color: !listProgramModel[position].isChecked! ?titleProgramEventManage : whiteColor, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                            if(listProgramModel[position].isChecked!)...{
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
                                              child: Text(listProgramModel[position].location,
                                                style: TextStyle(fontSize: 13, color: !listProgramModel[position].isChecked! ?titleProgramEventManage: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                            ),

                                          ],
                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 34),
                        child: CustomButton(
                          color: kPrimaryColor,
                          text: 'Continuer',
                          textColor: Colors.white,
                          onPressed: () async {
                            //Navigator.of(context, rootNavigator: true).pushNamed(DelegateLoginStep2PageView.pageName);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26,)
              ],
            ),
          );
        });
  }

  getBottomSheet(context) {
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
