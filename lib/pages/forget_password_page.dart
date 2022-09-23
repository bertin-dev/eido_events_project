import 'package:flutter/material.dart';
import 'package:eido_events_project/pages/login_page.dart';
import 'package:eido_events_project/pages/otp_checking_page.dart';
import 'package:flutter/foundation.dart';
import '../constants.dart';
import '../widgets/custom_widgets.dart';

class ForgetPasswordPageView extends StatefulWidget {
  static const String pageName = "forget_password";
  const ForgetPasswordPageView({Key? key}) : super(key: key);
  @override
  _ForgetPasswordPageViewState createState() => _ForgetPasswordPageViewState();
}

class _ForgetPasswordPageViewState extends State<ForgetPasswordPageView> {

  final _forgetPasswordFormKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _phoneController = TextEditingController();
  String? userPassword;
  AutovalidateMode? _autovalidate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final hv = MediaQuery
          .of(context)
          .size
          .height / 100;
      final wv = MediaQuery
          .of(context)
          .size
          .width / 100;

      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        key: scaffoldKey,
        body: ListView(
          padding: const EdgeInsets.only(top: 82.0, left: 29.0, right: 29.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text("Mot de passe oublié", style: TextStyle(fontSize: 23.0,
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter", fontStyle: FontStyle.normal)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21, bottom: 40),
              child: Wrap(
                spacing: 8.0,
                direction: Axis.horizontal,
                children: const [
                  Text(
                    'Pour récuperer votre mot de passe, entrez votre nom d\'utilisateur, nous vous enverrons un code'
                        'par SMS que vous confirmerez',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: labelColorTextField,
                        fontFamily: "Inter", fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),
            Form(
              autovalidateMode: _autovalidate,
              key: _forgetPasswordFormKey,
              child: Column(
                children: <Widget>[
                  ItextField(
                    hintText: 'Numéro de téléphone',
                    controller: _phoneController,
                    emptyValidatorText: 'Entrez un numéro',
                    keyboardType: TextInputType.number,
                    validator: _phoneFieldValidator,
                    imgLeftIcon: Image.asset("assets/images/call-icon.png", width: 22, height: 22,),
                    labelColor: labelColorTextField,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 123.0),
                        child: CustomButton(
                          color: kPrimaryColor,
                          text: 'Envoyer',
                          textColor: Colors.white,
                          onPressed: () async {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(OtpCheckingPage.pageName, arguments: {
                                  "isForgotPassword": true
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      );
    });
  }




  //Fonction de validation du numéro de téléphone

  String? _phoneFieldValidator(String? value) {
    if (value!.isEmpty) {
      return "Entrez un numéro";
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]{9}\$";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the phone nber is valid
      return null;
    }
    // The pattern of the phone nber didn't match the regex above.
    return 'Phone number must be 9 characters long';
  }

}


