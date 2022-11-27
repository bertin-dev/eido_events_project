
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/bottom_sheet_menu.dart';
import '../models/menus.dart';
import '../pages/associate_account/detail_profils_associate_account.dart';
import '../pages/associate_account/list_associate_account_page.dart';
import '../pages/associate_account/privilege_associate_account.dart';
import '../pages/events/add_new_event_page.dart';
import '../pages/events/host_create/program_events_home_page.dart';
import '../pages/events/manage_tickets_page.dart';
import '../pages/events/renew_event_page.dart';
import '../pages/guests/guests_list_page.dart';
import '../pages/manage_event_programs/program_home_page.dart';
import '../pages/manage_rubrique/rubrique_list_page.dart';
import '../utils/screen_size.dart';


class LocationBaseSettingsWidget extends StatefulWidget {
  final Widget containerWidget;
  final String title;
  final String? iconMenu;
  final VoidCallback? onPressedMenu;
  final String? iconMenu2;
  final VoidCallback? onPressedMenu2;
  final GlobalKey<ScaffoldState> devKey;
  final String fullBgImg;
  final VoidCallback? onPressedShared;
  final String? iconMenuLeft;
  final VoidCallback? onPressedMenuLeft;
  final bool isBottomNav;
  final bool isDrawerNavRight;
  final String? bgHeader;
  final double? heightBgHeader;


    LocationBaseSettingsWidget({
     Key? key,
     required this.containerWidget,
     required this.title,
     this.iconMenu,
     this.onPressedMenu,
      required this.devKey,
      required this.fullBgImg,
      this.onPressedShared,
      this.iconMenuLeft,
      this.onPressedMenuLeft,
      required this.isBottomNav,
      required this.isDrawerNavRight,
      this.iconMenu2,
      this.onPressedMenu2,
      this.bgHeader = "assets/images/location_settings/bg-header-add-location.png",
      this.heightBgHeader = 125,
    }) : super(key: key);

  @override
  State<LocationBaseSettingsWidget> createState() => _LocationBaseSettingsWidgetState();
}

class _LocationBaseSettingsWidgetState extends State<LocationBaseSettingsWidget> {
  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          return Scaffold(
              key: widget.devKey,
              endDrawer: widget.isDrawerNavRight==true ? Drawer(
                elevation: 16.0,
                width:(wv * 100) / 3,
                backgroundColor: labelColorTextField,
                child: ListView(
                  padding: const EdgeInsets.only(left: 15.91, right: 13.91),
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child:Image.asset("assets/images/associate_account/close_square_white.png", width: 33.92, height: 33.92,),
                          ),
                          const SizedBox(height: 17.04,),
                          const Text("Chatnoir123",
                            style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                    //const SizedBox(height: 34.51,),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                          },
                          hoverColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          mouseCursor: MouseCursor.defer,
                          highlightColor: kPrimaryColor,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/edit-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Modifier",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                          },
                          hoverColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          mouseCursor: MouseCursor.defer,
                          highlightColor: kPrimaryColor,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/activity-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Activités",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: widget.onPressedShared,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/lock-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Code d'accès",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(PrivilegeAssociateAccountPageView.pageName);
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/role-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Privilèges",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    )
                  ],
                ),
              ) : null,
              // Disable opening the end drawer with a swipe gesture.
              endDrawerEnableOpenDragGesture: false,
              backgroundColor: whiteColor,
              bottomNavigationBar: widget.isBottomNav==true ? BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                //showSelectedLabels: true,
                //showUnselectedLabels: true,
                fixedColor: kPrimaryColor,
                currentIndex: 0,
                onTap: (int index){
                },
                items: HomeBottomNavigation.menus.map((Menus menus) {
                  return BottomNavigationBarItem(
                    icon: menus.inactiveIcon,
                    activeIcon: menus.icon,
                    label: menus.title
                  );
                }).toList(),

              ) : null,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      decoration: widget.fullBgImg != "" ? BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.fullBgImg),
                          fit: BoxFit.cover,
                        ),
                      ) : null,
                      child: Stack(
                        //fit: StackFit.expand,
                        children: [
                          Container(
                            height: widget.heightBgHeader,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.bgHeader!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 1,
                            right: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  if(widget.iconMenuLeft !=null)...{
                                    IconButton(
                                      onPressed: widget.onPressedMenuLeft,
                                      icon: Image.asset(widget.iconMenuLeft!,
                                        width: 30,
                                        height: 30,),
                                    )
                                  }
                                  else...{
                                    IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                  },
                                   Text(widget.title,
                                    style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: whiteColor,
                                        fontFamily: "Inter"),textAlign: TextAlign.center,),
                                  if(widget.iconMenu != null)...{
                                    IconButton(
                                      onPressed: widget.onPressedMenu,
                                      icon: Image.asset(widget.iconMenu!,
                                        width: 30,
                                        height: 30,),
                                    )
                                  },
                                  if(widget.iconMenu2 != null)...{
                                    IconButton(
                                      onPressed: widget.onPressedMenu2,
                                      icon: Image.asset(widget.iconMenu2!,
                                        width: 30,
                                        height: 30,),
                                    )
                                  }
                                ],
                              ),
                            ),
                          ),
                          widget.containerWidget
                        ],
                      ),
                    )
                  ],
                ),
              )
          );
        });
  }
}




