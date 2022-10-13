import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/program_model.dart';
import '../../utils/screen_size.dart';
import '../../widgets/custom_widgets.dart';
import '../notifications_page.dart';
import 'add_new_event_step2_page.dart';

class AddNewEventPageView extends StatefulWidget {
  static const String pageName = "events/add_new_event";
  const AddNewEventPageView({Key? key}) : super(key: key);

  @override
  State<AddNewEventPageView> createState() => _AddNewEventPageViewState();
}

class _AddNewEventPageViewState extends State<AddNewEventPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  List<ProgramModel> listProgramModel = [];
  late int counter = 0;
  String checkedIcon = "assets/images/events/check-box.png";
  String checkedIconSelected = "assets/images/events/check-box-green.png";


  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    listProgramModel.add(ProgramModel(
        title: "Mariage d'Aicha et Martial",
        location: 'Au marché de Mfou',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/manage_event_programs/calendar-img.png"));
    listProgramModel.add(ProgramModel(
        title: "Concert de Tenor",
        location: 'Au palais des sports',
        startDate: 'Jeudi 25 jan 2020',
        endDate: null,
        amount: null,
        unity: null,
        isPackage: true,
        img: "assets/images/manage_event_programs/wedding.png"));
    listProgramModel.add(ProgramModel(
        title: "Mariage d'Aicha et Martial",
        location: 'Au marché de Mfou',
        startDate: 'Jeudi 25',
        endDate: 'Sam 28 jan 2021',
        amount: 75000,
        unity: "XAF",
        isPackage: false,
        img: "assets/images/manage_event_programs/wedding.png"));

    for(var dev in listProgramModel){
      if(dev.isChecked!){
        counter++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          final media = MediaQuery.of(context).size;
          return Scaffold(
            //backgroundColor: Colors.green,
            resizeToAvoidBottomInset: false,
            body: ListView(
              padding: EdgeInsets.zero,
              //physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  //color: Colors.grey.shade50,
                  height: 230,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Stack(
                              children: <Widget>[
                                Material(
                                  elevation: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage('assets/images/events/wedding_del_home2.png'),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          )
                        ],
                      ),
                      Positioned(
                        top: media.longestSide <= 775
                            ? screenAwareSize(20, context)
                            : screenAwareSize(35, context),
                        left: 1,
                        right: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                  const Text("Ajouter un évènement", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color.fromRGBO(255, 255, 255, 0.8)),textAlign: TextAlign.left,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 0,
                        right: 0,
                        child: Container(
                        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 0),
                        child: Container(
                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          decoration:BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 16,
                                    spreadRadius: 0.2,
                                    offset: const Offset(0, 8)),
                              ]
                          ),
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              child: const Text("Mariage d'Aîcha et de Michael pour leur bonheur",
                                  style:TextStyle(fontSize: 23, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: 'Inter',)),
                          ),
                        ),
                      ),)
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 37),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Liste des programmes ", style: TextStyle(
                          fontSize: 18.0, color: labelColorTextField, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontFamily: "Inter"),
                      ),
                      const SizedBox(height: 15,),
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          itemCount: listProgramModel.length,
                          itemBuilder: (context, int position){
                            return Container(
                              padding: const EdgeInsets.only(bottom: 26),
                              child: InkWell(
                                splashColor: Colors.grey,
                                onTap: (){
                                  setState(() {

                                    if(listProgramModel[position].isChecked!){
                                      counter--;
                                      if(counter<0){
                                        counter = 0;
                                      }
                                    }else{
                                      counter++;
                                      if(counter<0){
                                        counter = 0;
                                      }
                                    }

                                    listProgramModel[position].isChecked = !listProgramModel[position].isChecked!;
                                  });
                                },
                                child: Container(
                                  //margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  //padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 2),
                                  decoration:BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 1.0, color: kPrimaryColor),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          if(listProgramModel[position].isChecked!)...{
                                            Image.asset(checkedIconSelected, width: 20, height: 20,)
                                          }else...{
                                            Image.asset(checkedIcon, width: 20, height: 20,)
                                          }

                                        ],
                                      ),

                                      ListTile(
                                        enabled: true,
                                        selected: true,
                                        selectedColor: Colors.green,
                                        selectedTileColor: Colors.black,
                                        leading: Container(
                                          //padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Image.asset(listProgramModel[position].img!),
                                        ),
                                        title: Text(listProgramModel[position].title,
                                          style:const TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                        subtitle: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(listProgramModel[position].location,
                                                style:const TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                            ),
                                            Row(children: [
                                              if(!listProgramModel[position].isPackage!)...{
                                                RichText(
                                                  text: TextSpan(
                                                    //style: TextStyle(color: Colors.red, fontSize: 16),
                                                    children: [
                                                      TextSpan(text: "${listProgramModel[position].amount}",
                                                          style:const TextStyle(fontSize: 20.578, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                                      WidgetSpan(
                                                        child: Transform.translate(
                                                          offset: const Offset(0.0, -12.0),
                                                          child: Text(listProgramModel[position].unity!,
                                                            style:const TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              } else...{
                                                Container(
                                                  padding: const EdgeInsets.all(2.0),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xff2D68E6),
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                  child: Image.asset("assets/images/manage_event_programs/akar-icons_eye-open.png", width: 12, height: 12,),
                                                ),
                                                const SizedBox(width: 7,),
                                                InkWell(
                                                  onTap: (){
                                                    print("dfsdfsd");
                                                    /*Navigator.of(context)
                                                        .pushNamed(PackagePageView.pageName, arguments: {
                                                      "title": widget.listProgramModel[position].title,
                                                      "programModel": widget.listProgramModel.first
                                                    });*/
                                                  },
                                                  child: const Text("packages",
                                                      style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter",)),
                                                ),
                                              }
                                            ],)

                                          ],
                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: 92.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              const SizedBox(width: 15,),
                              Container(
                                width: 120,
                                color: grayLocation,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("vin+honneur",
                                          style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                      const SizedBox(height: 5,),
                                      RichText(
                                        text: TextSpan(
                                          //style: TextStyle(color: Colors.red, fontSize: 16),
                                          children: [
                                            const TextSpan(text: "250 000",
                                                style:TextStyle(fontSize: 19, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(0.0, -12.0),
                                                child: const Text("XAF",
                                                  style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 40,),
                                      Center(
                                        child: Image.asset("assets/images/events/check-box-square.png", width: 16, height: 16,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                width: 120,
                                color: grayLocation,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        textDirection: TextDirection.rtl,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: (){
                                              print("ajouter package 2");
                                            },
                                            child: Center(
                                              child: Image.asset("assets/images/events/check-box-square.png", width: 16, height: 16,),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Center(
                                        child: Column(
                                          children: [
                                            const Text("vin+honneur",
                                                style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                            const SizedBox(height: 5,),
                                            RichText(
                                              text: TextSpan(
                                                //style: TextStyle(color: Colors.red, fontSize: 16),
                                                children: [
                                                  const TextSpan(text: "250 000",
                                                      style:TextStyle(fontSize: 19, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                                  WidgetSpan(
                                                    child: Transform.translate(
                                                      offset: const Offset(0.0, -12.0),
                                                      child: const Text("XAF",
                                                        style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )


                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                width: 120,
                                color: grayLocation,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Messe+Eclarage",
                                          style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                      const SizedBox(height: 5,),
                                      RichText(
                                        text: TextSpan(
                                          //style: TextStyle(color: Colors.red, fontSize: 16),
                                          children: [
                                            const TextSpan(text: "250 000",
                                                style:TextStyle(fontSize: 19, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(0.0, -12.0),
                                                child: const Text("XAF",
                                                  style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: Image.asset("assets/images/events/check-box-square.png", width: 16, height: 16,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),
                      Container(
                        //margin: const EdgeInsets.only(top: 10, bottom: 10),
                        //padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 2),
                        decoration:BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1.0, color: kPrimaryColor),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(checkedIcon, width: 20, height: 20,)
                              ],
                            ),

                            ListTile(
                              enabled: true,
                              selected: true,
                              selectedColor: Colors.green,
                              selectedTileColor: Colors.black,
                              leading: Container(
                                //padding: const EdgeInsets.only(bottom: 8.0),
                                child: Image.asset("assets/images/manage_event_programs/calendar-img.png"),
                              ),
                              title: const Text("Dote d'Aicha et Martial",
                                style:TextStyle(fontSize: 16, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: Text("Au marché de Mfou",
                                      style:TextStyle(fontSize: 13, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                  ),
                                  Row(children: [
                                    RichText(
                                      text: TextSpan(
                                        //style: TextStyle(color: Colors.red, fontSize: 16),
                                        children: [
                                          const TextSpan(text: "750000",
                                              style:TextStyle(fontSize: 20.578, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Impact',)),
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(0.0, -12.0),
                                              child: const Text("XAF",
                                                style:TextStyle(fontSize: 8, color: titleProgramEventManage, fontWeight: FontWeight.w400, fontFamily: 'Inter',), textAlign: TextAlign.start,),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],)

                                ],
                              ),

                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 34),
                        child: CustomButton(
                          color: kPrimaryColor,
                          text: 'Continuer',
                          textColor: Colors.white,
                          onPressed: () async {
                            Navigator.of(context, rootNavigator: true).pushNamed(AddNewEventStep2PageView.pageName);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26,)
              ],
            ),
          );
        });
  }
}
