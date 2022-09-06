import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/events_delegate_details_model.dart';
import '../../models/events_delegate_model.dart';
import '../../models/filter_model.dart';
import '../../widgets/bottom_widget.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/filter_row.dart';


class EventsPageView extends StatefulWidget {
  const EventsPageView({Key? key}) : super(key: key);
  static const String pageName = "events";

  @override
  State<EventsPageView> createState() => _EventsPageViewState();
}

class _EventsPageViewState extends State<EventsPageView> {
  List<FilterModel> sampleData = <FilterModel>[];
  @override
  void initState() {
    super.initState();
    sampleData.add(FilterModel(title: "Délégué", selected: false));
    sampleData.add(FilterModel(title: "Protocole", selected: false));
    sampleData.add(FilterModel(title: "Serveur", selected: false));
    sampleData.add(FilterModel(title: "Invité", selected: false));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          final _media = MediaQuery.of(context).size;

          final _loginFormKey = GlobalKey<FormState>();
          final TextEditingController _codeBlinderController = TextEditingController();
          final TextEditingController _codeAccessController = TextEditingController();
          String? userPassword;
          AutovalidateMode? _autovalidate;

          return Scaffold(
            backgroundColor: Colors.white,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 70, right: 20),
              child: FloatingActionButton(
                backgroundColor: kPrimaryColor,
                onPressed: () {
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
                        child: Padding(
                          padding: EdgeInsets.only(top: 7,  right: 34,  left: 34,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children:  [
                              Center(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
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
                              const SizedBox( height: 30.0),
                              const Center(
                                child: Text(
                                  'S\'associer à un nouvel évènement',
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19, fontFamily: "Inter", color: labelColorTextField),
                                ),
                              ),
                              const SizedBox( height: 20.0),
                              Form(
                                autovalidateMode: _autovalidate,
                                key: _loginFormKey,
                                child: Column(
                                  children: <Widget>[

                                    ItextField(
                                      hintText: 'Nom d\'accès',
                                      controller: _codeBlinderController,
                                      emptyValidatorText: 'Entrez un Nom d\'accès',
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _emailFieldValidator,
                                      icon: Icons.email,
                                      labelColor: labelColorTextField,
                                    ),

                                    SizedBox(height: hv * 3.0),

                                    IpasswordField(
                                      hintText: 'Code d\'accès',
                                      keyboardType: TextInputType.text,
                                      controller: _codeAccessController,
                                      onSavedFunc: (value) => userPassword = value,
                                      emptyValidatorText: 'Entrez votre Code d\'accès',
                                      validator: _passwordFieldValidator,
                                      color: labelColorTextField,
                                    ),

                                    SizedBox(height: hv * 3.0),

                                    CustomButton(
                                      color: kPrimaryColor,
                                      text: 'Se connecter',
                                      textColor: Colors.white,
                                      onPressed: () async {
                                        print("se connecter");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 45),
                              const BottomWidget()
                            ],
                          ),
                        ),
                      ));
                },
                child: const Icon(Icons.add),
              ),
            ),
            body: Stack(
              //fit: StackFit.expand,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 21),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: labelColorTextField,
                              size: 22,
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                          ),
                          const Text("Mes évènements", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: labelColorTextField),textAlign: TextAlign.left,),
                        ],
                      ),
                      //SizedBox(width: 54,),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              _myFilter();
                            },
                            icon: Image.asset("assets/images/delegate_account/filter.png", width: 24, height: 24,)
                          ),
                          const Text("Filter", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "Inter", color: kPrimaryColor),)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  //color: Colors.green,
                  padding: EdgeInsets.only(left: 31, right: 30, top: 64),
                  child: ListView.builder(
                    itemCount: itemData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 20),
                          //borderRadius: BorderRadius.circular(16),
                        /*decoration:BoxD.ecoration(
                          color: Color.fromRGBO(217, 83, 45, 0.08),
                          borderRadius: BorderRadius.circular(16),
                        ),*/
                        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side:const BorderSide(color: Colors.green),),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: ExpansionPanelList(
                            animationDuration: Duration(milliseconds: 500),
                            dividerColor: Colors.white,
                            elevation: 1,
                            children: [
                              ExpansionPanel(
                                  backgroundColor: itemData[index].bgColor,
                                  isExpanded: itemData[index].expanded,
                                  headerBuilder: (BuildContext context, bool isExpanded) {
                                    return Container(
                                      padding: const EdgeInsets.only(left: 20, top: 12),
                                      child:Text(
                                        "Propriétaire : ${itemData[index].headerItem}",
                                        style: TextStyle(
                                            color: itemData[index].txtColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Inter"
                                        ),
                                      ),
                                    );
                                  },
                                  body: Column(
                                    children: [
                                      const Divider(color: Colors.white, height: 0.1,),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: const ClampingScrollPhysics(),
                                          itemCount: itemData[index].eventsDelegateDetailsModel.length,
                                          itemBuilder: (BuildContext context, int position){
                                            return Container(
                                              //color: itemData[index].bgColor,
                                              /*decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 83, 45, 0.08),
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                ),*/
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 10,),
                                                  Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                                                      decoration:BoxDecoration(
                                                        color: whiteColor,
                                                        borderRadius: BorderRadius.circular(18),
                                                        boxShadow: const [
                                                          BoxShadow(color: Color.fromRGBO(0, 85, 136, 0.06), blurRadius: 16.0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Image.asset(
                                                            itemData[index].eventsDelegateDetailsModel[position].img,
                                                            fit: BoxFit.cover,
                                                            height: 24,
                                                            width: 24,
                                                          ),
                                                          const SizedBox(width: 7.24,),
                                                          Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    itemData[index].eventsDelegateDetailsModel[position].discription,
                                                                    style: const TextStyle(
                                                                        color: successTextColor,
                                                                        fontSize: 13,
                                                                        //letterSpacing: 0.3,
                                                                        fontWeight: FontWeight.w600,
                                                                        //height: 1.3
                                                                        fontFamily: "Inter"
                                                                    ),
                                                                  ),
                                                                  const Divider(color: Color(0xD9532D4D), height: 5,),
                                                                  Row(
                                                                    children: [
                                                                      Image.asset("assets/images/delegate_account/calendar.png", width: 12, height: 12,),
                                                                      const SizedBox(width: 6.5,),
                                                                      Text("${itemData[index].eventsDelegateDetailsModel[position].startDate} - ${itemData[index].eventsDelegateDetailsModel[position].endDate}",
                                                                        style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w500, fontFamily: "Inter",  color: successTextColor,),),
                                                                      const SizedBox(width: 31.51,),
                                                                      Image.asset("assets/images/delegate_account/serveur.png", width: 12, height: 12,),
                                                                      const SizedBox(width: 6.5,),
                                                                      const Expanded(
                                                                        child: Text("Serveur",
                                                                          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, fontFamily: "Inter",  color: successTextColor,),),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  const SizedBox(height: 6,),
                                                                  Row(
                                                                    children: [
                                                                      Image.asset("assets/images/delegate_account/historique.png", width: 12, height: 12,),
                                                                      const SizedBox(width: 6.5,),
                                                                      Text(itemData[index].eventsDelegateDetailsModel[position].hour,
                                                                        style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w500, fontFamily: "Inter",  color: successTextColor,),),
                                                                    ],
                                                                  )
                                                                ],
                                                              )

                                                          )
                                                        ],
                                                      )

                                                  ),
                                                  const SizedBox(height: 12,)
                                                ],
                                              ),
                                            );
                                          }),
                                    ],
                                  )
                              ),
                            ],
                            expansionCallback: (int item, bool status) {
                              setState(() {
                                itemData[index].expanded = !itemData[index].expanded;
                              });
                            },
                          ),
                        )
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: const BottomWidget())
              ],
            ),
          );
        });
  }

  _myFilter() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            titlePadding: EdgeInsets.only(left: 43, top: 19, bottom: 8,right: 38),
            title: Text(
              "Filtrer par type d'évènement", textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.w700),),
            contentPadding: EdgeInsets.only(left: 43, top: 9, bottom: 27, right: 38),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: sampleData.length == 0 ?
              Container():
              Container(
                width: 500,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.zero,
                      child: ListView.builder(
                        //separatorBuilder: (context, index) => Divider(color: Colors.grey,),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: sampleData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            highlightColor: kPrimaryColor,
                            splashColor: Colors.blueAccent,
                            onTap: () {
                              setState(() {
                                for (var element in sampleData) {
                                  element.selected = false;
                                }
                                sampleData[index].selected = true;
                                print(sampleData[index].selected);
                              });
                            },
                            child: FilterRow(sampleData[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actionsPadding: EdgeInsets.fromLTRB(11, 0, 29, 15.17),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: kPrimaryColor)),
            ),
            MaterialButton(
                height: 40,
                minWidth: 117,
                padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                onPressed: () {
                  print("Apply");
                },
                child: const Text('Apply',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
              ),

          ],
          );
      },
    );
  }



  List<EventsDelegateModel> itemData = <EventsDelegateModel>[
    EventsDelegateModel(
        headerItem: 'Jules Kongo',
        bgColor: const Color.fromRGBO(217, 83, 45, 0.08),
        txtColor: kPrimaryColor,
        eventsDelegateDetailsModel: [
          EventsDelegateDetailsModel(
            discription:
            "Anniversaire de la copine de mon beau-frere paternel de longue date",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_orange.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

          EventsDelegateDetailsModel(
            discription:
            "Mariage de Sandra",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_blue.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

        ]
    ),
    EventsDelegateModel(
        headerItem: 'Eric Kontchou',
        bgColor: const Color.fromRGBO(1, 178, 241, 0.08),
        txtColor: bottomNavSelected,
        eventsDelegateDetailsModel: [
          EventsDelegateDetailsModel(
            discription:
            "Anniversaire de la copine de mon beau-frere paternel de longue date",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_orange.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

          EventsDelegateDetailsModel(
            discription:
            "Mariage de Sandra",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_blue.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

        ]
    ),
    EventsDelegateModel(
        headerItem: 'Fabiola Rose',
        bgColor: const Color.fromRGBO(39, 174, 96, 0.08),
        txtColor: greenColor,
        eventsDelegateDetailsModel: [
          EventsDelegateDetailsModel(
            discription:
            "Anniversaire de la copine de mon beau-frere paternel de longue date",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_orange.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

          EventsDelegateDetailsModel(
            discription:
            "Mariage de Sandra",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_blue.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

        ]
    ),
    EventsDelegateModel(
        headerItem: 'Salomon Mike',
        bgColor: const Color.fromRGBO(217, 83, 45, 0.08),
        txtColor: kPrimaryColor,
        eventsDelegateDetailsModel: [
          EventsDelegateDetailsModel(
            discription:
            "Anniversaire de la copine de mon beau-frere paternel de longue date",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_orange.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

          EventsDelegateDetailsModel(
            discription:
            "Mariage de Sandra",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_blue.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

        ]
    ),
    EventsDelegateModel(
        headerItem: 'Rodrigue Ngakam',
        bgColor: const Color.fromRGBO(187, 107, 217, 0.08),
        txtColor: violetColor,
        eventsDelegateDetailsModel: [
          EventsDelegateDetailsModel(
            discription:
            "Anniversaire de la copine de mon beau-frere paternel de longue date",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_orange.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

          EventsDelegateDetailsModel(
            discription:
            "Mariage de Sandra",
            colorsItem: Colors.white,
            img: 'assets/images/delegate_account/event_details_blue.png',
            startDate: '02 Dec 2021',
            endDate: '03 Dec 2021',
            hour: '14:00',
          ),

        ]
    ),
  ];

  /*List itemDataDetails = [
    EventsDelegateDetailsModel(
        discription:
        "Anniversaire de la copine de mon beau-frere paternel de longue date",
        colorsItem: Colors.white,
        img: 'assets/images/delegate_account/event_details_orange.png',
        startDate: '02 Dec 2021',
        endDate: '03 Dec 2021',
        hour: '14:00',
    ),

    EventsDelegateDetailsModel(
      discription:
      "Mariage de Sandra",
      colorsItem: Colors.white,
      img: 'assets/images/delegate_account/event_details_blue.png',
      startDate: '02 Dec 2021',
      endDate: '03 Dec 2021',
      hour: '14:00',
    ),
  ];*/

  String? _emailFieldValidator(String? value) {
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

  // Fonction de validation du mot de passe

  String? _passwordFieldValidator(String? value) {
    if (value!.isEmpty) {
      return "Entrez votre mot de passe";
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]{5,5}\$";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the password is valid
      return null;
    }
    // The pattern of the password didn't match the regex above.
    return 'Password must be 5 characters long';
  }

}

