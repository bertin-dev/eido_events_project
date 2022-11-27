import 'package:eido_events_project/constants.dart';
import 'package:eido_events_project/providers/app.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_widgets.dart';
import '../controller_account/controller_home_page.dart';
import '../notifications_page.dart';
import '../server_account/home_server_page.dart';
import 'delegate_home_page.dart';


class DelegateLoginStep2PageView extends StatefulWidget {
  String typeAccount;
  DelegateLoginStep2PageView({Key? key, required this.typeAccount}) : super(key: key);
  static const String pageName = "delagate_login_step2";

  @override
  _DelegateLoginStep2PageViewState createState() => _DelegateLoginStep2PageViewState();
}

class _DelegateLoginStep2PageViewState extends State<DelegateLoginStep2PageView> {
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
                const Text("Se connecter au", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xff2D68E6), fontFamily: "Inter"),),
                const SizedBox(height: 5.0),
                const Text("Mariage de Aîcha", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32.85, color: whiteColor, fontFamily: "Inter"),),
                 SizedBox(height: 35),

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
                          imgLeftIcon: Image.asset("assets/images/profile-blue-icon.png", width: 22, height: 22,),
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
                          leftIcon : Image.asset("assets/images/lock-icon.png", width: 22, height: 22,),
                        ),

                        SizedBox(height: hv * 3.0),

                        CustomButton(
                          color: kPrimaryColor,
                          text: 'Se connecter',
                          textColor: Colors.white,
                          onPressed: () async {

                            if(widget.typeAccount==BaseModel.CONTROLER){
                              Navigator.of(context).pushNamed(ControllerHomePageView.pageName);
                            } else if (widget.typeAccount==BaseModel.DELEGUATE){
                              Navigator.of(context).pushNamed(DelegateHomePageView.pageName);
                            } else {
                              Navigator.of(context).pushNamed(HomeAccountServerPageView.pageName);
                            }

                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            )
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
