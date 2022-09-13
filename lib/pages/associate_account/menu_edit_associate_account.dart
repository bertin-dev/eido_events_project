import 'package:eido_events_project/pages/associate_account/privilege_associate_account.dart';
import 'package:eido_events_project/pages/associate_account/profile_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../../constants.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';
import 'detail_profils_associate_account.dart';

class MenuEditAssociateAccountPageView extends StatefulWidget {
  static const String pageName = "associate_account/menu-edit";
  const MenuEditAssociateAccountPageView({Key? key}) : super(key: key);

  @override
  State<MenuEditAssociateAccountPageView> createState() => _MenuEditAssociateAccountPageViewState();
}

class _MenuEditAssociateAccountPageViewState extends State<MenuEditAssociateAccountPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return MenuEditBaseAssociateAccountWidget(
      containerWidget: Padding(
        padding: const EdgeInsets.only(top: 298, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                        },
                        //highlightColor: Colors.blue.withOpacity(0.4),
                        //splashColor: Colors.green.withOpacity(0.5),
                        child: Image.asset("assets/images/associate_account/edit-icon.png"),
                      ),
                      const SizedBox(height: 10,),
                      InkWell(
                        onTap: share,
                        child: Image.asset("assets/images/associate_account/access-icon.png"),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(ProfileActivityAssociateAccountPageView.pageName);
                        },
                        child: Image.asset("assets/images/associate_account/activity-icon.png"),
                      ),
                      const SizedBox(height: 10,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(PrivilegeAssociateAccountPageView.pageName);
                        },
                        child: Image.asset("assets/images/associate_account/role-icon.png"),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 7, right: 7, top: 46, bottom: 59),
              child: Row(
                children: [
                  CustomBtnForAlert(
                    onPressedBtn: () {
                      print("Bloquer");
                    },
                    textBtn: 'Bloquer',
                    textColorBtn: whiteColor,
                    textSizeBtn: 13.0,
                    colorBtn: kPrimaryColor,
                    radiusBtn: 100.0,
                    heightBtn: 40.0,
                    minWidthBtn: 150,
                    pTopBtn: 8.0,
                    pBottomBtn: 8.0,
                    pLeftBtn: 4.0,
                    pRightBtn: 4.0,
                    iconRightBtn: "assets/images/associate_account/danger-icon.png",
                    sPacingBtn: 12,
                    widthIconBtn: 16.0,
                    heightIconBtn: 16.0),
                  const SizedBox(width: 15,),
                  CustomBtnForAlert(
                    onPressedBtn: () {
                      print("Supprimer");
                    },
                    textBtn: 'Supprimer',
                    textColorBtn: whiteColor,
                    textSizeBtn: 13.0,
                    colorBtn: redBtn,
                    radiusBtn: 100.0,
                    heightBtn: 40.0,
                    minWidthBtn: 150,
                    pTopBtn: 8.0,
                    pBottomBtn: 8.0,
                    pLeftBtn: 4.0,
                    pRightBtn: 4.0,
                    iconRightBtn: "assets/images/home_page/delete.png",
                    sPacingBtn: 12,
                    widthIconBtn: 16.0,
                    heightIconBtn: 16.0),
                ],
              ),
            )
          ],
        ),
      ),
      title: "",
      iconMenu: "",
      isNavBar:false,
      profileName:"Chatnoir123",
      devKey: _scaffoldKey,
    );
  }

  Future<void> share() async {
    print("sdffdsf");
    await FlutterShare.share(
        title: 'EidoEvents',
        text: 'Partage des accès',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'My EidoEvents'
    );
  }

}
