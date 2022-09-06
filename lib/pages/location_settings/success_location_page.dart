import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_widget.dart';
import '../../widgets/custom_widgets.dart';
import 'add_settings.dart';


class SuccessLocationPageView extends StatefulWidget {
  bool saved;

   SuccessLocationPageView({Key? key, required this.saved}) : super(key: key);
  static const String pageName = "location_settings/success_location";

  @override
  State<SuccessLocationPageView> createState() => _SuccessLocationPageViewState();
}

class _SuccessLocationPageViewState extends State<SuccessLocationPageView> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation){
        final hv =MediaQuery.of(context).size.height/100;
        final wv =MediaQuery.of(context).size.width/100;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/location_settings/bg-success-location.png'),
                  fit: BoxFit.cover,
                )
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                //height: (hv*100)/2,
                margin: Orientation.landscape==orientation ? const EdgeInsets.only(left: 27, right: 27) : EdgeInsets.only(left: 27, right: 27, top: (hv*100)/5, bottom: (hv*100)/5),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: whiteColor,
                  border: Border.all(width: 1.0, color: kPrimaryColor),
                ),
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side:const BorderSide(color: Colors.green),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 12,),
                    SizedBox(
                      width: wv*40,
                      child: Image.asset('assets/images/check_success.png'),
                    ),
                    SizedBox(height: hv * 2.0),
                     Text(widget.saved ? 'l\'emplacement a été bien ajouté' : "La configuration a été bien sauvegarder",
                      style:TextStyle(fontSize: 23.0, color: Color(0xff090E18), fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.center,),
                    SizedBox(height: hv * 1),
                     Text(widget.saved ? 'Que voulez-vous faire ensuite ?': "Vous allez être redirigé vers la liste des configurations",
                      style:TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.center,),
                    SizedBox(height: hv * 2),
                    if(widget.saved)...{
                      Expanded(
                        child: Row(
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
                                  Navigator.of(context).pushNamed(AddSettingsPageView.pageName);
                                },
                                child: Row(
                                  children: [
                                    const Text('Configurer',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13), textAlign: TextAlign.center,),
                                    SizedBox(width: 12,),
                                    Image.asset("assets/images/location_settings/setting.png", width: 16, height: 16,),
                                  ],
                                )
                            ),
                          ],
                        ),),
                    }else...{
                      const CircularProgressIndicator(color: kPrimaryColor,),
                    },
                    const SizedBox(height: 50,),
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

