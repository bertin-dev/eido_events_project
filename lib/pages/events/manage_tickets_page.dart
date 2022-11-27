import 'package:eido_events_project/pages/events/qr_code_detail_page.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/ticket_model.dart';
import '../../widgets/location_base_settings_widget.dart';
import 'add_new_event_page.dart';

class ManageTicketsPageView extends StatefulWidget {
  static const String pageName = "events/manage_tickets";
  const ManageTicketsPageView({Key? key}) : super(key: key);

  @override
  State<ManageTicketsPageView> createState() => _ManageTicketsPageViewState();
}

class _ManageTicketsPageViewState extends State<ManageTicketsPageView> {

  late final GlobalKey<ScaffoldState> _scaffoldKey;


  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return LocationBaseAssociateAccountWidget(
      containerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 135, left: 11, right: 10, bottom: 0),
              child: Wrap(
              children: const [
                Text("Historique ",
                    style:TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',)),
                Text("de paiement des billets",
                    style:TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: 'Inter',)),
              ],
            ),
          ),
          Expanded(child: ListView.builder(
              shrinkWrap: true,
              itemCount: listTicket.length,
              padding: const EdgeInsets.only(bottom: 20),
              itemBuilder: (context, int position){
                return InkWell(
                  onTap: (){
                    Navigator.of(context)
                        .pushNamed(QrCodeDetailPageView.pageName, arguments: {
                      "list_ticket": listTicket.first
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 114,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/events/subtract.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Montant cumulé",
                                style:TextStyle(fontSize: 10, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: 'Inter',)),
                          const SizedBox(height: 4,),
                            RichText(
                              text: TextSpan(
                                //style: TextStyle(color: Colors.red, fontSize: 16),
                                children: [
                                  TextSpan(text: "${listTicket[position].amount}",
                                      style:const TextStyle(fontSize: 26.94, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, -16.0),
                                      child: Text(listTicket[position].unity.toUpperCase(),
                                        style:const TextStyle(fontSize: 7.11, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12.37,),
                        Image.asset('assets/images/events/line.png'),
                        const SizedBox(width: 42,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(listTicket[position].matricule,
                                style:const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: 'Inter',)),
                            Text("crée le : ${listTicket[position].created}",
                                style:const TextStyle(fontSize: 10, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: 'Inter',)),
                            Wrap(
                              children: [
                                const Text("par : ",
                                    style:TextStyle(fontSize: 10, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: 'Inter',)),
                                Text(listTicket[position].createdBy,
                                    style:const TextStyle(fontSize: 10, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: 'Inter',)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),)
        ],
      ),
      title: "Gestion des Billets",
      iconMenuLeft: "assets/images/manage_event_programs/close-icon.png",
      onPressedMenuLeft:() {
        Navigator.of(context).pop();
      },
      iconMenu: "assets/images/manage_event_programs/filter-icon.png",
      onPressedMenu:() {
        //getBottomSheet(context);
      },
      iconMenu2: "assets/images/manage_event_programs/add-icon.png",
      onPressedMenu2:() {
        Navigator.of(context).pushNamed(AddNewEventPageView.pageName);
      },
      devKey: _scaffoldKey,
      fullBgImg: "",
      isBottomNav: false,
      isDrawerNavRight: false,
    );
  }


  List<TicketModel> listTicket = [
    TicketModel(id: 1, amount: 30000, unity: "xaf", matricule: "EID458-54874", created: "25 Jan 2022", createdBy: "Eric Kong", phone: "+237 694 04 89 25"),
    TicketModel(id: 1, amount: 30000, unity: "xaf", matricule: "EID458-54874", created: "25 Jan 2022", createdBy: "Eric Kong", phone: "+237 697 85 47 85"),
    TicketModel(id: 1, amount: 30000, unity: "xaf", matricule: "EID458-54874", created: "25 Jan 2022", createdBy: "Eric Kong", phone: "+237 697 85 47 85"),
    TicketModel(id: 1, amount: 30000, unity: "xaf", matricule: "EID458-54874", created: "25 Jan 2022", createdBy: "Eric Kong", phone: "+237 697 85 47 85"),
    TicketModel(id: 1, amount: 30000, unity: "xaf", matricule: "EID458-54874", created: "25 Jan 2022", createdBy: "Eric Kong", phone: "+237 697 85 47 85"),
    TicketModel(id: 1, amount: 30000, unity: "xaf", matricule: "EID458-54874", created: "25 Jan 2022", createdBy: "Eric Kong", phone: "+237 697 85 47 85"),
  ];
  
}
