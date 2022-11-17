import 'package:eido_events_project/constants.dart';
import 'package:eido_events_project/pages/location_settings/add_location_settings.dart';
import 'package:eido_events_project/widgets/custom_widgets.dart';
import 'package:eido_events_project/widgets/location_base_settings_widget.dart';
import 'package:flutter/material.dart';

import 'add_product_page.dart';
import 'add_rubrique_program_page.dart';

class SearchProductPageView extends StatefulWidget {
  const SearchProductPageView({Key? key}) : super(key: key);
  static const String pageName = "manage_rubrique/search_product";

  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProductPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {

    return LocationBaseSettingsWidget(
      containerWidget: Center(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:180.0, left: 44.0, right: 56),
                  child: SizedBox(
                    width: 275,
                    height: 292,
                    child: Image.asset("assets/images/location_settings/phone-search.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65.0, right: 61),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: const [
                      Text("Il y a pas de produit pour le moment veuillez en créer",
                        style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, fontSize: 16),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, right: 28, top: 55.0, bottom: 61),
                  child: CustomButtonRightIcon(
                    color: kPrimaryColor,
                    text: 'Ajouter un produit',
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(AddProductPageView.pageName);
                    },
                    pHorizontal: 40.0,
                    pVertical: 10.0,
                    radius: 100.0,
                    icon: 'assets/images/rubrique/plus-rounded.png',
                  ),
                )
              ],
            )
        )
    ),
      title: "Gestion des programmes",
      iconMenuLeft: "assets/images/rubrique/arrow-rounded-left.png",
      onPressedMenuLeft: () async {
        Navigator.of(context).pop();
        //Navigator.of(context, rootNavigator: true).pushNamed(AddLocationSettingsPageView.pageName);
      },
      devKey: _scaffoldKey,
      fullBgImg: "",
      isBottomNav: false,
      isDrawerNavRight: false,
      bgHeader: "assets/images/rubrique/bg-img.png",
      heightBgHeader: 125,
    );
  }
}
