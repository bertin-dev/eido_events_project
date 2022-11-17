
import 'package:eido_events_project/pages/events/success_renew_event_page.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class InvoicePageView extends StatefulWidget {
  const InvoicePageView({Key? key}) : super(key: key);
  static const String pageName = "events/invoice";

  @override
  State<InvoicePageView> createState() => _InvoicePageViewState();
}

class _InvoicePageViewState extends State<InvoicePageView> {
  String checkedIcon = "assets/images/events/check-box.png";
  String checkedIconSelected = "assets/images/events/check-box-green.png";

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation){
        final hv =MediaQuery.of(context).size.height/100;
        final wv =MediaQuery.of(context).size.width/100;
        return Scaffold(
          backgroundColor: whiteColor,
          resizeToAvoidBottomInset: false,
          body: ListView(
            padding: const EdgeInsets.only(left: 15, right: 15),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 97, bottom: 29),
                padding: const EdgeInsets.only(left: 37, right: 37),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: whiteColor,
                  border: Border.all(width: 1.0, color: kPrimaryColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0,),
                    const Text(
                      'Devis',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19, fontFamily: "Inter", color: titleProgramEventManage),
                    ),
                    const SizedBox(height: 11.0,),
                    Container(height: 2, color: titleProgramEventManage,),
                    const SizedBox(height: 7.0,),
                    Container(width: (wv*100)/2, height: 2, color: titleProgramEventManage,),
                    const SizedBox(height: 35.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Date de début",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),
                            Text("25 mai 2022",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.54, fontFamily: "Inter", color: titleProgramEventManage),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Date de fin",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),
                            Text("22 Avril 2022",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.54, fontFamily: "Inter", color: titleProgramEventManage),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 12.95,),
                    const Divider(color: Color(0xffFEE2EA), height: 5, thickness: 1,),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Nombre de jour",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),
                            Text("12",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.54, fontFamily: "Inter", color: titleProgramEventManage),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Categorie",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),
                            Text("Payant             ",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.54, fontFamily: "Inter", color: titleProgramEventManage),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 12.95,),
                    const Divider(color: Color(0xffFEE2EA), height: 5, thickness: 1,),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Nombre d'invité",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),
                            Text("458",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.54, fontFamily: "Inter", color: titleProgramEventManage),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Nombre de protocole",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),
                            Text("15",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.54, fontFamily: "Inter", color: titleProgramEventManage),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 12.95,),
                    const Divider(color: Color(0xffFEE2EA), height: 5, thickness: 1,),


                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Pays",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),

                            Row(
                              children: [
                                const Text("Cameroun",
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.54, fontFamily: "Inter", color: titleProgramEventManage),),
                                const SizedBox(width: 3,),
                                Image.asset("assets/images/events/emojione-v1_flag-for-cameroon.png", width: 20, height: 20,)
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Ville",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),
                            Text("Douala             ",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.54, fontFamily: "Inter", color: titleProgramEventManage),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 12.95,),
                    const Divider(color: Color(0xffFEE2EA), height: 5, thickness: 1,),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Jour de l'évènement",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),
                            Text("23-48-85",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.54, fontFamily: "Inter", color: titleProgramEventManage),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.41,),

                    const Text("----------------------",
                      style: TextStyle(color: titleProgramEventManage, fontSize: 25),),

                    const SizedBox(height: 20,),

                    Center(
                      child: Column(
                        children: const [
                          Text("Montant à payer",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.36, fontFamily: "Inter", color: Color(0xff4F4F4F)),),
                          Text("520 000 XAF",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 33.47, fontFamily: "Inter", color: titleProgramEventManage),),
                        ],
                      ),
                    ),

                    const SizedBox(height: 34.41,),

                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    height: 40,
                    minWidth: 117,
                    padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                    color: labelColorTextField,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Annuler',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                  ),
                  const SizedBox(width: 15,),
                  MaterialButton(
                      height: 40,
                      minWidth: 117,
                      padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                      onPressed: () {
                        getPaymentMode(context);
                      },
                      child: const Text('Continuer',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                  ),
                ],
              ),
              const SizedBox(height: 97,),
            ],
          ),
        );
      },
    );
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
                                  Navigator.of(context, rootNavigator: true).pushNamed(SuccessRenewEventsPageView.pageName);
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
