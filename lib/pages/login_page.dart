
import 'package:eido_events_project/pages/forget_password_page.dart';
import 'package:eido_events_project/pages/home_page.dart';
import 'package:eido_events_project/pages/register_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/custom_widgets.dart';
import 'location_settings/home_location_settings.dart';
import 'location_settings/search_location_settings.dart';



void main(){
  runApp(const LoginPageView());
}

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const LoginPage(),
    );
  }
}

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
      final hv = MediaQuery
          .of(context)
          .size
          .height / 100;
      final wv = MediaQuery
          .of(context)
          .size
          .width / 100;

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
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        key: scaffoldKey,
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                //SizedBox(height: hv*10),
                Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    SizedBox(
                      height: hv * 25,//66
                      child: SizedBox(width: wv * 25,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20),
                          child: Image.asset('assets/images/logo_login.png',
                            width: 99,
                            height: 136,),
                        ),),
                    ),
                    /*Column(
                children: <Widget>[
                  SizedBox(child: Image.asset('assets/images/logo.png'), width: wv*30,),
                ],
              ),*/
                  ],
                ),


                SizedBox(height: hv * 1),//43
                Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text("Se connecter", style: TextStyle(fontSize: 23.0,
                            color: textColor,
                            fontWeight: FontWeight.w700)),
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.only(top: 23.0, left: 29.0, right: 29.0),
                  child: Form(
                    autovalidateMode: _autovalidate,
                    key: _loginFormKey,
                    child: Column(
                      children: <Widget>[

                        // Champ de texte du numéro

                        /*     CustomTextField(
                      maxLength: 9,
                      hintText: 'Téléphone',
                      controller: _phoneController,
                      emptyValidatorText: 'Entrez un numéro',
                      keyboardType: TextInputType.phone,
                      validator: _phoneFieldValidator,
                      icon: Icons.phone_outlined,
                      labelColor: Colors.black45,
                    ),

                    // Champ de texte du mot de passe

                    CustomPasswordField(
                      hintText: 'Mot de passe',
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      onSavedFunc: (value) => userPassword = value,
                      emptyValidatorText: 'Entrez votre mot de passe',
                      validator: _passwordFieldValidator,
                      color: Colors.black45,
                    ),*/

                        ItextField(
                          hintText: 'Numéro de téléphone',
                          controller: _phoneController,
                          emptyValidatorText: 'Entrez un numéro',
                          keyboardType: TextInputType.phone,
                          validator: _phoneFieldValidator,
                          icon: Icons.phone_outlined,
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

                        SizedBox(height: hv * 2),//4

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Center(
                              child: Row(
                                children: [
                                  Switch(
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
                                    activeColor: iconColor,
                                    inactiveTrackColor: Colors.grey,
                                    inactiveThumbColor: Colors.grey,
                                  ),
                                  const Text("Se rappeler ?",
                                    style: TextStyle(color: textColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0),)
                                ],
                              ),
                            ),

                            Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(ForgetPasswordPageView.pageName);
                                  },
                                  child: const Text("Mot de passe oublié ?",
                                    style: TextStyle(
                                        color: textColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0),)),
                            ),
                          ],
                        ),

                        SizedBox(height: hv * 2),

                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25.0, left: 10.0, right: 10.0),
                              child: CustomButtonWithLoading(
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
                                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: colorGray),
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
                            SizedBox(height: hv * 2),

                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: MaterialButton(
                                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                                    color: Colors.white,
                                    shape:  RoundedRectangleBorder(
                                      side: const BorderSide(width: 1.0, color: kPrimaryColor),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/qrcode_img.png',
                                            width: 24,
                                            height: 24,
                                            fit: BoxFit.contain),
                                      ],
                                    ),
                                    onPressed: () {
                                      if (kDebugMode) {
                                        print("call QR Code");
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 4,
                                  child: MaterialButton(
                                    padding: const EdgeInsets.symmetric(vertical: 13.0),
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
                                              fontSize: 16.0, color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: hv * 2),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Vous n\'avez pas de compte? ',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed(RegisterPageView.pageName);
                                    },
                                    child: const Text(
                                      ' S\'enregistrer',
                                      style: TextStyle(fontSize: 16.0, color: kPrimaryColor),
                                    ),
                                  ),)
                              ],
                            ),

                            SizedBox(height: hv * 2),

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

class Global{
  static final shared =Global();
  bool isInstructionView = false;
}
