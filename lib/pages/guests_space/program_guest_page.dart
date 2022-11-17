import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants.dart';
import '../../models/menus.dart';
import '../../models/program_model.dart';
import '../../utils/screen_size.dart';
import '../../widgets/custom_widgets.dart';

class ProgramGuestPageView extends StatefulWidget {
  static const String pageName = "guests_space/program_guest";
  ProgramModel listProgramModel;
  ProgramGuestPageView({Key? key, required this.listProgramModel}) : super(key: key);

  @override
  State<ProgramGuestPageView> createState() => _ProgramGuestPageViewState();
}

class _ProgramGuestPageViewState extends State<ProgramGuestPageView> {

  int _selectedIndex = 0;
  final Completer<GoogleMapController> _controller = Completer();

  late Future<Position> position;
  double lat = 0.0;
  double long = 0.0;
  List<Marker> allMarkers = [];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(3.8654263, 11.5205789),
    zoom: 11,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  @override
  void initState() {
    super.initState();
    position = _determinePosition();

    position.then((value) => {
    lat = value.latitude,
    long = value.longitude
    }).catchError(
            (error) => print(error)
    );


    allMarkers.add(Marker(
        markerId: const MarkerId('Votre Position'),
        draggable: true,
        onTap: () {
          print('Votre Position');
        },
        position: LatLng(lat, long),
        infoWindow: const InfoWindow(
          title: 'SOA',
          snippet: 'Marché de Soa',
        ),
        icon: BitmapDescriptor.defaultMarker

    ));

  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final media = MediaQuery.of(context).size;
          return Scaffold(
            backgroundColor: whiteColor,
            resizeToAvoidBottomInset: false,
            /*bottomNavigationBar: Container(
              //padding: const EdgeInsets.symmetric(horizontal: 5),
              color: Colors.red,
              margin: const EdgeInsets.only(left:24, right: 24, bottom: 18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
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
                  items: HomeBottomNavigation.menus2.map((Menus menus) {
                    return BottomNavigationBarItem(
                        icon: menus.inactiveIcon,
                        activeIcon: menus.icon,
                        label: menus.title
                    );
                  }).toList(),

                ),
              ),
            ),*/
            body: getBody(media),
            /*floatingActionButton: FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: Text('To the lake!'),
              icon: Icon(Icons.directions_boat),
            ),*/
          );
        });
  }

  Widget getBody(Size media) {
    switch(_selectedIndex){
      case 0:
        return program(media);
      case 1:
        return map(media);
      case 2:
        return product(media);
      default:
        return Container();
    }

  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Widget program(Size media) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: media.height,
          child: Material(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage(widget.listProgramModel.img!),
                  colorFilter: const ColorFilter.srgbToLinearGamma(),
                  fit: BoxFit.cover,
                  //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop)
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: media.longestSide <= 775
              ? screenAwareSize(20, context)
              : screenAwareSize(35, context),
          left: 1,
          right: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, top: 22, right: 9),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Image.asset('assets/images/events/arrow-rounded-left-back.png', width: 32, height: 32,),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Expanded(
                        child: Center(
                          child: Text("Programme",
                            style:TextStyle(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        )),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:whiteColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Badge(
                        position: BadgePosition.topStart(top: -2, start: 10),
                        badgeContent: null,
                        animationType: BadgeAnimationType.scale,
                        badgeColor: const Color(0xff2D68E6),
                        borderSide: const BorderSide(color: whiteColor),
                        child: InkWell(
                          //iconSize: 16,
                          //padding: const EdgeInsets.all(0.0),
                          //splashRadius: 10.0,  // (Material.defaultSplashRadius = 35.0)
                          //color: whiteColor.withOpacity(0.1),
                            onTap: () {
                            },
                            child: Image.asset("assets/images/home_page/notification-icon.png", width: 16.57, height: 16.67,)
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: media.longestSide <= 775
              ? screenAwareSize(50, context)
              : screenAwareSize(65, context),
          left: 1,
          right: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 66, right: 24),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.listProgramModel.title,
                  style:const TextStyle(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),

                const SizedBox(height: 10,),
                Wrap(
                  children: [
                    Image.asset("assets/images/calendar-icon.png", width: 15, height: 17,),
                    const SizedBox(width: 10,),
                    Text(widget.listProgramModel.startDate,
                      style:const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),
                    const Text("-", style:TextStyle(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),
                    Text(widget.listProgramModel.endDate!,
                      style:const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),

                  ],
                ),
                const SizedBox(height: 18,),
                const Divider(height: 5, color: whiteColor, thickness: 1,)
              ],
            ),
          ),
        ),

        Container(
          /*decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)),
                  ),*/
          margin: EdgeInsets.only(top: media.longestSide <= 775
              ? screenAwareSize(250, context)
              : screenAwareSize(265, context),
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ListView(
            padding: const EdgeInsets.only(left: 27.5, right: 28.5, bottom: 87),
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFCD6C),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("19:00",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("|",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("20:00",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      const SizedBox(width: 19,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Entrée des mariés en place et lieu",
                              style:TextStyle(fontSize: 18, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                            SizedBox(height: 10,),
                            Divider(height: 5, color: kPrimaryColor, thickness: 1,),
                            SizedBox(height: 10,),
                            Text("Les mariés",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),

                          ],
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 16,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFCD6C),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("20:00",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("|",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("20:30",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      const SizedBox(width: 19,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Mot de Bienvenue",
                              style:TextStyle(fontSize: 18, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                            SizedBox(height: 10,),
                            Divider(height: 5, color: kPrimaryColor, thickness: 1,),
                            SizedBox(height: 10,),
                            Text("père de la marié",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),

                          ],
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 16,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFCD6C),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("20:30",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("|",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("20:35",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      const SizedBox(width: 19,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Coupure du gâteau",
                              style:TextStyle(fontSize: 18, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                            SizedBox(height: 10,),
                            Divider(height: 5, color: kPrimaryColor, thickness: 1,),
                            SizedBox(height: 10,),
                            Text("les mariés",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),

                          ],
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 16,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFCD6C),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("20:35",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("|",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("02:00",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      const SizedBox(width: 19,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Piste libre jusqu'au matin",
                              style:TextStyle(fontSize: 18, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                            SizedBox(height: 10,),
                            Divider(height: 5, color: kPrimaryColor, thickness: 1,),
                            SizedBox(height: 10,),
                            Text("Tous les invités",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),

                          ],
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 16,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFCD6C),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("02:00",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("|",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Digitalism",), textAlign: TextAlign.center,),
                            Text("06:00",
                              style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Digitalism",), textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      const SizedBox(width: 19,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Remise des cadeaux et séparation",
                              style:TextStyle(fontSize: 18, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                            SizedBox(height: 10,),
                            Divider(height: 5, color: kPrimaryColor, thickness: 1,),
                            SizedBox(height: 10,),
                            Text("Tous les invités",
                              style:TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),

                          ],
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            //padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.only(left:24, right: 24, bottom: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: BottomNavigationBar(
                fixedColor: kPrimaryColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: (int index){
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: HomeBottomNavigation.menus2.map((Menus menus) {
                  return BottomNavigationBarItem(
                      icon: menus.inactiveIcon,
                      activeIcon: menus.icon,
                      label: menus.title
                  );
                }).toList(),

              ),
            ),
          ),
        )
      ],
    );
  }

  Widget product(Size media) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: media.height,
          child: Material(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage(widget.listProgramModel.img!),
                  colorFilter: const ColorFilter.srgbToLinearGamma(),
                  fit: BoxFit.cover,
                  //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop)
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: media.longestSide <= 775
              ? screenAwareSize(20, context)
              : screenAwareSize(35, context),
          left: 1,
          right: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, top: 22, right: 9),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Image.asset('assets/images/events/arrow-rounded-left-back.png', width: 32, height: 32,),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Expanded(
                        child: Center(
                          child: Text("Produits",
                            style:TextStyle(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        )),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:whiteColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Badge(
                        position: BadgePosition.topStart(top: -2, start: 10),
                        badgeContent: null,
                        animationType: BadgeAnimationType.scale,
                        badgeColor: const Color(0xff2D68E6),
                        borderSide: const BorderSide(color: whiteColor),
                        child: InkWell(
                          //iconSize: 16,
                          //padding: const EdgeInsets.all(0.0),
                          //splashRadius: 10.0,  // (Material.defaultSplashRadius = 35.0)
                          //color: whiteColor.withOpacity(0.1),
                            onTap: () {
                            },
                            child: Image.asset("assets/images/home_page/notification-icon.png", width: 16.57, height: 16.67,)
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: media.longestSide <= 775
              ? screenAwareSize(50, context)
              : screenAwareSize(65, context),
          left: 1,
          right: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 66, right: 24),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.listProgramModel.title,
                  style:const TextStyle(fontSize: 22, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),

                const SizedBox(height: 10,),
                Wrap(
                  children: [
                    Image.asset("assets/images/calendar-icon.png", width: 15, height: 17,),
                    const SizedBox(width: 10,),
                    Text(widget.listProgramModel.startDate,
                      style:const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),
                    const Text("-", style:TextStyle(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),
                    Text(widget.listProgramModel.endDate!,
                      style:const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500, fontFamily: "Inter",), textAlign: TextAlign.left,),

                  ],
                ),
                const SizedBox(height: 18,),
                const Divider(height: 5, color: whiteColor, thickness: 1,)
              ],
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: media.longestSide <= 775
              ? screenAwareSize(250, context)
              : screenAwareSize(265, context),
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ListView(
            padding: const EdgeInsets.only(bottom: 152),
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 15, bottom: 16),
                        padding: const EdgeInsets.all(15.0),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                          border: Border.all(width: 1.0, color: const Color(0xffFFCD6C)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/oeufs-img.png", width: 119.52, height: 121.69,),
                            const Text(
                              "Panier d'oeufs",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: Color(0xff181725)),
                            ),
                            const SizedBox(height: 1.05,),
                            const Text(
                              "45 000 XAF",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Impact", color: titleProgramEventManage),
                            ),
                            const SizedBox(height: 7.84,),
                          ],
                        )
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 15, bottom: 16),
                        padding: const EdgeInsets.all(15.0),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                          border: Border.all(width: 1.0, color: const Color(0xffFFCD6C)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/pngfuel18.png", width: 119.52, height: 121.69,),
                            const Text(
                              "Pot d'oeufs",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: Color(0xff181725)),
                            ),
                            const SizedBox(height: 1.05,),
                            const Text(
                              "24 000 XAF",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Impact", color: titleProgramEventManage),
                            ),
                            const SizedBox(height: 7.84,),
                          ],
                        )
                    ),
                  )
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 15, bottom: 16),
                        padding: const EdgeInsets.all(15.0),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                          border: Border.all(width: 1.0, color: const Color(0xffFFCD6C)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/plat-okok.png", width: 120, height: 90,),
                            const Text(
                              "Plat d'okok",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: Color(0xff181725)),
                            ),
                            const SizedBox(height: 1.05,),
                            const Text(
                              "2 400 XAF",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Impact", color: titleProgramEventManage),
                            ),
                            const SizedBox(height: 7.84,),
                          ],
                        )
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 15, bottom: 16),
                        padding: const EdgeInsets.all(15.0),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                          border: Border.all(width: 1.0, color: const Color(0xffFFCD6C)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/hamburgeur.png", width: 120, height: 90,),
                            const Text(
                              "Cheese Burger",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: Color(0xff181725)),
                            ),
                            const SizedBox(height: 1.05,),
                            const Text(
                              "2 900 XAF",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Impact", color: titleProgramEventManage),
                            ),
                            const SizedBox(height: 7.84,),
                          ],
                        )
                    ),
                  )
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 15, bottom: 16),
                        padding: const EdgeInsets.all(15.0),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                          border: Border.all(width: 1.0, color: const Color(0xffFFCD6C)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/coca-cola.png", width: 120, height: 90,),
                            const Text(
                              "Canette de Coca",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: Color(0xff181725)),
                            ),
                            const SizedBox(height: 1.05,),
                            const Text(
                              "500 XAF",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Impact", color: titleProgramEventManage),
                            ),
                            const SizedBox(height: 7.84,),
                          ],
                        )
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 15, bottom: 16),
                        padding: const EdgeInsets.all(15.0),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                          border: Border.all(width: 1.0, color: const Color(0xffFFCD6C)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/guiness.png", width: 120, height: 90,),
                            const Text(
                              "Petite Guiness",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: Color(0xff181725)),
                            ),
                            const SizedBox(height: 1.05,),
                            const Text(
                              "600 XAF",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Impact", color: titleProgramEventManage),
                            ),
                            const SizedBox(height: 7.84,),
                          ],
                        )
                    ),
                  )
                ],
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            //padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.only(left:24, right: 24, bottom: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: BottomNavigationBar(
                fixedColor: kPrimaryColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: (int index){
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: HomeBottomNavigation.menus2.map((Menus menus) {
                  return BottomNavigationBarItem(
                      icon: menus.inactiveIcon,
                      activeIcon: menus.icon,
                      label: menus.title
                  );
                }).toList(),

              ),
            ),
          ),
        )
      ],
    );
  }

  Widget map(Size media) {

    return Stack(
      children: <Widget>[
        Positioned(
          top: media.longestSide <= 775
              ? screenAwareSize(48, context)
              : screenAwareSize(63, context),
          left: 1,
          right: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, top: 22, right: 9),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Image.asset('assets/images/events/arrow-rounded-left-back.png', width: 32, height: 32,),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Expanded(
                        child: Center(
                          child: Text("Cartographie",
                            style:TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.center,),
                        )),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Image.asset('assets/images/guests/notif.png', width: 32, height: 32,),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: media.longestSide <= 775
              ? screenAwareSize(127, context)
              : screenAwareSize(142, context),
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: GoogleMap(
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            trafficEnabled: true,
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: Set.from(allMarkers),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            //padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.only(left:24, right: 24, bottom: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: BottomNavigationBar(
                fixedColor: kPrimaryColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: (int index){
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: HomeBottomNavigation.menus2.map((Menus menus) {
                  return BottomNavigationBarItem(
                      icon: menus.inactiveIcon,
                      activeIcon: menus.icon,
                      label: menus.title
                  );
                }).toList(),

              ),
            ),
          ),
        )
      ],
    );

  }




  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

}
