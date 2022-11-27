

import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';

import '../providers/app.dart';
import 'delegate_account/delegate_login_page.dart';
import 'login_page.dart';

class TransitionPageView extends StatefulWidget {
  static const String pageName = "transition_page";
  const TransitionPageView({Key? key}) : super(key: key);

  @override
  State<TransitionPageView> createState() => _TransitionPageViewState();
}

class _TransitionPageViewState extends State<TransitionPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Liste  des comptes"),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context)
                  .pushNamed(DelegateLoginPage.pageName, arguments: {
                "typeAccount": BaseModel.CONTROLER
              });
            },
            child: Container(
              height: 50,
              color: Colors.purple[600],
              child: const Center(child: Text('Compte ${BaseModel.CONTROLER}', style: TextStyle(fontSize: 18, color: Colors.white),)),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.of(context)
                  .pushNamed(DelegateLoginPage.pageName, arguments: {
                "typeAccount" : BaseModel.DELEGUATE
              });
            },
            child: Container(
              height: 50,
              color: Colors.purple[500],
              child: const Center(child: Text('Compte ${BaseModel.DELEGUATE}', style: TextStyle(fontSize: 18, color: Colors.white),)),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.of(context)
                  .pushNamed(DelegateLoginPage.pageName, arguments: {
                "typeAccount": BaseModel.SERVER
              });
            },
            child: Container(
              height: 50,
              color: Colors.purple[400],
              child: const Center(child: Text('Compte ${BaseModel.SERVER}', style: TextStyle(fontSize: 18, color: Colors.white),)),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.of(context)
                  .popAndPushNamed(LoginPage.pageName);
            },
            child: Container(
              height: 50,
              color: Colors.purple[300],
              child: const Center(child: Text('Compte ${BaseModel.ADMIN}', style: TextStyle(fontSize: 18, color: Colors.white),)),
            ),
          ),
        ],
      ),
    );
  }
}
