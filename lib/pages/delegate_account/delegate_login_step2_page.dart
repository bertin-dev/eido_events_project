import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_widgets.dart';
import 'delegate_home_page.dart';

void main(){
  runApp(const DelegateLoginStep2PageView());
}

class DelegateLoginStep2PageView extends StatelessWidget {
  const DelegateLoginStep2PageView({Key? key}) : super(key: key);
  static const String pageName = "delagate_login_step2";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:  DelegateLoginStep2Page(),
    );
  }
}

class DelegateLoginStep2Page extends StatefulWidget {


  @override
  _DelegateLoginStep2PageState createState() => _DelegateLoginStep2PageState();
}

class _DelegateLoginStep2PageState extends State<DelegateLoginStep2Page> {
  final _loginFormKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _codeBlinderController = TextEditingController();
  final TextEditingController _codeAccessController = TextEditingController();
  String? userPassword;
  AutovalidateMode? _autovalidate;
  @override
  Widget build(BuildContext context) {
    final hv =MediaQuery.of(context).size.height/100;
    final wv =MediaQuery.of(context).size.width/100;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/delegate_account/bg_delegate.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 29, right: 29, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Se connecter au", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: bottomNavSelected),),
                SizedBox(height: 2.0),
                Text("Mariage de Aîcha", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32.85, color: whiteColor),),
                 SizedBox(height: hv * 3.0),

                Container(
                  //width: double.infinity,
                  //margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.25),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    autovalidateMode: _autovalidate,
                    key: _loginFormKey,
                    child: Column(
                      children: <Widget>[

                        ItextField(
                          hintText: 'Code Blinder',
                          controller: _codeBlinderController,
                          emptyValidatorText: 'Entrez un code blinder',
                          keyboardType: TextInputType.phone,
                          validator: _phoneFieldValidator,
                          icon: Icons.person,
                          labelColor: labelColorTextField,
                        ),

                        SizedBox(height: hv * 3.0),

                        IpasswordField(
                          hintText: 'Code d\'accès',
                          keyboardType: TextInputType.text,
                          controller: _codeAccessController,
                          onSavedFunc: (value) => userPassword = value,
                          emptyValidatorText: 'Entrez votre Code d\'accès',
                          validator: _passwordFieldValidator,
                          color: labelColorTextField,
                        ),

                        SizedBox(height: hv * 3.0),

                        CustomButton(
                          color: kPrimaryColor,
                          text: 'Se connecter',
                          textColor: Colors.white,
                          onPressed: () async {
                            Navigator.of(context, rootNavigator: true)
                                      .pushNamed(DelegateHomePageView.pageName);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ),
            Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage('assets/images/bottom_bar.png'),
                  ),
                ))
          ],
        ),
      ),
    );
  }



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