class LocationBaseAssociateAccountWidget extends StatefulWidget {

  final Widget containerWidget;
  final String title;
  final String? iconMenu;
  final VoidCallback? onPressedMenu;
  final String? iconMenu2;
  final VoidCallback? onPressedMenu2;
  final String? iconMenu3;
  final VoidCallback? onPressedMenu3;
  final GlobalKey<ScaffoldState> devKey;
  final String fullBgImg;
  final VoidCallback? onPressedShared;
  final String? iconMenuLeft;
  final VoidCallback? onPressedMenuLeft;
  final bool isBottomNav;
  final bool isDrawerNavRight;
  final String? bgHeader;
  final double? heightBgHeader;
  final String? bgBodyLeftSide;
  final double? dividerBgBodyLeftSide;
  final Color? color;


  const LocationBaseAssociateAccountWidget({
    Key? key,
    required this.containerWidget,
    required this.title,
    this.iconMenu,
    this.onPressedMenu,
    required this.devKey,
    required this.fullBgImg,
    this.onPressedShared,
    this.iconMenuLeft,
    this.onPressedMenuLeft,
    required this.isBottomNav,
    required this.isDrawerNavRight,
    this.iconMenu2,
    this.onPressedMenu2,
    this.iconMenu3,
    this.onPressedMenu3,
    this.bgHeader = "assets/images/location_settings/bg-header-add-location.png",
    this.heightBgHeader = 125,
    this.bgBodyLeftSide,
    this.dividerBgBodyLeftSide,
    this.color
   }) : super(key: key);

  @override
  State<LocationBaseAssociateAccountWidget> createState() => _LocationBaseAssociateAccountWidgetState();
}

