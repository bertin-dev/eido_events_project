import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_widgets.dart';


class SuccessEventsPageView extends StatefulWidget {

  const SuccessEventsPageView({Key? key}) : super(key: key);
  static const String pageName = "manage_event_programs/success_events_page";

  @override
  State<SuccessEventsPageView> createState() => _SuccessPageViewState();
}

class _SuccessPageViewState extends State<SuccessEventsPageView> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation){
        final hv =MediaQuery.of(context).size.height/100;
        final wv =MediaQuery.of(context).size.width/100;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                //height: (hv*100)/2,
                margin: Orientation.landscape==orientation ? const EdgeInsets.only(left: 27, right: 27) : EdgeInsets.only(left: 27, right: 27, top: (hv*100)/5, bottom: (hv*100)/5),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  //border: Border.all(width: 1.0, color: kPrimaryColor),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 32,
                          spreadRadius: 0.2,
                          offset: const Offset(0, 8)),
                    ]
                ),
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side:const BorderSide(color: Colors.green),),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 27,),
                      SizedBox(
                        width: 209,
                        height: 173.92,
                        child: Image.asset('assets/images/check_success-green.png'),
                      ),
                      const SizedBox(height: 30.08),
                      const Text("L'invité a été effectué",
                        style:TextStyle(fontSize: 20.0, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.center,),
                      const SizedBox(height: 18),
                      Padding(
                          padding: const EdgeInsets.only(left: 21, right: 37),
                        child: CustomButton(
                          color: titleProgramEventManage,
                          text: 'Bien reçu',
                          textSize: 13,
                          textColor: Colors.white,
                          onPressed: () async {
                            Navigator.of(context).pop();
                            //Navigator.of(context).pushNamed(SuccessProgramPageView.pageName);
                          },
                        ),
                      ),
                      const SizedBox(height: 33,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

