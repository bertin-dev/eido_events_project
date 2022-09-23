import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_widgets.dart';


class SuccessPageView extends StatefulWidget {
  const SuccessPageView({Key? key}) : super(key: key);
  static const String pageName = "success";

  @override
  State<SuccessPageView> createState() => _SuccessPageViewState();
}

class _SuccessPageViewState extends State<SuccessPageView> {
  @override
  Widget build(BuildContext context) {
    final hv =MediaQuery.of(context).size.height/100;
    final wv =MediaQuery.of(context).size.width/100;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_success.png'),
              fit: BoxFit.cover,
            )
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 148.0, left: 44.0, right: 45.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/images/check_success.png'),
                ),
                const SizedBox(height: 38.0),
                const Text('Félicitations', style:TextStyle(fontSize: 35.0, color: kPrimaryColor, fontWeight: FontWeight.w700,
                fontFamily: "Inter", fontStyle: FontStyle.normal)),
                const SizedBox(height: 17),
                const Text('Votre compte a été crée avec succès', style:TextStyle(fontSize: 16.0, color: successTextColor, fontWeight: FontWeight.w400,
                fontFamily: "Inter", fontStyle: FontStyle.normal), textAlign: TextAlign.center,),
                const SizedBox(height: 57),
                Padding(
                  padding: const EdgeInsets.only(bottom: 148.0, left: 50, right: 50),
                  child: CustomButton(
                    color: kPrimaryColor,
                    text: 'Se connecter',
                    textColor: Colors.white,
                    onPressed: () async {
                      print("--------FELICITATIONS---------");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

