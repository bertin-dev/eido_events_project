import 'package:eido_events_project/pages/manage_event_programs/package_page.dart';
import 'package:eido_events_project/pages/manage_event_programs/selected_items_page.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/program_model.dart';
import '../../widgets/location_base_settings_widget.dart';
import 'add_program_page.dart';

class ProgramPageView extends StatefulWidget {
  static const String pageName = "manage_home_page/program";
  const ProgramPageView({Key? key}) : super(key: key);

  @override
  State<ProgramPageView> createState() => _ProgramPageViewState();
}

class _ProgramPageViewState extends State<ProgramPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  List<ProgramModel> itemsProgramModel = [];


  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    itemsProgramModel.add(ProgramModel(
        title: "Mariage d'Aicha et Martial",
        location: 'Au marché de Mfou',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/manage_event_programs/calendar-img.png"));

    itemsProgramModel.add(ProgramModel(
        title: "Concert de Tenor",
        location: 'Au palais des sports',
        startDate: 'Jeudi 25 jan 2020',
        endDate: null,
        amount: null,
        unity: null,
        isPackage: true,
        img: "assets/images/manage_event_programs/wedding.png"));

    itemsProgramModel.add(ProgramModel(
        title: "Mariage d'Aicha et Martial",
        location: 'Au marché de Mfou',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/manage_event_programs/wedding.png"));

    itemsProgramModel.add(ProgramModel(
        title: "Mariage d'Aicha et Martial",
        location: 'Au marché de Mfou',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/manage_event_programs/wedding.png"));

    itemsProgramModel.add(ProgramModel(
        title: "Mariage d'Aicha et Martial",
        location: 'Au marché de Mfou',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/manage_event_programs/wedding.png"));
  }

  @override
  Widget build(BuildContext context) {
    return LocationBaseAssociateAccountWidget(
      containerWidget: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemsProgramModel.length,
              itemBuilder: (context, int position){
                return Container(
                  padding: const EdgeInsets.only(bottom: 26),
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: (){
                      //Navigator.of(context).pushNamed(MenuEditAssociateAccountPageView.pageName);
                    },
                    child: Stack(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 31),
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, right: 10),
                              padding: const EdgeInsets.only(left: 55, top: 23, right: 24, bottom: 14),
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
                                   Text(itemsProgramModel[position].title,
                                    style:const TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                  const SizedBox(height: 16,),
                                  Container(
                                    color: grayLocation,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset("assets/images/manage_event_programs/location-icon-red.png", width: 14, height: 14,),
                                            const SizedBox(width: 5,),
                                            Text(itemsProgramModel[position].location,
                                                style:const TextStyle(fontSize: 10, color: blackColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                          ],
                                        ),
                                        const SizedBox(height: 4,),
                                        Row(
                                          children: [
                                            Image.asset("assets/images/manage_event_programs/calendar-icon-red.png", width: 14, height: 14,),
                                            const SizedBox(width: 5,),
                                            Text(itemsProgramModel[position].startDate,
                                                style:const TextStyle(fontSize: 10, color: Color(0xff002040), fontWeight: FontWeight.w500, fontFamily: "Inter")),
                                            const SizedBox(height: 7,),
                                            if(itemsProgramModel[position].endDate != null)...{
                                              Text(itemsProgramModel[position].endDate!,
                                                  style:const TextStyle(fontSize: 10, color: Color(0xff002040), fontWeight: FontWeight.w500, fontFamily: "Inter")),
                                            }
                                          ],
                                        ),
                                        const SizedBox(height: 11,),
                                        const Divider(color: kPrimaryColor, height: 1, thickness: 1,)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 9,),
                                  if(!itemsProgramModel[position].isPackage!)...{
                                    Row(
                                      verticalDirection: VerticalDirection.up,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            //style: TextStyle(color: Colors.red, fontSize: 16),
                                            children: [
                                              TextSpan(text: "${itemsProgramModel[position].amount}",
                                                  style:const TextStyle(fontSize: 20.578, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                              WidgetSpan(
                                                child: Transform.translate(
                                                  offset: const Offset(0.0, -12.0),
                                                  child: Text(itemsProgramModel[position].unity!,
                                                    style:const TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  }else...{
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff2D68E6),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          child: Image.asset("assets/images/manage_event_programs/akar-icons_eye-open.png", width: 16, height: 16,),
                                        ),
                                        const SizedBox(width: 7,),
                                        InkWell(
                                          onTap: (){
                                            Navigator.of(context)
                                                .pushNamed(PackagePageView.pageName, arguments: {
                                              "title": itemsProgramModel[position].title,
                                              "programModel": itemsProgramModel.first
                                            });
                                          },
                                          child: const Text("packages",
                                            style:TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter",)),
                                        ),
                                      ],
                                    )
                                  },
                                ],
                              ),
                            )
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.only(top: 43, left: 10),
                          /*decoration:BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),*/
                          child:ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                            child: Image.asset(itemsProgramModel[position].img!, width: 60, height: 60,),
                          )
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ),
      title: "Programmes",
      iconMenuLeft: "assets/images/manage_event_programs/close-icon.png",
      onPressedMenuLeft:() {
        Navigator.of(context).pop();
      },
      iconMenu: "assets/images/manage_event_programs/filter-icon.png",
      onPressedMenu:() {
        Navigator.of(context)
            .pushNamed(SelectedItemPageView.pageName, arguments: {
          "listProgramModel": itemsProgramModel
        });
      },
      iconMenu2: "assets/images/manage_event_programs/add-icon.png",
      onPressedMenu2:() {
        Navigator.of(context).pushNamed(AddProgramPageView.pageName);
      },
      devKey: _scaffoldKey,
      fullBgImg: "assets/images/manage_event_programs/bg-body-manage-program.png",
      isBottomNav: false,
      isDrawerNavRight: false,
      bgHeader: "assets/images/bg-header.png",
      heightBgHeader: 125,
      bgBodyLeftSide: "assets/images/manage_event_programs/bg-body-left-manage-program.png",
      dividerBgBodyLeftSide: 3
    );
  }
}
