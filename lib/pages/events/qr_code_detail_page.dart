import 'package:eido_events_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/ticket_model.dart';
import '../../services/local_notifications/notification_service.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';


class QrCodeDetailPageView extends StatefulWidget {
  static const String pageName = "events/qrcode";
  TicketModel listTicketsModel;
  QrCodeDetailPageView({Key? key, required this.listTicketsModel}) : super(key: key);

  @override
  State<QrCodeDetailPageView> createState() => _QrCodeDetailPageViewState();
}

class _QrCodeDetailPageViewState extends State<QrCodeDetailPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late NotificationService notification;


  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    notification = NotificationService();
  }

  @override
  Widget build(BuildContext context) {
    return LocationBaseAssociateAccountWidget(
      containerWidget: Container(
        margin: const EdgeInsets.only(bottom: 50, left: 21, right: 20,),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 20),
              padding: const EdgeInsets.only(left: 9.0, right: 8.0, top: 24, bottom: 24),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView(
                shrinkWrap: true,
                primary: false,
                //mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(widget.listTicketsModel.matricule,
                        style:const TextStyle(fontSize: 24, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',)),
                  ),
                  const SizedBox(height: 8.0,),
                  Center(
                    child: Text(widget.listTicketsModel.phone,
                        style:const TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',)),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: QrImage(
                      data: widget.listTicketsModel.phone,
                      version: QrVersions.auto,
                      size: 215.0,
                    ),
                  ),
                  const SizedBox(height: 27.87,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 43),
                    child: Image.asset('assets/images/events/horizontal-line.png', color: titleProgramEventManage,),),
                  const SizedBox(height: 26,),
                  const Center(
                    child: Text("Programme",
                        style: TextStyle(fontSize: 13, color: kPrimaryColor, fontWeight: FontWeight.w700, fontFamily: 'Inter',)),
                  ),
                  const SizedBox(height: 26,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 43),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Nom du programme",
                                style: TextStyle(fontSize: 9, color: greyColor, fontWeight: FontWeight.w400, fontFamily: 'Inter',)),
                            Text("Prix",
                                style: TextStyle(fontSize: 9, color: greyColor, fontWeight: FontWeight.w400, fontFamily: 'Inter',)),
                          ],
                        ),
                        const SizedBox(height: 7,),
                        const Divider(color: greyColor, height: 1),
                        const SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Dote d'Aicha",
                                    style: TextStyle(fontSize: 12, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: 'Inter',)),
                                Text("23 Mai 2025, de 14h à 20h",
                                    style: TextStyle(fontSize: 9, color: Color(0xff4B6C78), fontWeight: FontWeight.w400, fontFamily: 'Inter',)),

                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                //style: TextStyle(color: Colors.red, fontSize: 16),
                                children: [
                                  const TextSpan(text: "1000",
                                      style:TextStyle(fontSize: 16, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, -12.0),
                                      child: const Text("XAF",
                                        style:TextStyle(fontSize: 6, color: kPrimaryColor, fontWeight: FontWeight.w700, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7,),
                        const Divider(color: greyColor, height: 1),
                        const SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Mariage civil",
                                    style: TextStyle(fontSize: 12, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: 'Inter',)),
                                Text("23 Mai 2025, de 14h à 20h",
                                    style: TextStyle(fontSize: 9, color: Color(0xff4B6C78), fontWeight: FontWeight.w400, fontFamily: 'Inter',)),

                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                //style: TextStyle(color: Colors.red, fontSize: 16),
                                children: [
                                  const TextSpan(text: "1000",
                                      style:TextStyle(fontSize: 16, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, -12.0),
                                      child: const Text("XAF",
                                        style:TextStyle(fontSize: 6, color: kPrimaryColor, fontWeight: FontWeight.w700, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7,),
                        const Divider(color: greyColor, height: 1),
                        const SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Mariage Réligieux",
                                    style: TextStyle(fontSize: 12, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: 'Inter',)),
                                Text("23 Mai 2025, de 14h à 20h",
                                    style: TextStyle(fontSize: 9, color: Color(0xff4B6C78), fontWeight: FontWeight.w400, fontFamily: 'Inter',)),

                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                //style: TextStyle(color: Colors.red, fontSize: 16),
                                children: [
                                  const TextSpan(text: "1000",
                                      style:TextStyle(fontSize: 16, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, -12.0),
                                      child: const Text("XAF",
                                        style:TextStyle(fontSize: 6, color: kPrimaryColor, fontWeight: FontWeight.w700, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7,),
                        const Divider(color: greyColor, height: 1),
                        const SizedBox(height: 13,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Total : ",
                                style: TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: 'Inter',)),
                            RichText(
                              text: TextSpan(
                                //style: TextStyle(color: Colors.red, fontSize: 16),
                                children: [
                                  const TextSpan(text: "30 000",
                                      style:TextStyle(fontSize: 26.94, color: kPrimaryColor, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, -12.0),
                                      child: const Text("XAF",
                                        style:TextStyle(fontSize: 7.11, color: kPrimaryColor, fontWeight: FontWeight.w700, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            CustomButton(
              color: const Color(0xff2D68E6),
              text: 'Envoyer',
              textColor: Colors.white,
              onPressed: () async {
                await notification.showLocalNotification(
                    id: 1,
                    title: "Invitation",
                    body: "Vous êtes invité à travers EidoEvents à prendre part à l'évènement 'Concert de Tenor'. Vous pouvez consulter votre billet d'invitation en cliquant sur ce lien http://eidoevents/vosbillets.com ",
                    payload: "payload"
                );
              },
            ),

          ],
        )
      ),
      title: "",
      iconMenuLeft: "assets/images/arrow-back-icon.png",
      onPressedMenuLeft:() {
        Navigator.of(context).pop();
      },
      devKey: _scaffoldKey,
      fullBgImg: "",
      isBottomNav: false,
      isDrawerNavRight: false,
      bgHeader:"",
      color: titleProgramEventManage,
    );
  }
}
