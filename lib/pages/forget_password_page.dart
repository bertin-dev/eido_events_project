import 'package:flutter/material.dart';
import 'package:eido_events_project/pages/login_page.dart';
import 'package:eido_events_project/pages/otp_checking_page.dart';
import 'package:flutter/foundation.dart';
import '../constants.dart';
import '../widgets/custom_widgets.dart';


void main(){
  runApp(const ForgetPasswordPageView());
}


class ForgetPasswordPageView extends StatelessWidget {
  const ForgetPasswordPageView({Key? key}) : super(key: key);
  static const String pageName = "forget_password";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const ForgetPasswordPage(),
    );
  }
}


class ForgetPasswordPage extends StatefulWidget {

  const ForgetPasswordPage({Key? key}) : super(key: key);
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

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
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                SizedBox(height: hv * 8),//43
                Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text("Mot de passe oublié", style: TextStyle(fontSize: 23.0,
                            color: textColor,
                            fontWeight: FontWeight.w700)),
                      ],
                    )),

                SizedBox(height: hv * 3),

                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 29),
                  child: Wrap(
                    spacing: 8.0,
                    direction: Axis.horizontal,
                    children: const [
                       Text(
                        'Pour récuperer votre mot de passe, entrez votre nom d\'utilisateur, nous vous enverrons un code'
                            'par SMS que vous confirmerez',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: labelColorTextField),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: hv * 5),

                Padding(
                  padding: const EdgeInsets.only(left: 29.0, right: 29.0),
                  child: Form(
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
                          icon: Icons.phone,
                          labelColor: labelColorTextField,
                        ),

                        SizedBox(height: hv * 4),//4

                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25.0, left: 10.0, right: 10.0),
                              child: CustomButton(
                                color: kPrimaryColor,
                                text: 'Envoyer',
                                textColor: Colors.white,
                                onPressed: () async {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(OtpCheckingPage.pageName);
                                },
                              ),
                            ),

                            SizedBox(height: hv * 3),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
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


