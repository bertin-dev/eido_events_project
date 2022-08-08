import 'package:eido_events_project/pages/login_page.dart';
import 'package:eido_events_project/pages/otp_checking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../constants.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/custom_widgets.dart';

void main(){
  runApp(const RegisterPageView());
}


class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key? key}) : super(key: key);
  static const String pageName = "register";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const RegisterPage(),
    );
  }
}


class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _registerFormKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _townController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                        Text("S'enregistrer", style: TextStyle(fontSize: 23.0,
                            color: textColor,
                            fontWeight: FontWeight.w700)),
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.only(top: 23.0, left: 29.0, right: 29.0),
                  child: Form(
                    autovalidateMode: _autovalidate,
                    key: _registerFormKey,
                    child: Column(
                      children: <Widget>[

                        ItextField(
                          hintText: 'Nom',
                          controller: _lastNameController,
                          emptyValidatorText: 'Entrez un nom',
                          keyboardType: TextInputType.name,
                          validator: (str) => str!.isEmpty ? 'Veuillez insérer le nom' : null,
                          icon: Icons.person,
                          labelColor: labelColorTextField,
                        ),

                        SizedBox(height: hv * 4),//4

                        ItextField(
                          hintText: 'Prénom',
                          controller: _firstNameController,
                          emptyValidatorText: 'Entrez un prénom',
                          keyboardType: TextInputType.name,
                          validator: (str) => str!.isEmpty ? 'Veuillez insérer le prénom' : null,
                          icon: Icons.person,
                          labelColor: labelColorTextField,
                        ),

                        SizedBox(height: hv * 4),//4


                        ItextField(
                          hintText: 'Email',
                          controller: _emailController,
                          emptyValidatorText: 'Entrez un email',
                          keyboardType: TextInputType.emailAddress,
                          validator: _phoneFieldValidator,
                          icon: Icons.email,
                          labelColor: labelColorTextField,
                        ),

                        SizedBox(height: hv * 4),//4

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

                        ItextField(
                          hintText: 'Ville de résidence',
                          controller: _townController,
                          emptyValidatorText: 'Entrez une ville',
                          keyboardType: TextInputType.text,
                          validator: (str) => str!.isEmpty ? 'Veuillez insérer la ville' : null,
                          icon: Icons.location_on,
                          labelColor: labelColorTextField,
                        ),

                        SizedBox(height: hv * 4),//4

                        IpasswordField(
                          hintText: 'Mot de passe',
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          onSavedFunc: (value) => userPassword = value,
                          emptyValidatorText: 'Entrez votre mot de passe',
                          validator: _passwordFieldValidator,
                          color: labelColorTextField,
                        ),

                        SizedBox(height: hv * 4),//4

                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25.0, left: 10.0, right: 10.0),
                              child: CustomButton(
                                color: kPrimaryColor,
                                text: 'Créer mon compte',
                                textColor: Colors.white,
                                onPressed: () async {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(OtpCheckingPage.pageName);
                                  //authentication(context);
                                },
                              ),
                            ),

                            Wrap(
                              spacing: 3.0,
                              direction: Axis.horizontal,
                              children: [
                                const Text(
                                  'En créant votre compte, vous acceptez avoir lu les ',
                                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Color(0xff1D1E24)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //Navigator.of(context, rootNavigator: true).pushNamed(LoginPage.pageName);
                                  },
                                  child: const Text(
                                    'Termes d\'utilisation',
                                    style: TextStyle(fontSize: 13.0, color: kPrimaryColor),
                                  ),
                                ),
                                const Text(
                                  '&',
                                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Color(0xff1D1E24)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true).pushNamed(LoginPage.pageName);
                                  },
                                  child: const Text(
                                    'Politique de confidentialité',
                                    style: TextStyle(fontSize: 13.0, color: kPrimaryColor),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: hv * 4),

                            Wrap(
                              spacing: 3.0,
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Vous avez un compte?',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed(LoginPage.pageName);
                                    },
                                    child: const Text(
                                      'Se connecter',
                                      style: TextStyle(fontSize: 16.0, color: kPrimaryColor),
                                    ),
                                  ),
                              ],
                            ),

                            SizedBox(height: hv * 5),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: const BottomWidget())
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

