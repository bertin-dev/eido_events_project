import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_widget.dart';
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
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: wv*60,
                  child: Image.asset('assets/images/check_success.png'),
                ),
                SizedBox(height: hv * 8.0),
                const Text('Félicitations', style:TextStyle(fontSize: 35.0, color: kPrimaryColor, fontWeight: FontWeight.w700)),
                SizedBox(height: hv * 2),
                const Text('Votre compte a été crée avec succès', style:TextStyle(fontSize: 16.0, color: successTextColor, fontWeight: FontWeight.w400)),
                SizedBox(height: hv * 6),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0, left: 100.0, right: 100.0),
                      child: CustomButton(
                        color: kPrimaryColor,
                        text: 'Se connecter',
                        textColor: Colors.white,
                        onPressed: () async {
                          print("-----------------");
                          //authentication(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const BottomWidget()
          ],
        ),
      ),
    );
  }
}

