
import 'package:eido_events_project/pages/manage_rubrique/search_product_page.dart';
import 'package:eido_events_project/pages/manage_rubrique/search_rubrique_programpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils/screen_size.dart';


class RubriqueListPageView extends StatefulWidget {
  static const String pageName = "manage/rubrique_list_page";
  const RubriqueListPageView({Key? key}) : super(key: key);

  @override
  State<RubriqueListPageView> createState() => _RubriqueListPageViewState();
}

class _RubriqueListPageViewState extends State<RubriqueListPageView> {
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
                        const Expanded(child: Text("Rubrique",
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: whiteColor,
                              fontFamily: "Inter"),textAlign: TextAlign.left,),),

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
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 56.77, right: 48),
                          child: Image.asset("assets/images/rubrique/img-rubrique.png")
                      ),
                      const SizedBox(height: 37.93,),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 60),
                        child: Text("Vos rubriques",
                          style:TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                      ),
                      const SizedBox(height: 15,),
                      ListView(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 168),
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(SearchRubriqueProgramPageView.pageName);
                            },
                            child: Card(
                              elevation: 3,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                child: ListTile(
                                  leading: Image.asset("assets/images/rubrique/heroicons-solid_clipboard-list.png", width: 50, height: 50,),
                                  title: const Text("Programme (7)",
                                    style:TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                  trailing: const Icon(Icons.arrow_forward_ios, size: 16,),
                                ),
                              )
                            ),
                          ),
                          const SizedBox(height: 15,),
                          InkWell(
                            onTap: (){
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(SearchProductPageView.pageName);
                            },
                            child: Card(
                                elevation: 3,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                  child: ListTile(
                                    leading: Image.asset("assets/images/rubrique/trash-red-icon.png", width: 50, height: 50,),
                                    title: const Text("Produits (25)",
                                      style:TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                    trailing: const Icon(Icons.arrow_forward_ios, size: 16,),
                                  ),
                                )
                            ),
                          ),
                          const SizedBox(height: 15,),
                          InkWell(
                            onTap: (){

                            },
                            child: Card(
                                elevation: 3,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                  child: ListTile(
                                    leading: Image.asset("assets/images/rubrique/location-red-icon.png", width: 50, height: 50,),
                                    title: const Text("Localisation",
                                      style:TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                    trailing: const Icon(Icons.arrow_forward_ios, size: 16,),
                                  ),
                                )
                            ),
                          ),
                        ],
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
