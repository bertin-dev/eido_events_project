

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils/screen_size.dart';
import '../../widgets/location_base_settings_widget.dart';

class ManageProductPageView extends StatefulWidget {
  const ManageProductPageView({Key? key}) : super(key: key);
  static const String pageName = "manage_rubrique/manage_product";

  @override
  State<ManageProductPageView> createState() => _ManageProductPageViewState();
}

class _ManageProductPageViewState extends State<ManageProductPageView> {

  @override
  void initState() {
    super.initState();
  }

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
                        const Expanded(child: Text("Gestion des produits",
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
                      ? screenAwareSize(100, context)
                      : screenAwareSize(115, context),
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ListView(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 15, bottom: 16),
                              padding: const EdgeInsets.all(15.0),
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: whiteColor,
                                border: Border.all(width: 1.0, color: kPrimaryColor),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //textDirection: TextDirection.ltr,
                                    children: [
                                      const Text("                   "),
                                      Image.asset("assets/images/edit-radius-red-icon.png", width: 44.85, height: 45.67,),
                                    ],
                                  )
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
                                  borderRadius: BorderRadius.circular(18),
                                  color: whiteColor,
                                  border: Border.all(width: 1.0, color: kPrimaryColor),
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //textDirection: TextDirection.ltr,
                                      children: [
                                        const Text("                   "),
                                        Image.asset("assets/images/edit-radius-red-icon.png", width: 44.85, height: 45.67,),
                                      ],
                                    )
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
                                  borderRadius: BorderRadius.circular(18),
                                  color: whiteColor,
                                  border: Border.all(width: 1.0, color: kPrimaryColor),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/pngfuel13.png", width: 47.95, height: 90.44,),
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //textDirection: TextDirection.ltr,
                                      children: [
                                        const Text("                   "),
                                        Image.asset("assets/images/edit-radius-red-icon.png", width: 44.85, height: 45.67,),
                                      ],
                                    )
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
                                  borderRadius: BorderRadius.circular(18),
                                  color: whiteColor,
                                  border: Border.all(width: 1.0, color: kPrimaryColor),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/pngfuel14.png", width: 48.63, height: 94.59,),
                                    const Text(
                                      "Canette de Pepsi",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: Color(0xff181725)),
                                    ),
                                    const SizedBox(height: 1.05,),
                                    const Text(
                                      "600 XAF",
                                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Impact", color: titleProgramEventManage),
                                    ),
                                    const SizedBox(height: 7.84,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //textDirection: TextDirection.ltr,
                                      children: [
                                        const Text("                   "),
                                        Image.asset("assets/images/edit-radius-red-icon.png", width: 44.85, height: 45.67,),
                                      ],
                                    )
                                  ],
                                )
                            ),
                          )
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
