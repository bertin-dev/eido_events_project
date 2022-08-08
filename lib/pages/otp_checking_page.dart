import 'package:eido_events_project/pages/reset_forget_password_page.dart';
import 'package:eido_events_project/pages/success_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/custom_widgets.dart';



void main(){
  runApp( const OtpCheckingPageView());
}
class OtpCheckingPageView extends StatelessWidget {
  const OtpCheckingPageView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const OtpCheckingPage(),
    );
  }
}

class OtpCheckingPage extends StatefulWidget {
  static const String pageName = "otp_checking";

  const OtpCheckingPage({Key? key}) : super(key: key);
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
            return Stack(
              children: [
                ListView(
                  children: <Widget>[

                    SizedBox(height: hv * 8),
                    Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text("Verification du compte", style: TextStyle(fontSize: 23.0,
                                color: textColor,
                                fontWeight: FontWeight.w700)),
                          ],
                        )),

                    SizedBox(height: hv * 2),//43

                    const Padding(
                      padding: EdgeInsets.only(left: 32, right: 29),
                      child: Text("Merci d'avoir créer votre compte, vous recevrez dans quelques instants un code de confirmation",
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0, color: Color(0xff07394B))
                      ),
                    ),

                    SizedBox(height: hv * 2),//43

                    Padding(
                      padding: const EdgeInsets.only(top: 23.0, left: 29.0, right: 29.0),
                      child: Column(
                        children: <Widget>[

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OtpInput(_otpController1, true),
                              OtpInput(_otpController2, false),
                              OtpInput(_otpController3, false),
                              OtpInput(_otpController4, false)
                            ],
                          ),

                          SizedBox(height: hv * 5),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Renvoyer le code dans ',
                                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400,),
                              ),

                              Text(
                                target.difference(DateTime.now()).toString().split('.')[0],
                                style: const TextStyle(fontSize: 15.0, color: kPrimaryColor, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),

                          SizedBox(height: hv * 10),

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
                                        .pushNamed(ResetForgetPasswordPageView.pageName);
                                    //authentication(context);
                                  },
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),


                  ],
                ),
                Positioned(
                  bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: const BottomWidget())
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
      height: 53,
      width: 57.5,
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
            border: const OutlineInputBorder(),
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

