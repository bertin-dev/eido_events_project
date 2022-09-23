import 'package:eido_events_project/pages/manage_event_programs/package_page.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/program_model.dart';
import '../../widgets/location_base_settings_widget.dart';


class SelectedItemPageView extends StatefulWidget {
  static const String pageName = "manage_home_page/selected_items";
  List<ProgramModel> listProgramModel;

  SelectedItemPageView({Key? key, required this.listProgramModel}) : super(key: key);

  @override
  State<SelectedItemPageView> createState() => _SelectedItemPageViewState();
}

class _SelectedItemPageViewState extends State<SelectedItemPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late int counter = 0;
  String checkedIcon = "assets/images/manage_event_programs/check-black.png";
  String checkedIconSelected = "assets/images/manage_event_programs/check-green.png";

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();

    counter = 0;
    for(var dev in widget.listProgramModel){
      if(dev.isChecked!){
        counter++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LocationBaseAssociateAccountWidget(
        containerWidget: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.listProgramModel.length,
                itemBuilder: (context, int position){
                  return Container(
                    padding: const EdgeInsets.only(bottom: 26),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: (){
                        setState(() {

                          if(widget.listProgramModel[position].isChecked!){
                            counter--;
                            if(counter<0){
                              counter = 0;
                            }
                          }else{
                            counter++;
                            if(counter<0){
                              counter = 0;
                            }
                          }

                          widget.listProgramModel[position].isChecked = !widget.listProgramModel[position].isChecked!;
                        });
                      },
                      child: Stack(
                        children: [
                          /*Padding(
                            padding: const EdgeInsets.only(right: 146),
                            child: Text("BONJOUR",
                              style:const TextStyle(fontSize: 23, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Inter",), textAlign: TextAlign.left,),
                          ),
                          const SizedBox(height: 20,),*/
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if(widget.listProgramModel[position].isChecked!)...{
                                          Image.asset(checkedIconSelected, width: 20, height: 20,)
                                        }else...{
                                          Image.asset(checkedIcon, width: 20, height: 20,)
                                        }

                                      ],
                                    ),
                                    Text(widget.listProgramModel[position].title,
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
                                              Text(widget.listProgramModel[position].location,
                                                  style:const TextStyle(fontSize: 10, color: blackColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                            ],
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              Image.asset("assets/images/manage_event_programs/calendar-icon-red.png", width: 14, height: 14,),
                                              const SizedBox(width: 5,),
                                              Text(widget.listProgramModel[position].startDate,
                                                  style:const TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w500, fontFamily: "Inter")),
                                              const SizedBox(height: 7,),
                                              if(widget.listProgramModel[position].endDate != null)...{
                                                Text(widget.listProgramModel[position].endDate!,
                                                    style:const TextStyle(fontSize: 10, color: titleProgramEventManage, fontWeight: FontWeight.w500, fontFamily: "Inter")),
                                              }
                                            ],
                                          ),
                                          const SizedBox(height: 11,),
                                          const Divider(color: kPrimaryColor, height: 1, thickness: 1,)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 9,),
                                    if(!widget.listProgramModel[position].isPackage!)...{
                                      Row(
                                        verticalDirection: VerticalDirection.up,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              //style: TextStyle(color: Colors.red, fontSize: 16),
                                              children: [
                                                TextSpan(text: "${widget.listProgramModel[position].amount}",
                                                    style:const TextStyle(fontSize: 20.578, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                                WidgetSpan(
                                                  child: Transform.translate(
                                                    offset: const Offset(0.0, -12.0),
                                                    child: Text(widget.listProgramModel[position].unity!,
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
                                                "title": widget.listProgramModel[position].title,
                                                "programModel": widget.listProgramModel.first
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
                              margin: const EdgeInsets.only(top: 57, left: 10),
                              /*decoration:BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),*/
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(widget.listProgramModel[position].img!, width: 60, height: 60,),
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
        title: counter<2 ? "$counter selectionné": "$counter selectionné(s)",
        iconMenuLeft: "assets/images/manage_event_programs/close-icon.png",
        onPressedMenuLeft:() {
          Navigator.of(context).pop();
        },
        iconMenu: "assets/images/manage_event_programs/trash-icon-red.png",
        onPressedMenu:() {},
        /*iconMenu2: "assets/images/manage_event_programs/add-icon.png",
        onPressedMenu2:() {},*/
        devKey: _scaffoldKey,
        fullBgImg: "assets/images/manage_event_programs/bg-body-manage-program.png",
        isBottomNav: false,
        isDrawerNavRight: false,
        bgHeader: "assets/images/bg-header.png",
        heightBgHeader: 125,
        bgBodyLeftSide: "assets/images/manage_event_programs/bg-body-left-manage-program.png",
        dividerBgBodyLeftSide: 3/2
    );
  }
}
