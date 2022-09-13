import 'package:eido_events_project/constants.dart';
import 'package:eido_events_project/pages/location_settings/add_location_settings.dart';
import 'package:eido_events_project/widgets/custom_widgets.dart';
import 'package:eido_events_project/widgets/location_base_settings_widget.dart';
import 'package:flutter/material.dart';

class SearchLocationSettingsPageView extends StatefulWidget {
  const SearchLocationSettingsPageView({Key? key}) : super(key: key);
  static const String pageName = "search_location_settings";

  @override
  _SearchLocationSettingsState createState() => _SearchLocationSettingsState();
}

class _SearchLocationSettingsState extends State<SearchLocationSettingsPageView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return LocationBaseSettingsWidget(
      containerWidget: Center(
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:120.0, left: 44.0, right: 56),
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
                      Text("Il y a pas d'emplacement pour le moment veuillez en créer",
                        style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, fontSize: 16),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, right: 28, top: 33.0, bottom: 61),
                  child: CustomButtonRightIcon(
                    color: kPrimaryColor,
                    text: 'Ajouter un Emplacement',
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.of(context, rootNavigator: true).pushNamed(AddLocationSettingsPageView.pageName);
                    },
                    pHorizontal: 32.0,
                    pVertical: 16.0,
                    radius: 100.0,
                    icon: 'assets/images/location_settings/plus.png',
                  ),
                )
              ],
            )
        )
    ),
      title: "Emplacements Enregistrés",
      iconMenu: "assets/images/location_settings/plus.png",
      onPressedMenu: () async {
        Navigator.of(context, rootNavigator: true).pushNamed(AddLocationSettingsPageView.pageName);
      },
    );
  }
}
