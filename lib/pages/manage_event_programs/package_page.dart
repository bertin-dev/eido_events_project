import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/package_model.dart';
import '../../models/program_model.dart';
import '../../widgets/location_base_settings_widget.dart';

class PackagePageView extends StatefulWidget {
  static const String pageName = "manage_home_page/package";

  String title;
  ProgramModel programModel;

  PackagePageView({Key? key, required this.programModel, required this.title}) : super(key: key);

  @override
  State<PackagePageView> createState() => _PackagePageViewState();
}

class _PackagePageViewState extends State<PackagePageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  List<PackageModel> itemsPackageModel = [];
  late int tappedIndex;
  bool toggleAmountType = true;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    tappedIndex = 0;
    itemsPackageModel.add(PackageModel(
        titlePackage: "Starter pricing",
        description: ' ipsum dolor sit amet, consectetur adipisicing elit.'
            ' Animi consequuntur doloremque dolorum est expedita impedit iusto '
            'magni nobis quisquam quos? Dolores necessitatibus sit vero! Aliquam repellendus, totam. '
            'Excepturi, laborum, suscipit',
        amount: 75000,
        unity: "XAF"));
    itemsPackageModel.add(PackageModel(
        titlePackage: "Starter pricing",
        description: ' ipsum dolor sit amet, consectetur adipisicing elit.'
            ' Animi consequuntur doloremque dolorum est expedita impedit iusto '
            'magni nobis quisquam quos? Dolores necessitatibus sit vero! Aliquam repellendus, totam. '
            'Excepturi, laborum, suscipit',
        amount: 75000,
        unity: "XAF"));
    itemsPackageModel.add(PackageModel(
        titlePackage: "Starter pricing",
        description: ' ipsum dolor sit amet, consectetur adipisicing elit.'
            ' Animi consequuntur doloremque dolorum est expedita impedit iusto '
            'magni nobis quisquam quos? Dolores necessitatibus sit vero! Aliquam repellendus, totam. '
            'Excepturi, laborum, suscipit',
        amount: 75000,
        unity: "XAF"));
    itemsPackageModel.add(PackageModel(
        titlePackage: "Starter pricing",
        description: ' ipsum dolor sit amet, consectetur adipisicing elit.'
            ' Animi consequuntur doloremque dolorum est expedita impedit iusto '
            'magni nobis quisquam quos? Dolores necessitatibus sit vero! Aliquam repellendus, totam. '
            'Excepturi, laborum, suscipit',
        amount: 75000,
        unity: "XAF"));
    itemsPackageModel.add(PackageModel(
        titlePackage: "Starter pricing",
        description: ' ipsum dolor sit amet, consectetur adipisicing elit.'
            ' Animi consequuntur doloremque dolorum est expedita impedit iusto '
            'magni nobis quisquam quos? Dolores necessitatibus sit vero! Aliquam repellendus, totam. '
            'Excepturi, laborum, suscipit',
        amount: 75000,
        unity: "XAF"));
    itemsPackageModel.add(PackageModel(
        titlePackage: "Starter pricing",
        description: ' ipsum dolor sit amet, consectetur adipisicing elit.'
            ' Animi consequuntur doloremque dolorum est expedita impedit iusto '
            'magni nobis quisquam quos? Dolores necessitatibus sit vero! Aliquam repellendus, totam. '
            'Excepturi, laborum, suscipit',
        amount: 75000,
        unity: "XAF"));
  }


  @override
  Widget build(BuildContext context) {
    return LocationBaseAssociateAccountWidget(
        containerWidget: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemsPackageModel.length,
              itemBuilder: (context, int position){
                if(position==0){
                  return Container(
                    padding: const EdgeInsets.only(bottom: 26),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: (){
                        //Navigator.of(context).pushNamed(MenuEditAssociateAccountPageView.pageName);
                        setState(() {
                          tappedIndex = position;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(left: 31),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 146),
                                    child: Text(widget.title,
                                      style:const TextStyle(fontSize: 23, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                  ),
                                  const SizedBox(height: 20,),
                                  Container(
                                      margin: const EdgeInsets.only(left: 10, right: 10),
                                      padding: const EdgeInsets.only(left: 44, right: 16, bottom: 21, top: 22),
                                      decoration:BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black.withOpacity(0.25),
                                                blurRadius: 16,
                                                spreadRadius: 0.2,
                                                offset: const Offset(0, 8)),
                                          ]
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(itemsPackageModel[position].titlePackage,
                                                    style:const TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                                  const SizedBox(height: 6,),
                                                  RichText(
                                                    text: TextSpan(
                                                      //style: TextStyle(color: Colors.red, fontSize: 16),
                                                      children: [
                                                        const TextSpan(text: "75 000",
                                                            style:TextStyle(fontSize: 20.578, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                                        WidgetSpan(
                                                          child: Transform.translate(
                                                            offset: const Offset(0.0, -12.0),
                                                            child: const Text("XAF",
                                                              style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: (){},
                                                    child: Container(
                                                      padding: const EdgeInsets.all(6.0),
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xff2D68E6),
                                                        borderRadius: BorderRadius.circular(200),
                                                      ),
                                                      child: Image.asset("assets/images/manage_event_programs/fa6-solid_pen-to-square.png", width: 16, height: 16,),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  InkWell(
                                                    onTap: (){},
                                                    child: Container(
                                                      padding: const EdgeInsets.all(6.0),
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xffC90A42),
                                                        borderRadius: BorderRadius.circular(200),
                                                      ),
                                                      child: Image.asset("assets/images/manage_event_programs/fa6-solid_trash.png", width: 16, height: 16,),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Visibility(
                                            visible: tappedIndex==position,
                                            child: Text(itemsPackageModel[position].description!,
                                              style:const TextStyle(fontSize: 14, color: blackColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                          ),
                                        ],
                                      )

                                  )
                                ],
                              )
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: 62,
                              height: 62,
                              margin: const EdgeInsets.only(top: 100, left: 10),
                              /*decoration:BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),*/
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/images/manage_event_programs/heroicons-solid_clipboard-list.png", width: 62, height: 62,),
                              )
                          ),
                        ],
                      ),
                    ),
                  );
                }else{
                  return Container(
                    padding: const EdgeInsets.only(bottom: 26),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: (){
                        //Navigator.of(context).pushNamed(MenuEditAssociateAccountPageView.pageName);
                        setState(() {
                          tappedIndex = position;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(left: 31),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  /*RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.red, fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: 'Some text ',
                                        ),
                                        WidgetSpan(
                                          child: Transform.translate(
                                            offset: const Offset(0.0, 4.0),
                                            child: Text(
                                              'subscripts',
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: Transform.translate(
                                            offset: const Offset(0.0, -7.0),
                                            child: Text(
                                              'supscripts',
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Some text ',
                                        ),
                                      ],
                                    ),
                                  ),*/
                                  Container(
                                      margin: const EdgeInsets.only(left: 10, right: 10),
                                      padding: const EdgeInsets.only(left: 44, right: 16, bottom: 21, top: 22),
                                      decoration:BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black.withOpacity(0.25),
                                                blurRadius: 16,
                                                spreadRadius: 0.2,
                                                offset: const Offset(0, 8)),
                                          ]
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(itemsPackageModel[position].titlePackage,
                                                    style:const TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                                  const SizedBox(height: 6,),
                                                  RichText(
                                                    text: TextSpan(
                                                      //style: TextStyle(color: Colors.red, fontSize: 16),
                                                      children: [
                                                        const TextSpan(text: "75 000",
                                                            style:TextStyle(fontSize: 20.578, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                                        WidgetSpan(
                                                          child: Transform.translate(
                                                            offset: const Offset(0.0, -12.0),
                                                            child: const Text("XAF",
                                                              style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: (){},
                                                    child: Container(
                                                      padding: const EdgeInsets.all(6.0),
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xff2D68E6),
                                                        borderRadius: BorderRadius.circular(200),
                                                      ),
                                                      child: Image.asset("assets/images/manage_event_programs/fa6-solid_pen-to-square.png", width: 16, height: 16,),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  InkWell(
                                                    onTap: (){},
                                                    child: Container(
                                                      padding: const EdgeInsets.all(6.0),
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xffC90A42),
                                                        borderRadius: BorderRadius.circular(200),
                                                      ),
                                                      child: Image.asset("assets/images/manage_event_programs/fa6-solid_trash.png", width: 16, height: 16,),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Visibility(
                                            key: Key("$position"),
                                            visible: tappedIndex == position,
                                            child: Text(itemsPackageModel[position].description!,
                                              style:const TextStyle(fontSize: 14, color: blackColor, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                          ),
                                        ],
                                      )

                                  )
                                ],
                              )
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: 62,
                              height: 62,
                              margin: const EdgeInsets.only(top: 25, left: 10),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/images/manage_event_programs/heroicons-solid_clipboard-list.png", width: 62, height: 62,),
                              )
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
          ),
        ),
        title: "Packages",
        iconMenuLeft: "assets/images/manage_event_programs/close-icon.png",
        onPressedMenuLeft:() {
          Navigator.of(context).pop();
        },
        iconMenu: "assets/images/manage_event_programs/filter-icon.png",
        onPressedMenu:() {
          getBottomSheet(context);
        },
        iconMenu2: "assets/images/manage_event_programs/add-icon.png",
        onPressedMenu2:() {},
        devKey: _scaffoldKey,
        fullBgImg: "assets/images/manage_event_programs/bg-body-manage-program.png",
        isBottomNav: false,
        isDrawerNavRight: false,
        bgHeader: "assets/images/bg-header.png",
        heightBgHeader: 125,
        bgBodyLeftSide: "assets/images/manage_event_programs/bg-body-left-manage-program.png",
        dividerBgBodyLeftSide: 1.5
    );
  }


  getBottomSheet(context) {
    final hv = MediaQuery.of(context).size.height / 100;
    final wv = MediaQuery.of(context).size.width / 100;
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
        builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState){
              return SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/associate_account/bg-bottomsheet.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 7,  right: 13,  left: 13,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        Center(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0, right:10, top: 14.0, bottom: 15),
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
                        const Text(
                          'Filter',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19, fontFamily: "Inter", color: titleProgramEventManage),
                        ),
                        const SizedBox(height: 11.0,),
                        Container(height: 2, color: titleProgramEventManage,),
                        const SizedBox(height: 11.0,),
                        Container(width: (wv*100)/2, height: 2, color: titleProgramEventManage,),
                        const SizedBox(height: 39.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Type de montant",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                            const SizedBox(height: 5,),
                            Container(
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
                                        child: const Center(
                                          child: Text("Simple",
                                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: "Inter", color: whiteColor),),
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
                                        child: const Center(
                                          child: Text("Packages",
                                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: "Inter", color: Color(0xffFEA48B)),),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            const SizedBox(height: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Montant du programme",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),

                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/images/manage_event_programs/arrow-rounded-left.png", width: 33, height: 33,),
                                          Image.asset("assets/images/manage_event_programs/polygon-left.png", width: (wv*100)/4,),
                                          Image.asset("assets/images/manage_event_programs/polygon-right.png", width: (wv*100)/4),
                                          Image.asset("assets/images/manage_event_programs/arrow-rounded-right.png", width: 33, height: 33,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:  [
                                          Text("0 XAF",
                                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: "Inter", color: blackColor),),
                                          SizedBox(width: (wv*100)/4 +50,),
                                          Text("12 000 XAF",
                                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: "Inter", color: blackColor),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Période",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),

                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/images/manage_event_programs/arrow-rounded-left.png", width: 33, height: 33,),
                                          Image.asset("assets/images/manage_event_programs/polygon-left.png", width: (wv*100)/4,),
                                          Image.asset("assets/images/manage_event_programs/polygon-right.png", width: (wv*100)/4),
                                          Image.asset("assets/images/manage_event_programs/arrow-rounded-right.png", width: 33, height: 33,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:  [
                                          const Text("22 Mai 2022",
                                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: "Inter", color: blackColor),),
                                          SizedBox(width: (wv*100)/4 +20,),
                                          const Text("02 Juin 2022",
                                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: "Inter", color: blackColor),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  height: 40,
                                  minWidth: 152.5,
                                  padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                                  color: titleProgramEventManage,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Revenir',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                                ),
                                const SizedBox(width: 15,),
                                MaterialButton(
                                    height: 40,
                                    minWidth: 152.5,
                                    padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                                    color: kPrimaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                                    onPressed: () {
                                      //Navigator.of(context).pushNamed(AddSettingsPageView.pageName);
                                    },
                                    child: Row(
                                      children: const [
                                        Text('Appliquer',
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                                        SizedBox(width: 12,),
                                      ],
                                    )
                                ),
                              ],
                            )

                          ],
                        ),
                        const SizedBox(height: 29),
                      ],
                    ),
                  ),
                ),
              );
            })
    );
  }

}
