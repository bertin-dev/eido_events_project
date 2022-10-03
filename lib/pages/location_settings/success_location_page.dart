import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';
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
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 27, right: 27, top: 100, bottom: 80),
              //margin: Orientation.landscape==orientation ? const EdgeInsets.only(left: 27, right: 27, top: 100, bottom: 50) : EdgeInsets.only(left: 27, right: 27, top: (hv*100)/5, bottom: (hv*100)/5),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: whiteColor,
                border: Border.all(width: 1.0, color: kPrimaryColor),
              ),
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side:const BorderSide(color: Colors.green),),
              child: ListView(
                children: <Widget>[
                  if(Orientation.portrait==orientation)...{
                    Padding(
                      padding: const EdgeInsets.only(left: 56, right: 56, bottom: 30.08),
                      child: Image.asset('assets/images/check_success.png'),
                    ),
                  } else...{
                    Padding(
                      padding: const EdgeInsets.only(left: 216, right: 216, bottom: 10.08),
                      child: Image.asset('assets/images/check_success.png'),
                    ),
                  },
                  Padding(padding: const EdgeInsets.only(left: 43, right: 42),
                    child: Text(widget.saved ? 'L\'emplacement a été bien ajouté' : "La configuration const a été bien sauvegarder",
                      style:const TextStyle(fontSize: 23.0, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.center,),),
                  const SizedBox(height: 6),
                  Text(widget.saved ? 'Que voulez-vous faire ensuite ?': "Vous allez être redirigé vers la liste des configurations",
                    style:const TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.center,),
                  const SizedBox(height: 30),
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
                                  const SizedBox(width: 12,),
                                  Image.asset("assets/images/location_settings/setting.png", width: 16, height: 16,),
                                ],
                              )
                          ),
                        ],
                      ),),
                  }else...{
                    const CircularProgressIndicator(color: kPrimaryColor,),
                  },
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

