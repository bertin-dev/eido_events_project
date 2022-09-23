import 'package:eido_events_project/pages/success_page.dart';
import 'package:flutter/material.dart';
import 'package:eido_events_project/pages/login_page.dart';
import 'package:eido_events_project/pages/otp_checking_page.dart';
import 'package:flutter/foundation.dart';
import '../constants.dart';
import '../widgets/custom_widgets.dart';


class ResetForgetPasswordPageView extends StatefulWidget {
  static const String pageName = "reset_forget_password";
  const ResetForgetPasswordPageView({Key? key}) : super(key: key);
  @override
  _ResetForgetPasswordPageViewState createState() => _ResetForgetPasswordPageViewState();
}

class _ResetForgetPasswordPageViewState extends State<ResetForgetPasswordPageView> {

  final _forgetPasswordFormKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
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
            Padding(
                padding: const EdgeInsets.only(bottom: 21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("Mot de passe oublié", style: TextStyle(fontSize: 23.0,
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter", fontStyle: FontStyle.normal)),
                  ],
                )
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Wrap(
                spacing: 8.0,
                direction: Axis.horizontal,
                children: const [
                  Text(
                    'Entrer le nouveau mot de passe',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: labelColorTextField,
                        fontFamily: "Inter", fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Form(
                autovalidateMode: _autovalidate,
                key: _forgetPasswordFormKey,
                child: Column(
                  children: <Widget>[

                    IpasswordField(
                      hintText: 'Nouveau mot de passe',
                      keyboardType: TextInputType.text,
                      controller: _newPasswordController,
                      onSavedFunc: (value) => userPassword = value,
                      emptyValidatorText: 'Entrez votre nouveau mot de passe',
                      validator: _passwordFieldValidator,
                      color: labelColorTextField,
                      leftIcon : Image.asset("assets/images/lock-icon.png", width: 22, height: 22,),
                    ),
                    const SizedBox(height: 18),
                    IpasswordField(
                      hintText: 'Confirmer le mot de passe',
                      keyboardType: TextInputType.text,
                      controller: _confirmPasswordController,
                      onSavedFunc: (value) => userPassword = value,
                      emptyValidatorText: 'Entrez votre mot de passe de confirmation',
                      validator: _passwordFieldValidator,
                      leftIcon : Image.asset("assets/images/lock-icon.png", width: 22, height: 22,),
                      color: labelColorTextField,
                    ),
                    const SizedBox(height: 29),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: CustomButton(
                        color: kPrimaryColor,
                        text: 'Reinitialiser',
                        textColor: Colors.white,
                        onPressed: () async {
                          Navigator.of(context, rootNavigator: true)
                              .pushNamed(SuccessPageView.pageName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      );
    });
  }



  String? _passwordFieldValidator(String? value) {
    if (value!.isEmpty) {
      return "Entrez votre mot de passe";
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]{5,5}\$";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the password is valid
      return null;
    }
    // The pattern of the password didn't match the regex above.
    return 'Password must be 5 characters long';
  }

}