class _LocationBaseAssociateAccountWidgetState extends State<LocationBaseAssociateAccountWidget>
with TickerProviderStateMixin{

  int _selectedIndex = 0;
  late List _currentYear = [];
  bool toggleAmountType = true;
  String currentSelectedValue = "2022";
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    _currentYear = [
      "2019",
      "2020",
      "2021",
      "2022",
      "2023",
      "2024",
      "2025"
    ];
    tabController = TabController(vsync: this, initialIndex:1, length: 12,);
    /*for (var i = 1; i <= DateTime.monthsPerYear; i++) {
                                      DropdownMenuItem(
                                        value: i,
                                        child: Text(
                                          DateFormat.MMMM(Get.locale.toLanguageTag()).format(
                                            DateFormat('M').parse(i.toString()),
                                          ),
                                        ),
                                      )
                                    },*/

  }


  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          final media = MediaQuery.of(context).size;
          return Scaffold(
              resizeToAvoidBottomInset: false,
              key: widget.devKey,
              endDrawer: widget.isDrawerNavRight==true ? Drawer(
                elevation: 16.0,
                width:(wv * 100) / 3,
                backgroundColor: labelColorTextField,
                child: ListView(
                  padding: const EdgeInsets.only(left: 15.91, right: 13.91),
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child:Image.asset("assets/images/associate_account/close_square_white.png", width: 33.92, height: 33.92,),
                          ),
                          const SizedBox(height: 17.04,),
                          const Text("Chatnoir123",
                            style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                    //const SizedBox(height: 34.51,),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                          },
                          hoverColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          mouseCursor: MouseCursor.defer,
                          highlightColor: kPrimaryColor,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/edit-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Modifier",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                          },
                          hoverColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          mouseCursor: MouseCursor.defer,
                          highlightColor: kPrimaryColor,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/activity-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Activités",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: widget.onPressedShared,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/lock-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Code d'accès",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(PrivilegeAssociateAccountPageView.pageName);
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/role-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Privilèges",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    )
                  ],
                ),
              ) : null,
              // Disable opening the end drawer with a swipe gesture.
              endDrawerEnableOpenDragGesture: false,
              backgroundColor: widget.color ?? whiteColor,
              bottomNavigationBar: widget.isBottomNav==true ? BottomNavigationBar(

                /*selectedFontSize: 10,
                selectedItemColor: kPrimaryColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,*/
                fixedColor: kPrimaryColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: (int index){
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: HomeBottomNavigation.menus.map((Menus menus) {
                  return BottomNavigationBarItem(
                      icon: menus.inactiveIcon,
                      activeIcon: menus.icon,
                      label: menus.title
                  );
                }).toList(),

              ) : null,
              body: getBody(wv, hv, media),
          );
        });
  }

  Widget getBody(double width, double height, Size media) {
    switch(_selectedIndex){
      case 0:
        return homePage(width, height);
      case 1:
        return events(width, height);
      case 2:
        return profil(media);
      default:
        return Container();
    }

  }

  Widget homePage(double wv, double hv){
    return Stack(
      children: [
        Container(
          decoration: widget.fullBgImg != "" ? BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.fullBgImg),
              fit: BoxFit.cover,
            ),
          ) : null,
          child: Stack(
            //fit: StackFit.expand,
            children: [
              Container(
                height: widget.heightBgHeader,
                decoration: BoxDecoration(
                  image: widget.bgHeader != "" ? DecorationImage(
                    image: AssetImage(widget.bgHeader!),
                    fit: BoxFit.cover,
                  ) : null,
                ),
              ),

              if(widget.bgBodyLeftSide != null && widget.dividerBgBodyLeftSide != null)...{
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.bgBodyLeftSide!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: (wv*100)/widget.dividerBgBodyLeftSide!,
                  height: (hv*1000),
                ),
              },
              Positioned(
                top: 33,
                left: 1,
                right: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      if(widget.iconMenuLeft !=null)...{
                        IconButton(
                          onPressed: widget.onPressedMenuLeft,
                          icon: Image.asset(widget.iconMenuLeft!,
                            width: 30,
                            height: 30,),
                        )
                      }
                      else...{
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      },

                      const SizedBox(width: 11,),
                      //title of page
                      Expanded(
                        child: Text(widget.title,
                          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: whiteColor, fontFamily: "Inter"),textAlign: TextAlign.left,),),

                      if(widget.iconMenu != null)...{
                        IconButton(
                          onPressed: widget.onPressedMenu,
                          icon: Image.asset(widget.iconMenu!,
                            width: 30,
                            height: 30,),
                        )
                      },

                      if(widget.iconMenu2 != null)...{
                        IconButton(
                          onPressed: widget.onPressedMenu2,
                          icon: Image.asset(widget.iconMenu2!,
                            width: 30,
                            height: 30,),
                        )
                      },

                      if(widget.iconMenu3 != null)...{
                        IconButton(
                          onPressed: widget.onPressedMenu3,
                          icon: Image.asset(widget.iconMenu3!,
                            width: 30,
                            height: 30,),
                        )
                      }

                    ],
                  ),
                ),
              ),
              widget.containerWidget
            ],
          ),
        ),
      ],
    );
  }

  Widget events(double wv, double hv) {

    return SingleChildScrollView(
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: widget.heightBgHeader,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.bgHeader!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 33,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                        IconButton(
                          icon: Image.asset("assets/images/manage_event_programs/close-icon.png",
                            width: 30,
                            height: 30,),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      const SizedBox(width: 11,),
                      //title of page
                      const Expanded(
                        child: Text("Gestion des évènements",
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: whiteColor, fontFamily: "Inter"),textAlign: TextAlign.left,),),

                        IconButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed(AddNewEventPageView.pageName);
                          },
                          icon: Image.asset("assets/images/manage_event_programs/add-icon.png",
                            width: 30,
                            height: 30,),
                        )

                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 116.02, left: 29, right: 29),
                    height: 47,
                    decoration:BoxDecoration(
                      border: Border.all(style: BorderStyle.solid, color: const Color(0xffC90A42), width: 0.5, strokeAlign: StrokeAlign.inside),
                      color: const Color(0xffFFE3DB),
                      borderRadius: BorderRadius.circular(100),
                    ),

                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                toggleAmountType = true;
                              });
                            },
                            child: Container(
                              decoration: (toggleAmountType) ?
                              BoxDecoration(
                                border: Border.all(style: BorderStyle.solid, color: kPrimaryColor, width: 0.5, strokeAlign: StrokeAlign.inside),
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ):null,
                              child: Row(
                                children: [
                                  const SizedBox(width: 27.77,),
                                  Image.asset("assets/images/gifts.png", width: 12.96,height: 15.98,),
                                  const SizedBox(width: 10,),
                                  const Center(
                                    child: Text("Classiques",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: "Inter", color: whiteColor),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                toggleAmountType = false;
                              });
                            },
                            child: Container(
                              decoration:(!toggleAmountType) ? BoxDecoration(
                                border: Border.all(style: BorderStyle.solid, color: kPrimaryColor, width: 0.5, strokeAlign: StrokeAlign.inside),
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ):null,
                              child: Row(
                                children: [
                                  const SizedBox(width: 34.5,),
                                  Image.asset("assets/images/popcorn.png", width: 13,height: 20.73,),
                                  const SizedBox(width: 10,),
                                  const Center(
                                    child: Text("Spéciaux",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: "Inter", color: Color(0xffFEA48B)),),
                                  ),
                                ],
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.green,
                      padding: const EdgeInsets.only(top: 11, left: 145, right: 130),
                      child:DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            dropdownColor: whiteColor,
                            focusColor: whiteColor,
                            isExpanded: true,
                            icon: Image.asset("assets/images/arrow_down-icon.png", width: 24,height: 24,),
                            items: _currentYear.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 23.0, color: labelColorTextField, fontFamily: "Impact")),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                currentSelectedValue = value!;
                              });
                              print(currentSelectedValue);
                            },
                            value: currentSelectedValue
                        ),
                      )
                  ),
                  Container(child: _tabSection(context),)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget profil(Size media){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 225,
          decoration: const BoxDecoration(
            color: kPrimaryColor
              /*image: DecorationImage(
                image: AssetImage('assets/images/home_page/bg-home3.png'),
                fit: BoxFit.cover,
              )*/
          ),
        ),
        const Positioned(
          top: 53,
          left: 1,
          right: 1,
          child: Center(
            child: Text("Mon Espace", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19, color: whiteColor, fontStyle: FontStyle.normal, fontFamily: "Inter"),),
          )
        ),
        Positioned(
          left: 1.0,
          right: 1.0,
          top: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration:BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/home_page/avatar.png"),
                  radius: 35,
                  //backgroundColor: Color(0xfff1f3f5),
                ),
              ),
              Column(
                children:  const [
                  Text("Alvares Jess",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23, color: whiteColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                  SizedBox(height: 5,),
                  Text("alvares@gmail.com",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: whiteColor, fontFamily: "Inter", fontStyle: FontStyle.normal),),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: media.longestSide <= 775
              ? screenAwareSize(245, context)
              : screenAwareSize(323, context),
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ListView.separated(
            itemCount: itemsMenuProfil.length,
            padding: EdgeInsets.zero,
            itemBuilder: (_, position) {
              return InkWell(
                  onTap: (){
                    //gestion des billets
                    if(position==1){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(ManageTicketsPageView.pageName);
                    }

                    //planing de l'évenement
                    if(position==2){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(ProgramPageView.pageName);
                    }

                    print("position=$position");

                    //liste des rubriques
                    if(position==4){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(RubriqueListPageView.pageName);
                    }


                    //liste des invités
                    if(position==5){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(GuestsListPageView.pageName);
                    }

                    //liste des comptes associés
                    if(position==6){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(ListAssociateAccountPageView.pageName);
                    }
                  },
                  child: Container(
                      decoration:BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              itemsMenuProfil[position].icon,
                              const SizedBox(width: 10,),
                              Text(itemsMenuProfil[position].title,
                                style: TextStyle(fontSize: 16, color: itemsMenuProfil[position].color, fontWeight: FontWeight.w400, fontFamily: 'Inter', fontStyle: FontStyle.normal),),
                            ],
                          ),
                          itemsMenuProfil[position].arrowRight,
                        ],
                      )
                  )
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 2,);
          },
          ),
        ),
      ],
    );
  }

  getBottomSheetMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      //backgroundColor: Colors.transparent,
      builder: (context) {
        return InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 13, top: 25, bottom: 33),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  /*image: DecorationImage(
                    image: AssetImage("assets/images/events/bg-homepage-bottomsheet.png"),
                    fit: BoxFit.cover,
                  ),*/
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height/3,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/events/event_bottomsheet.png"),
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: ListView.separated(
                        itemCount: listBottomSheetMenu.length,
                        itemBuilder: (_, position) {
                          return InkWell(
                              onTap: (){
                                //gestion des billets
                                if(position==1){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(ManageTicketsPageView.pageName);
                                }

                                //planing de l'évenement
                                if(position==2){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(ProgramPageView.pageName);
                                }

                                print("position=$position");

                                //liste des rubriques
                                if(position==4){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(RubriqueListPageView.pageName);
                                }


                                //liste des invités
                                if(position==5){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(GuestsListPageView.pageName);
                                }

                                //liste des comptes associés
                                if(position==6){
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(ListAssociateAccountPageView.pageName);
                                }
                              },
                              child: Container(
                                  decoration:BoxDecoration(
                                    //color: Colors.green,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                                  child: Row(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          listBottomSheetMenu[position].icon,
                                          const SizedBox(width: 8,),
                                          Text(listBottomSheetMenu[position].title,
                                            style: TextStyle(fontSize: 15, color: listBottomSheetMenu[position].color, fontWeight: FontWeight.w400, fontFamily: 'Inter', fontStyle: FontStyle.normal),),
                                        ],
                                      ),
                                      listBottomSheetMenu[position].arrowRight,
                                    ],
                                  )
                              )
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                        return const Divider(height: 2,);
                      },
                      ),
                    ),
                  ],
                ),
              )
          ),
        );
      },
    );
  }

  List<BottomSheetMenu> listBottomSheetMenu = [
    BottomSheetMenu("Configuration de Salle", Image.asset("assets/images/events/config-salle-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Modèles du billet", Image.asset("assets/images/events/model-billet-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Planning de l'évènement", Image.asset("assets/images/events/planing-event-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Historique de Paiement des billets", Image.asset("assets/images/events/historique-paiement-billets-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Liste des rubriques", Image.asset("assets/images/events/list-rubrique-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Liste des invités", Image.asset("assets/images/events/list-invite-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Liste des comptes associés", Image.asset("assets/images/events/liste-compte-associe-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Visualiser le QR Code", Image.asset("assets/images/events/see-qrcode-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Details de l'évènement", Image.asset("assets/images/events/details-event-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Suivi des activités", Image.asset("assets/images/events/suivi-activite-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Reporter l'évènement", Image.asset("assets/images/events/reporter-event-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
    BottomSheetMenu("Supprimer l'évènement", Image.asset("assets/images/events/supprimer-event-icon.png", width: 36, height: 36,), const Icon(Icons.arrow_forward_outlined, size: 16,), successTextColor),
  ];

  List<BottomSheetMenu> itemsMenuProfil = [
    BottomSheetMenu("Mes Invitations", Image.asset("assets/images/profil/invitation.png", width: 45, height: 45,), const Icon(Icons.arrow_forward_ios, size: 20, color: kPrimaryColor,), blackColor),
    BottomSheetMenu("Historique de paiement", Image.asset("assets/images/profil/historique.png", width: 45, height: 45,), const Icon(Icons.arrow_forward_ios, size: 20, color: kPrimaryColor,), blackColor),
    BottomSheetMenu("Changer de mot de passe", Image.asset("assets/images/profil/password.png", width: 45, height: 45,), const Icon(Icons.arrow_forward_ios, size: 20, color: kPrimaryColor,), blackColor),
    BottomSheetMenu("A Propos", Image.asset("assets/images/profil/apropos.png", width: 45, height: 45,), const Icon(Icons.arrow_forward_ios, size: 20, color: kPrimaryColor,), blackColor),
    BottomSheetMenu("Emplacements (56)", Image.asset("assets/images/profil/emplacement.png", width: 45, height: 45,), const Icon(Icons.arrow_forward_ios, size: 20, color: kPrimaryColor,), blackColor),
    BottomSheetMenu("Abonnements (22)", Image.asset("assets/images/profil/abonnement.png", width: 45, height: 45,), const Icon(Icons.arrow_forward_ios, size: 20, color: kPrimaryColor,), blackColor),
    BottomSheetMenu("Se déconnecter", Image.asset("assets/images/profil/deconnecter.png", width: 45, height: 45,), const Icon(Icons.arrow_forward_ios, size: 20, color: kPrimaryColor,), blackColor)
  ];

 Widget _tabSection(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                  color: const Color(0xff2D68E6),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                controller: tabController,
                padding: EdgeInsets.zero,
                labelColor: Colors.white,
                indicatorPadding: const EdgeInsets.all(5),
                unselectedLabelColor: const Color(0xff828282),
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                labelStyle: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500, fontFamily: "Inter",),
                unselectedLabelStyle: const TextStyle(fontSize: 12, color: Color(0xff828282), fontWeight: FontWeight.w500, fontFamily: "Inter",),
                tabs: const [
                  Tab(
                    child: Text('JANVIER',
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                  ),
                  Tab(
                          child: Text('FEVRIER',
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ),
                        Tab(
                          child: Text('MARS',
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ),
                        Tab(
                          child: Text('AVRIL',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ),
                        Tab(
                          child: Text('MAI',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ),
                        Tab(
                          child: Text('JUIN',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ),
                        Tab(
                          child: Text('JUILLET',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ),
                        Tab(
                          child: Text('AOÛT',
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ),  Tab(
                          child: Text('SETEMBRE',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ),
                        Tab(
                          child: Text('OCTOBRE',
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ), Tab(
                          child: Text('NOVEMBRE',
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ), Tab(
                          child: Text('DECEMBRE',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        ),

                ]),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 27,
              decoration: const BoxDecoration(
                //color: Colors.red,
                image: DecorationImage(
                  image: AssetImage('assets/images/rectangle-rounded.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    primary: false,
                    //physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    children: [
                      InkWell(
                        onTap: (){
                          getBottomSheetMenu();
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                            decoration:BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    //spreadRadius: 0.2,
                                    //offset: const Offset(0, 8)
                                  ),
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: const Color(0xffF2F2F2),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 47,
                                          width: 2.0,
                                          color: Colors.red,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 0, top: 5.0, bottom: 5.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  children: const [
                                                    Text("Mariage d'Alice ", style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: labelColorTextField,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: "Inter"
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                const Text("Baffoussam, Entrée de la ville", style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-red.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("25 Mai 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-black.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("28 Juin 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0.0, top: 0.5,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 32.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 48.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor: whiteColor,
                                                        child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset("assets/images/home_page/ant-design_clock-circle-filled.png", width: 19, height: 19,),
                                              const SizedBox(width: 5,),
                                              const Text("JJ-5", style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: "Inter"
                                              ),
                                              ),
                                            ],
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          getBottomSheetMenu();
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                            decoration:BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    //spreadRadius: 0.2,
                                    //offset: const Offset(0, 8)
                                  ),
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: const Color(0xffF2F2F2),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 47,
                                          width: 2.0,
                                          color: iconColor,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 0, top: 5.0, bottom: 5.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  children: const [
                                                    Text("Mariage d'Alice ", style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: labelColorTextField,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: "Inter"
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                const Text("Baffoussam, Entrée de la ville", style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-red.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("25 Mai 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-black.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("28 Juin 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0.0, top: 0.5,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 32.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 48.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor: whiteColor,
                                                        child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset("assets/images/home_page/ant-design_clock-circle-filled-blue.png", width: 19, height: 19,),
                                              const SizedBox(width: 5,),
                                              const Text("JJ-5", style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Color(0xff2D68E6),
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: "Inter"
                                              ),
                                              ),
                                            ],
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          getBottomSheetMenu();
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                            decoration:BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    //spreadRadius: 0.2,
                                    //offset: const Offset(0, 8)
                                  ),
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: const Color(0xffF2F2F2),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 47,
                                          width: 2.0,
                                          color: Colors.red,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 0, top: 5.0, bottom: 5.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  children: const [
                                                    Text("Mariage d'Alice ", style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: labelColorTextField,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: "Inter"
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                const Text("Baffoussam, Entrée de la ville", style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-red.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("25 Mai 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-black.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("28 Juin 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0.0, top: 0.5,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 32.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 48.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor: whiteColor,
                                                        child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset("assets/images/home_page/ant-design_clock-circle-filled.png", width: 19, height: 19,),
                                              const SizedBox(width: 5,),
                                              const Text("JJ-5", style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: "Inter"
                                              ),
                                              ),
                                            ],
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    primary: false,
                    //physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(RenewEventPageView.pageName);
                        },
                        child: Container(
                            //margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                            decoration:BoxDecoration(
                                color: const Color(0xffFEE2EA),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    //spreadRadius: 0.2,
                                    //offset: const Offset(0, 8)
                                  ),
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: const Color(0xffF2F2F2),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 47,
                                          width: 2.0,
                                          color: Colors.red,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 0, top: 5.0, bottom: 5.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  children: const [
                                                    Text("Anniversaire de la copine...", style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: labelColorTextField,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: "Inter"
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                const Text("Douala B'ssadi, 12ième", style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-red.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("25 Mai 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-black.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("28 Juin 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0.0, top: 0.5,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 32.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 48.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor: whiteColor,
                                                        child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset("assets/images/home_page/ant-design_clock-circle-filled.png", width: 19, height: 19,),
                                              const SizedBox(width: 5,),
                                              const Text("Expiré", style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: "Inter"
                                              ),
                                              ),
                                            ],
                                          ),)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 13,),
                                  Divider(color: const Color(0xff828282).withOpacity(0.2), height: 5),
                                  const Text("Suppression dans 3 jours en cas de non renouvellement", style: TextStyle(
                                      fontSize: 11.0,
                                      color: redColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Inter",
                                      fontStyle: FontStyle.normal
                                  ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          getBottomSheetMenu();
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
                            decoration:BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    //spreadRadius: 0.2,
                                    //offset: const Offset(0, 8)
                                  ),
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: const Color(0xffF2F2F2),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 47,
                                          width: 2.0,
                                          color: Colors.red,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 0, top: 5.0, bottom: 5.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  children: const [
                                                    Text("Mariage d'Alice ", style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: labelColorTextField,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: "Inter"
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                const Text("Baffoussam, Entrée de la ville", style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-red.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("25 Mai 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-black.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("28 Juin 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0.0, top: 0.5,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 32.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 48.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor: whiteColor,
                                                        child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset("assets/images/home_page/ant-design_clock-circle-filled.png", width: 19, height: 19,),
                                              const SizedBox(width: 5,),
                                              const Text("JJ-5", style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: "Inter"
                                              ),
                                              ),
                                            ],
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    primary: false,
                    //physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    children: [
                      InkWell(
                        onTap: (){
                          getBottomSheetMenu();
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                            decoration:BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    //spreadRadius: 0.2,
                                    //offset: const Offset(0, 8)
                                  ),
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: const Color(0xffF2F2F2),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 47,
                                          width: 2.0,
                                          color: Colors.red,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 0, top: 5.0, bottom: 5.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  children: const [
                                                    Text("Mariage d'Alice ", style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: labelColorTextField,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: "Inter"
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                const Text("Baffoussam, Entrée de la ville", style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-red.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("25 Mai 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-black.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("28 Juin 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0.0, top: 0.5,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 32.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 48.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor: whiteColor,
                                                        child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset("assets/images/home_page/ant-design_clock-circle-filled.png", width: 19, height: 19,),
                                              const SizedBox(width: 5,),
                                              const Text("JJ-5", style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: "Inter"
                                              ),
                                              ),
                                            ],
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          getBottomSheetMenu();
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                            decoration:BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    //spreadRadius: 0.2,
                                    //offset: const Offset(0, 8)
                                  ),
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: const Color(0xffF2F2F2),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 47,
                                          width: 2.0,
                                          color: iconColor,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 0, top: 5.0, bottom: 5.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Wrap(
                                                  children: const [
                                                    Text("Mariage d'Alice ", style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: labelColorTextField,
                                                        fontWeight: FontWeight.w700,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: "Inter"
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                const Text("Baffoussam, Entrée de la ville", style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: "Inter"
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-red.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("25 Mai 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/home_page/rounded-icon-black.png", width: 13, height: 13,),
                                                  const SizedBox(width: 5,),
                                                  const Text("28 Juin 2022", style: TextStyle(
                                                      fontSize: 7.0,
                                                      color: successTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0.0, top: 0.5,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 32.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius:
                                                    BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                          radius: 13,
                                                          backgroundImage: NetworkImage(
                                                            'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 48.0,),
                                                  child: Material(
                                                    color: kPrimaryColor,
                                                    elevation: 4,
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor: whiteColor,
                                                        child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset("assets/images/home_page/ant-design_clock-circle-filled-blue.png", width: 19, height: 19,),
                                              const SizedBox(width: 5,),
                                              const Text("JJ-5", style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Color(0xff2D68E6),
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: "Inter"
                                              ),
                                              ),
                                            ],
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                  Text("EIDOEVENTS 4"),
                  Text("EIDOEVENTS 5"),
                  Text("EIDOEVENTS 6"),
                  Text("EIDOEVENTS 7"),
                  Text("EIDOEVENTS 8"),
                  Text("EIDOEVENTS 9"),
                  Text("EIDOEVENTS 10"),
                  Text("EIDOEVENTS 11"),
                  Text("EIDOEVENTS 12"),
                ],
              ),
            ),
          ],
        )
    );
  }
}




class MenuEditBaseAssociateAccountWidget extends StatefulWidget {

  final Widget containerWidget;
  final String title;
  final String? iconMenu;
  final VoidCallback? onPressedMenu;
  final bool? isNavBar;
  final String? profileName;
  late final GlobalKey<ScaffoldState> devKey;
  final VoidCallback? onPressedShared;

  MenuEditBaseAssociateAccountWidget({
    Key? key,
    required this.containerWidget,
    required this.title,
    this.iconMenu,
    this.onPressedMenu,
    required this.isNavBar,
    this.profileName,
    required this.devKey,
    this.onPressedShared,}) : super(key: key);

  @override
  State<MenuEditBaseAssociateAccountWidget> createState() => _MenuEditBaseAssociateAccountWidgetState();
}

class _MenuEditBaseAssociateAccountWidgetState extends State<MenuEditBaseAssociateAccountWidget> {

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          return Scaffold(
              key: widget.devKey,
              endDrawer: Drawer(
                elevation: 16.0,
                width:(wv * 100) / 3,
                backgroundColor: labelColorTextField,
                child: ListView(
                  padding: const EdgeInsets.only(left: 15.91, right: 13.91),
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child:Image.asset("assets/images/associate_account/close_square_white.png", width: 33.92, height: 33.92,),
                          ),
                          const SizedBox(height: 17.04,),
                          const Text("Chatnoir123",
                            style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                    //const SizedBox(height: 34.51,),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                          },
                          hoverColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          mouseCursor: MouseCursor.defer,
                          highlightColor: kPrimaryColor,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/edit-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Modifier",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed(DetailProfileAssociateAccountPageView.pageName);
                          },
                          hoverColor: kPrimaryColor,
                          focusColor: kPrimaryColor,
                          mouseCursor: MouseCursor.defer,
                          highlightColor: kPrimaryColor,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/activity-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Activités",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: widget.onPressedShared,
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/lock-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Code d'accès",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed(PrivilegeAssociateAccountPageView.pageName);
                          },
                          child: Column(
                            children: [
                              Image.asset("assets/images/associate_account/role-white.png", width: 44, height: 44,),
                              const SizedBox(height: 8.34,),
                              const Text("Privilèges",
                                style: TextStyle(fontSize: 14.69, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.center,),
                              const SizedBox(height: 13.44,),
                            ],
                          ),
                        ),
                        const Divider(color: whiteColor,)
                      ],
                    )
                  ],
                ),
              ),
              // Disable opening the end drawer with a swipe gesture.
              endDrawerEnableOpenDragGesture: false,
              backgroundColor: whiteColor,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: kPrimaryColor,
                currentIndex: 0,
                onTap: (int index){
                  if(index == 0){
                    print(index);
                    FocusScope.of(context).unfocus();
                  }
                  if(index == 1){
                    print(index);
                    FocusScope.of(context).unfocus();
                  }

                  if(index == 2){
                    print(index);
                    FocusScope.of(context).unfocus();
                  }
                },
                items: HomeBottomNavigation.menus.map((Menus menus) {
                  return BottomNavigationBarItem(
                      icon: menus.inactiveIcon,
                      activeIcon: menus.icon,
                      label: menus.title
                  );
                }).toList(),

              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/associate_account/bg-menu-edit.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        //fit: StackFit.expand,
                        children: [
                          Container(
                            height: 264,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/associate_account/bg-header-ass-account.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 32, left: 88, right: 91),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100),
                                    topLeft: Radius.circular(100),
                                  ),
                                  color: whiteColor,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20, left: 44, right: 41, bottom: 19),
                                      padding: const EdgeInsets.all(16),
                                      decoration:BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage("assets/images/associate_account/avatar-associate-account.png"),
                                        radius: 30,
                                        //backgroundColor: Color(0xfff1f3f5),
                                      ),
                                    ),
                                    Text(widget.profileName!,
                                      style: const TextStyle(fontSize: 24.0, color: labelColorTextField, fontWeight: FontWeight.w500, fontFamily: "Inter"), textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if(widget.isNavBar!)...{
                            Positioned(
                              top: 25,
                              left: 1,
                              right: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.58),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),

                                    Expanded(child: Text(widget.title,
                                      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: whiteColor,
                                          fontFamily: "Inter"),textAlign: TextAlign.center,),),
                                    if(widget.iconMenu != null)...{
                                      IconButton(
                                        onPressed: widget.onPressedMenu,
                                        icon: Image.asset(widget.iconMenu!,
                                          width: 30,
                                          height: 30,),
                                      )
                                    }
                                  ],
                                ),
                              ),
                            ),
                          },
                          widget.containerWidget
                        ],
                      ),
                    ),
                  ],
                ),
              )
          );
        });
  }
}


