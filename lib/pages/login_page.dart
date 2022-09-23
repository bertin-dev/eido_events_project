
import 'package:eido_events_project/pages/forget_password_page.dart';
import 'package:eido_events_project/pages/home_page.dart';
import 'package:eido_events_project/pages/register_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../providers/app.dart';
import '../widgets/custom_widgets.dart';
import 'location_settings/home_location_settings.dart';

class LoginPage extends StatefulWidget {
  static const String pageName = "login";

  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginFormKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? userPassword;
  AutovalidateMode? _autovalidate;
  late bool isChecked;

  @override
  void initState() {
    isChecked = Global.shared.isInstructionView;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final hv = MediaQuery.of(context).size.height / 100;
      final wv = MediaQuery.of(context).size.width / 100;

      bool isLoading = false;
      void _startLoading() async {
        print("is downloading=$isLoading");
        setState(() {
          isLoading = true;
        });
        print("is downloading=$isLoading");
        await Future.delayed(const Duration(seconds: 23));
        setState(() {
          isLoading = false;
        });
        print("is downloading=$isLoading");
      }

      return Scaffold(
        backgroundColor: whiteColor,
        resizeToAvoidBottomInset: true,
        key: scaffoldKey,
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 138),
                  child: Image.asset('assets/images/logo_login.png'),
                ),

                Padding(
                    padding: const EdgeInsets.only(left: 29.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text("Se connecter",
                            style: TextStyle(fontSize: 23.0, color: textColor, fontWeight: FontWeight.w700, fontFamily: "Inter")),
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.only(top: 23.0, left: 29.0, right: 29.0),
                  child: Form(
                    autovalidateMode: _autovalidate,
                    key: _loginFormKey,
                    child: Column(
                      children: <Widget>[
                        ItextField(
                          hintText: 'Numéro de téléphone',
                          controller: _phoneController,
                          emptyValidatorText: 'Entrez un numéro',
                          keyboardType: TextInputType.phone,
                          validator: _phoneFieldValidator,
                          //icon: Icons.phone_outlined,
                          labelColor: labelColorTextField,
                          imgLeftIcon: Image.asset("assets/images/call-icon.png", width: 22, height: 22,),
                        ),

                        const SizedBox(height: 20),

                        IpasswordField(
                          hintText: 'Mot de passe',
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          onSavedFunc: (value) => userPassword = value,
                          emptyValidatorText: 'Entrez votre mot de passe',
                          validator: _passwordFieldValidator,
                          color: labelColorTextField,
                          leftIcon: Image.asset("assets/images/lock-icon.png", width: 22, height: 22,),
                        ),

                        const SizedBox(height: 25),//4

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Transform.scale(
                                  alignment: Alignment.centerLeft,
                                  scale: 0.9,
                                  child: Switch(
                                    value: isChecked,
                                    onChanged: (bool isOn) {
                                      if (kDebugMode) {
                                        print(isOn);
                                      }
                                      setState(() {
                                        isChecked = isOn;
                                        Global.shared.isInstructionView = isOn;
                                        isOn =!isOn;
                                        if (kDebugMode) {
                                          print(isChecked);
                                        }
                                      });
                                    },
                                    activeColor: whiteColor,
                                    activeTrackColor: iconColor,
                                    inactiveTrackColor: Colors.grey,
                                    inactiveThumbColor: Colors.grey,
                                  ),
                                ),
                                const Text("Se rappeler",
                                  style: TextStyle(color: textColor, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400, fontSize: 14.0, fontFamily: "Inter",), textAlign: TextAlign.left,)
                              ],
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true).pushNamed(ForgetPasswordPageView.pageName);
                                },
                                child: const Text("Mot de passe oublié?",
                                  style: TextStyle(color: textColor, fontStyle: FontStyle.normal,fontWeight: FontWeight.w400, fontFamily: "Inter", fontSize: 14.0), textAlign: TextAlign.right,)),
                          ],
                        ),

                        const SizedBox(height: 3),

                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32.0),
                              child: CustomButtonWithLoading2(
                                color: kPrimaryColor,
                                text: 'Se connecter',
                                textColor: Colors.white,
                                onPressed: () async {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(HomePageView.pageName);
                                },
                              ),
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                /*Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 60.0,
                                color: Colors.black87,
                              ),
                            ),*/
                                Text(
                                  'OU',
                                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: colorGray, fontFamily: "Inter", fontStyle: FontStyle.normal), textAlign: TextAlign.center,
                                ),
                                /*Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 60.0,
                                color: Colors.black87,
                              ),
                            ),*/
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 22.0, left: 3.0, right: 2.0, bottom: 58),
                              child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: MaterialButton(
                                    padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 6),
                                    color: Colors.white,
                                    shape:  RoundedRectangleBorder(
                                      side: const BorderSide(width: 1.0, color: kPrimaryColor),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/qrcode_img.png', width: 24, height: 24, fit: BoxFit.cover),
                                      ],
                                    ),
                                    onPressed: () {
                                      if (kDebugMode) {
                                        print("call QR Code");
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  flex: 4,
                                  child: MaterialButton(
                                    padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 6.0),
                                    color: Colors.white,
                                    /*shape: const ContinuousRectangleBorder(
                                  side:
                                  BorderSide(width: 1.0, color: kPrimaryColor),
                                ),*/
                                    shape:  RoundedRectangleBorder(
                                      side: const BorderSide(width: 1.0, color: kPrimaryColor),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    onPressed: () {
                                      //TODO: Implement event associate functionality
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed(HomeLocationSettingsPageView.pageName);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/users.png',
                                          fit: BoxFit.cover,
                                          width: 24,
                                          height: 24,),
                                        const SizedBox(width: 10.0),
                                        const Text(
                                          'Evènement associé',
                                          style: TextStyle(
                                              fontSize: 16.0, color: textColor, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontFamily: "Inter"), textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Vous n\'avez pas de compte? ',
                                  style: TextStyle(fontSize: 15.0, fontFamily: "Inter", fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, color: textColor), textAlign: TextAlign.center,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed(RegisterPageView.pageName);
                                    },
                                    child: const Text(
                                      ' S\'enregistrer',
                                      style: TextStyle(fontSize: 15.0, fontFamily: "Inter", fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, color: kPrimaryColor), textAlign: TextAlign.center,
                                    ),
                                  ),)
                              ],
                            ),
                            const SizedBox(height: 38),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
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

  // Fonction de validation du mot de passe

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
