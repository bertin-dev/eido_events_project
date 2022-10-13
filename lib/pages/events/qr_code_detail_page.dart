import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/ticket_model.dart';
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


  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return LocationBaseAssociateAccountWidget(
      containerWidget: Container(),
      title: "Detail QR Code",
      iconMenuLeft: "assets/images/arrow-back-icon.png",
      onPressedMenuLeft:() {
        Navigator.of(context).pop();
      },
      devKey: _scaffoldKey,
      fullBgImg: "assets/images/events/qrcode_example.png",
      isBottomNav: false,
      isDrawerNavRight: false,
      bgHeader:""
    );
  }
}
