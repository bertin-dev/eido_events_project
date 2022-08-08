import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/delegate_account/bg_delegate.png'),
            fit: BoxFit.cover,
          )
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                //width: wv*60,
                width: 162,
                height: 223,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(height: 10.0),
            ],
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
    );
  }
}
