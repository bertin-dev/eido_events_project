import 'package:flutter/material.dart';
import '../constants.dart';
import 'custom_widgets.dart';

class IntroView extends StatelessWidget {
  final String? imageLink;
  final String? title;
  final String? message;
  final String? buttonLabel;
  final TabController? tabController;
  final int? position;

  IntroView(
      {Key? key,
        this.imageLink,
        this.title,
        this.message,
        this.buttonLabel,
        this.tabController,
        this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hv = MediaQuery.of(context).size.height / 100;
    return ListView(
      children: <Widget>[
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 15,),
              const Center(
                child: Text("Eido", style: TextStyle(color: Color(0xff181818), fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 19),),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 38, left: 38),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.asset(imageLink!),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(tabController!.length, (index) => buildDot(index, context),),
                    ),

                    Text(title!,
                      style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: labelColorTextField),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: hv * 2,
                    ),

                    Text(message!,
                      style: const TextStyle(
                          fontSize: 14.55,
                          fontWeight: FontWeight.w500,
                          color: descOnBoarding),
                      textAlign: TextAlign.center,
                    ),
                    //SizedBox(height: hv * 5,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container buildDot(int index, BuildContext context){

    /*TabPageSelector(
      controller: tabController,
      color: Colors.blue.withOpacity(0),
      selectedColor: Colors.red.withOpacity(0.8),
    )*/

    return Container(
      height: 6,
      width: position == index ? 28 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: position == index ? BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kPrimaryColor,
      ): BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffD9D9D9),
      ),
    );
  }

  MaterialColor myWhite = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
}
