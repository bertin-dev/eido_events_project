import 'package:eido_events_project/pages/reset_forget_password_page.dart';
import 'package:eido_events_project/pages/success_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/custom_widgets.dart';



class OtpCheckingPage extends StatefulWidget {
  static const String pageName = "otp_checking";
  bool isForgotPassword;
   OtpCheckingPage({Key? key, required this.isForgotPassword}) : super(key: key);
  @override
  _OtpCheckingPageState createState() => _OtpCheckingPageState();
}

class _OtpCheckingPageState extends State<OtpCheckingPage> {

  final _otpCheckFormKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  AutovalidateMode? _autovalidate;
  late final DateTime target;

  @override
  void initState() {
    super.initState();
    target = DateTime.now().add(const Duration(minutes: 1));
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
        body: StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ListView(
              padding: const EdgeInsets.only(top: 82.0, left: 29.0, right: 29.0),
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("Verification du compte", style: TextStyle(fontSize: 23.0,
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter", fontStyle: FontStyle.normal)),
                  ],
                ),
                const SizedBox(height: 21),//43
                Wrap(
                  children: const [
                    Text("Merci d'avoir créer votre compte, vous recevrez dans quelques instants un code de confirmation",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0, color: Color(0xff07394B),
                            fontFamily: "Inter", fontStyle: FontStyle.normal)
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Column(
                  children: <Widget>[
                    Wrap(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OtpInput(_otpController1, true),
                        const SizedBox(width: 30,),
                        OtpInput(_otpController2, false),
                        const SizedBox(width: 30,),
                        OtpInput(_otpController3, false),
                        const SizedBox(width: 30,),
                        OtpInput(_otpController4, false)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Renvoyer le code dans ',
                          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400,
                              fontFamily: "Inter", fontStyle: FontStyle.normal),
                        ),

                        Text(
                          target.difference(DateTime.now()).toString().split('.')[0],
                          style: const TextStyle(fontSize: 15.0, color: kPrimaryColor, fontWeight: FontWeight.w400,
                              fontFamily: "Inter", fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                    const SizedBox(height: 52),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 66.0, left: 2.0, right: 3.0),
                      child: CustomButton(
                        color: kPrimaryColor,
                        text: 'Envoyer',
                        textColor: Colors.white,
                        onPressed: () async {

                          if(widget.isForgotPassword){
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(ResetForgetPasswordPageView.pageName);
                          } else{
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(SuccessPageView.pageName);
                          }
                        },
                      ),
                    ),

                  ],
                ),


              ],
            );
          },),
      );
    });
  }



  String? _otpFieldValidator(String? value) {
    if (value!.isEmpty) {
      return "-";
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]{1}\$";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the number is valid
      return null;
    }
    // The pattern of the nber didn't match the regex above.
    return 'Phone number must be 9 characters long';
  }

}



class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: 51.5,
      child: TextField(
        style: const TextStyle(fontWeight: FontWeight.w600, color: successTextColor),
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0, color: successTextColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: kPrimaryColor,),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: titleProgramEventManage,),
            ),
            counterText: '',
            hintText: "-",
            hintStyle: const TextStyle(color: bottomUnderline, fontSize: 12.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

