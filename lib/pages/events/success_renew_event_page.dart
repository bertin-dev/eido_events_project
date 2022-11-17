import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_widgets.dart';


class SuccessRenewEventsPageView extends StatefulWidget {

  const SuccessRenewEventsPageView({Key? key}) : super(key: key);
  static const String pageName = "manage_event_programs/success_renew_events_page";

  @override
  State<SuccessRenewEventsPageView> createState() => _SuccessPageViewState();
}

class _SuccessPageViewState extends State<SuccessRenewEventsPageView> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation){
        final hv =MediaQuery.of(context).size.height/100;
        final wv =MediaQuery.of(context).size.width/100;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              height: hv*100,
              width: wv*100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/events/bg-renew-success.png'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Align(
                alignment: Alignment.center,
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
                    const Padding(padding: EdgeInsets.only(left: 27, right: 33),
                    child: Text("L'évènement a été bien renouvellé",
                      style:TextStyle(fontSize: 30.0, color: kPrimaryColor, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.center,),),
                    const Text("Que voulez-vous faire ensuite ?",
                      style:TextStyle(fontSize: 13.0, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.center,),
                    const SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          height: 40,
                          minWidth: 117,
                          padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                          color: labelColorTextField,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Annuler',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                        ),
                        const SizedBox(width: 15,),
                        MaterialButton(
                          height: 40,
                          minWidth: 117,
                          padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                          onPressed: () {
                            print("configurer");
                          },
                          child: Row(
                            children: [
                              const Text('Configurer',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                              const SizedBox(width: 12,),
                              Image.asset("assets/images/location_settings/setting.png", width: 16, height: 16,),
                            ],
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 33,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

