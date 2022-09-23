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
  final String? headImg;

   IntroView(
      {Key? key,
      this.imageLink,
      this.title,
      this.message,
      this.buttonLabel,
      this.tabController,
      this.position,
      this.headImg})
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
              Container(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 35, left: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    if(position==0)...[
                      Stack(
                        children: [
                          if(headImg != null)...{
                            SizedBox(
                              width: 255.41,
                              height: 86.77,
                              child: Image.asset(headImg!),
                            ),
                          },
                          Container(
                            width: 305,
                            height: 305,
                            margin: const EdgeInsets.only(top: 50, bottom: 40),
                            child: Image.asset(imageLink!),
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(tabController!.length, (index) => buildDot(index, context),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 40, bottom: 19),
                        child: Text(title!,
                          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: labelColorTextField, fontFamily: "Inter"), textAlign: TextAlign.center,),),
                      Padding(
                        padding: const EdgeInsets.only(left: 3, right: 3, bottom: 60),
                        child: Text(message!,
                          style: const TextStyle(fontSize: 14.55, fontWeight: FontWeight.w500, color: descOnBoarding, fontFamily: "Inter"), textAlign: TextAlign.center,
                        ),
                      ),
                    ] else if(position==1)...[
                      Stack(
                        children: [
                          if(headImg != null)...{
                            SizedBox(
                              width: 255.41,
                              height: 86.77,
                              child: Image.asset(headImg!),
                            ),
                          },
                          Container(
                            width: 305,
                            height: 305,
                            margin: const EdgeInsets.only(top: 50, bottom: 40),
                            child: Image.asset(imageLink!),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(tabController!.length, (index) => buildDot(index, context),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.5, right: 3.5, top: 40, bottom: 19),
                        child: Text(title!,
                          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: labelColorTextField, fontFamily: "Inter"), textAlign: TextAlign.center,),),
                      Padding(
                        padding: const EdgeInsets.only(left: 3, right: 3, bottom: 60),
                        child: Text(message!,
                          style: const TextStyle(fontSize: 14.55, fontWeight: FontWeight.w500, color: descOnBoarding, fontFamily: "Inter"), textAlign: TextAlign.center,
                        ),
                      ),
                    ] else...[
                      Container(
                        width: 305,
                        height: 305,
                        margin: const EdgeInsets.only(bottom: 40, left: 2.5, right: 2.5),
                        child: Image.asset(imageLink!),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(tabController!.length, (index) => buildDot(index, context),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 40, bottom: 19),
                        child: Text(title!,
                          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: labelColorTextField, fontFamily: "Inter"), textAlign: TextAlign.center,),),
                      Padding(
                        padding: const EdgeInsets.only(left: 3, right: 3, bottom: 60),
                        child: Text(message!,
                          style: const TextStyle(fontSize: 14.55, fontWeight: FontWeight.w500, color: descOnBoarding, fontFamily: "Inter"), textAlign: TextAlign.center,
                        ),
                      ),
                    ]

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
