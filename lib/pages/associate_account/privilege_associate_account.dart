import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/privilege_model.dart';
import '../../widgets/location_base_settings_widget.dart';
import '../delegate_account/delegate_login_page.dart';

class PrivilegeAssociateAccountPageView extends StatefulWidget {
  static const String pageName = "associate_account/privilege";
  const PrivilegeAssociateAccountPageView({Key? key}) : super(key: key);

  @override
  State<PrivilegeAssociateAccountPageView> createState() => _PrivilegeAssociateAccountPageViewState();
}

class _PrivilegeAssociateAccountPageViewState extends State<PrivilegeAssociateAccountPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();

  }

  @override
  Widget build(BuildContext context) {

    return MenuEditBaseAssociateAccountWidget(
        containerWidget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 298, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Privilège",
                    style: TextStyle(fontSize: 23.0, color: kPrimaryColor.withOpacity(0.84), fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.left,),
                  const SizedBox(height: 3,),
                  const Text("Vous avez également la possibilité de modifier les privilège d'un profil",
                    style: TextStyle(fontSize: 13.0, color: Color(0xff07394B), fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.left,),

                  const SizedBox(height: 28,),

                  const Text("Utilisateurs",
                    style: TextStyle(fontSize: 19.0, color: Colors.black, fontWeight: FontWeight.w600, fontFamily: "Inter"), textAlign: TextAlign.left,),
                  const SizedBox(height: 11,),

                  for(int position=0;position<listPrivilege.length;position++)...{
                    InkWell(
                      onTap: (){
                        //Navigator.of(context).pushNamed(ListAssociateAccountPageView.pageName);
                      },
                      child: Container(
                          decoration:BoxDecoration(
                            color: const Color(0xffF3F3F3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      listPrivilege[position].icon,
                                      const SizedBox(width: 8,),
                                      Text(listPrivilege[position].name,
                                        style: const TextStyle(fontSize: 15, color: successTextColor, fontWeight: FontWeight.w400, fontFamily: 'Inter'),),
                                    ],
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Switch(
                                      value: listPrivilege[position].isChecked,
                                      onChanged: (bool isOn) {
                                        if (kDebugMode) {
                                          print(isOn);
                                        }
                                        setState(() {
                                          //listPrivilege[position].isChecked = isOn;
                                          Global.shared.isInstructionView = isOn;
                                          isOn =!isOn;
                                          if (kDebugMode) {
                                            print(listPrivilege[position].isChecked);
                                          }
                                        });
                                      },
                                      activeColor: greenColor,
                                      inactiveTrackColor: Colors.grey,
                                      inactiveThumbColor: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              Container(height: 1, color: Colors.black.withOpacity(0.1))
                            ],
                          )
                      ),
                    )
                  },



                  const SizedBox(height: 28,),

                  const Text("Evènements",
                    style: TextStyle(fontSize: 19.0, color: Colors.black, fontWeight: FontWeight.w600, fontFamily: "Inter"), textAlign: TextAlign.left,),
                  const SizedBox(height: 11,),

                  for(int position=0;position<listEvenements.length;position++)...{
                    InkWell(
                      onTap: (){
                        //Navigator.of(context).pushNamed(ListAssociateAccountPageView.pageName);
                      },
                      child: Container(
                          decoration:BoxDecoration(
                            color: const Color(0xffF3F3F3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      listPrivilege[position].icon,
                                      const SizedBox(width: 8,),
                                      Text(listPrivilege[position].name,
                                        style: const TextStyle(fontSize: 15, color: successTextColor, fontWeight: FontWeight.w400, fontFamily: 'Inter'),),
                                    ],
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Switch(
                                      value: listPrivilege[position].isChecked,
                                      onChanged: (bool isOn) {
                                        if (kDebugMode) {
                                          print(isOn);
                                        }
                                        setState(() {
                                          //listPrivilege[position].isChecked = isOn;
                                          Global.shared.isInstructionView = isOn;
                                          isOn =!isOn;
                                          if (kDebugMode) {
                                            print(listPrivilege[position].isChecked);
                                          }
                                        });
                                      },
                                      activeColor: greenColor,
                                      inactiveTrackColor: Colors.grey,
                                      inactiveThumbColor: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              Container(height: 1, color: Colors.black.withOpacity(0.1))
                            ],
                          )
                      ),
                    )
                  },

                  const SizedBox(height: 34,),

                  /*const Text("Evènements",
                    style: TextStyle(fontSize: 19.0, color: Colors.black, fontWeight: FontWeight.w600, fontFamily: "Inter"), textAlign: TextAlign.left,),
                  const SizedBox(height: 11,),

                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: listEvenements.length,
                    separatorBuilder: (BuildContext context, int index) => Container(height: 1, color: Colors.black.withOpacity(0.1)),
                    itemBuilder: (_, position) {
                      return InkWell(
                        onTap: (){
                          //Navigator.of(context).pushNamed(ListAssociateAccountPageView.pageName);
                        },
                        child: Container(
                            decoration:BoxDecoration(
                              color: const Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    listEvenements[position].icon,
                                    const SizedBox(width: 8,),
                                    Text(listEvenements[position].title,
                                      style: const TextStyle(fontSize: 15, color: successTextColor, fontWeight: FontWeight.w400, fontFamily: 'Inter'),),
                                  ],
                                ),
                                Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    value: listEvenements[position].isChecked,
                                    onChanged: (bool isOn) {
                                      if (kDebugMode) {
                                        print(isOn);
                                      }
                                      setState(() {
                                        listPrivilege[position].setIsChecked = isOn;
                                        Global.shared.isInstructionView = isOn;
                                        isOn =!isOn;
                                        if (kDebugMode) {
                                          print(listEvenements[position].isChecked);
                                        }
                                      });
                                    },
                                    //activeTrackColor: Colors.yellow,
                                    activeColor: greenColor,
                                    inactiveTrackColor: Colors.grey,
                                    inactiveThumbColor: Colors.grey,
                                  ),
                                )
                              ],
                            )
                        ),
                      );
                    },
                  ),*/
                ],
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
        devKey: _scaffoldKey
    );
  }



  List<Privilege> listPrivilege = [
    Privilege("Modifier un utilisateur", Image.asset("assets/images/associate_account/edit-user-icon.png", width: 16, height: 16,), true),
    Privilege("Supprimer un utilisateur", Image.asset("assets/images/associate_account/delete-user-icon.png", width: 16, height: 16,), true),
    Privilege("Voir l'historique", Image.asset("assets/images/associate_account/show-history-icon.png", width: 16, height: 16,), true),
    Privilege("Ajouter un utilisateur", Image.asset("assets/images/associate_account/add-user-icon.png", width: 16, height: 16,), true),
    Privilege("Analyses et reports", Image.asset("assets/images/associate_account/analyses-report-icon.png", width: 16, height: 16,), false),
  ];

  List<Privilege> listEvenements = [
    Privilege("Modifier un Evènement", Image.asset("assets/images/associate_account/edit-user-icon.png", width: 16, height: 16,), true),
    Privilege("Supprimer un Evènement", Image.asset("assets/images/associate_account/delete-user-icon.png", width: 16, height: 16,), true),
    Privilege("Voir l'Evènement", Image.asset("assets/images/associate_account/show-history-icon.png", width: 16, height: 16,), true),
    Privilege("Ajouter un Evènement", Image.asset("assets/images/associate_account/add-user-icon.png", width: 16, height: 16,), true),
    Privilege("Analyses et reports", Image.asset("assets/images/associate_account/analyses-report-icon.png", width: 16, height: 16,), false),
  ];

}
