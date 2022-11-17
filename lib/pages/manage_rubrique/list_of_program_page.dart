

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils/screen_size.dart';

class ListOfProgramPageView extends StatefulWidget {
  const ListOfProgramPageView({Key? key}) : super(key: key);
  static const String pageName = "manage_rubrique/list_rubrique_program";

  @override
  State<ListOfProgramPageView> createState() => _ListOfProgramPageViewState();
}

class _ListOfProgramPageViewState extends State<ListOfProgramPageView> {
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
                        const Expanded(child: Text("Gestion des programmes",
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
                    primary: false,
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 168),
                    children: [
                      InkWell(
                        onTap: (){
                          //Navigator.of(context, rootNavigator: true).pushNamed(SearchRubriqueProgramPageView.pageName);
                        },
                        child: Card(
                            elevation: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
                              child: ListTile(
                                leading: Image.asset("assets/images/rubrique/menu_items.png", width: 60, height: 60,),
                                title: Container(
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xffF2F2F2),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 17),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Intitulé de l'intervention",
                                        style:TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),

                                      Image.asset("assets/images/rubrique/edit_square.png", width: 24, height: 24,),
                                    ],
                                  )
                                ),
                                )
                            )
                        ),
                      ),
                      const SizedBox(height: 5,),
                      InkWell(
                        onTap: (){
                          //Navigator.of(context, rootNavigator: true).pushNamed(SearchRubriqueProgramPageView.pageName);
                        },
                        child: Card(
                            elevation: 3,
                            child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
                                child: ListTile(
                                  leading: Image.asset("assets/images/rubrique/menu_items.png", width: 60, height: 60,),
                                  title: Container(
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffF2F2F2),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 17),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Intitulé de l'intervention",
                                            style:TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),

                                          Image.asset("assets/images/rubrique/edit_square.png", width: 24, height: 24,),
                                        ],
                                      )
                                  ),
                                )
                            )
                        ),
                      ),
                      const SizedBox(height: 5,),
                      InkWell(
                        onTap: (){
                          //Navigator.of(context, rootNavigator: true).pushNamed(SearchRubriqueProgramPageView.pageName);
                        },
                        child: Card(
                            elevation: 3,
                            child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
                                child: ListTile(
                                  leading: Image.asset("assets/images/rubrique/menu_items.png", width: 60, height: 60,),
                                  title: Container(
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffF2F2F2),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 17),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Intitulé de l'intervention",
                                            style:TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),

                                          Image.asset("assets/images/rubrique/edit_square.png", width: 24, height: 24,),
                                        ],
                                      )
                                  ),
                                )
                            )
                        ),
                      ),
                      const SizedBox(height: 5,),
                      InkWell(
                        onTap: (){
                          //Navigator.of(context, rootNavigator: true).pushNamed(SearchRubriqueProgramPageView.pageName);
                        },
                        child: Card(
                            elevation: 3,
                            child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
                                child: ListTile(
                                  leading: Image.asset("assets/images/rubrique/menu_items.png", width: 60, height: 60,),
                                  title: Container(
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffF2F2F2),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 17),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Intitulé de l'intervention",
                                            style:TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),

                                          Image.asset("assets/images/rubrique/edit_square.png", width: 24, height: 24,),
                                        ],
                                      )
                                  ),
                                )
                            )
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
}
