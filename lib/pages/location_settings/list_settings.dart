
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/list_settings_model.dart';
import '../../widgets/location_base_settings_widget.dart';

class ListSettingsPageView extends StatefulWidget {
  static const String pageName = "location_settings/list_settings";

  const ListSettingsPageView({Key? key}): super(key: key);

  @override
  _ListSettingsState createState() => _ListSettingsState();
}

class _ListSettingsState extends State<ListSettingsPageView> {

  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    final hv = MediaQuery.of(context).size.height / 100;
    final wv = MediaQuery.of(context).size.width / 100;
    return LocationBaseSettingsWidget(
      containerWidget: Container(
          //color: Colors.green,
          padding: const EdgeInsets.only(left: 9, right: 10, top: 100),
          child: ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    padding: const EdgeInsets.only(bottom: 13, top: 13),
                    child: Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(20),
                        decoration:BoxDecoration(
                          color: const Color(0xff22D928),//listSettings[position].bgColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container()
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("CONFIG 3",
                                                style:TextStyle(fontSize: 19.76, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Impact")),
                                            Image.asset("assets/images/location_settings/next.png", width: 20, height: 20,)
                                          ],
                                        ),
                                        const Text("452",
                                            style:TextStyle(fontSize: 13.0, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                        const Text("Invité",
                                            style:TextStyle(fontSize: 11.0, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25),
                    //width: 90,
                    //height: 95,
                    /*decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1.0, color: whiteColor),
                        //color: Colors.yellow,
                    ),*/
                    child: Image.asset("assets/images/location_settings/avatar-config1.png", width: 80, height: 85,),
                  ),
                  Positioned(
                    bottom: 10,
                    width: (wv*100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 0.0,
                                top: 0.5,
                              ),
                              child: Material(
                                color: kPrimaryColor,
                                elevation: 4,
                                borderRadius:
                                BorderRadius.circular(100),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage: NetworkImage(
                                        'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                      )),
                                ),
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                            ),
                            child: Material(
                              color: kPrimaryColor,
                              elevation: 4,
                              borderRadius:
                              BorderRadius.circular(100),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                      'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 32.0,
                              ),
                              child: Material(
                                color: kPrimaryColor,
                                elevation: 4,
                                borderRadius:
                                BorderRadius.circular(100),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage: NetworkImage(
                                        'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                      )),
                                ),
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 50.0,
                            ),
                            child: Material(
                              color: kPrimaryColor,
                              elevation: 4,
                              borderRadius:
                              BorderRadius.circular(100),
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: whiteColor,
                                  child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400, color: kPrimaryColor),),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),

                  ),

                ],
              ),
              Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    padding: const EdgeInsets.only(bottom: 13, top: 13),
                    child: Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(20),
                        decoration:BoxDecoration(
                          color: const Color(0xffF26DF2),//listSettings[position].bgColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container()
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("CONFIG 6",
                                                style:TextStyle(fontSize: 19.76, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Impact")),
                                            Image.asset("assets/images/location_settings/next.png", width: 20, height: 20,)
                                          ],
                                        ),
                                        const Text("452",
                                            style:TextStyle(fontSize: 13.0, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                        const Text("Invité",
                                            style:TextStyle(fontSize: 11.0, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25),
                    //width: 90,
                    //height: 95,
                    /*decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1.0, color: whiteColor),
                        //color: Colors.yellow,
                    ),*/
                    child: Image.asset("assets/images/location_settings/avatar-config2.png", width: 80, height: 85,),
                  ),
                  Positioned(
                    bottom: 10,
                    width: (wv*100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 0.0,
                                top: 0.5,
                              ),
                              child: Material(
                                color: kPrimaryColor,
                                elevation: 4,
                                borderRadius:
                                BorderRadius.circular(100),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage: NetworkImage(
                                        'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                      )),
                                ),
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                            ),
                            child: Material(
                              color: kPrimaryColor,
                              elevation: 4,
                              borderRadius:
                              BorderRadius.circular(100),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                      'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 32.0,
                              ),
                              child: Material(
                                color: kPrimaryColor,
                                elevation: 4,
                                borderRadius:
                                BorderRadius.circular(100),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage: NetworkImage(
                                        'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                      )),
                                ),
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 50.0,
                            ),
                            child: Material(
                              color: kPrimaryColor,
                              elevation: 4,
                              borderRadius:
                              BorderRadius.circular(100),
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: whiteColor,
                                  child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400, color: kPrimaryColor),),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),

                  ),

                ],
              )
            ],
          )

          /*ListView.builder(
            shrinkWrap: true,
            itemCount: listSettings.length,
            itemBuilder: (BuildContext context, int position) {
              return Stack(
                children: [
                  Container(
                      //color: Colors.red,
                      padding: const EdgeInsets.only(bottom: 13, top: 13),
                      child: Container(
                        margin: const EdgeInsets.all(12),
                          padding: const EdgeInsets.all(20),
                          decoration:BoxDecoration(
                            color: const Color(0xff22D928),//listSettings[position].bgColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container()
                                  ),
                                  Expanded(
                                      flex: 5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("CONFIG 3",
                                              style:TextStyle(fontSize: 19.76, color: whiteColor, fontWeight: FontWeight.w700, fontFamily: "Impact")),
                                              Image.asset("assets/images/location_settings/next.png", width: 20, height: 20,)
                                            ],
                                          ),
                                          const Text("452",
                                            style:TextStyle(fontSize: 13.0, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                          const Text("Invité",
                                            style:TextStyle(fontSize: 11.0, color: whiteColor, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25),
                    //width: 90,
                    //height: 95,
                    /*decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1.0, color: whiteColor),
                        //color: Colors.yellow,
                    ),*/
                    child: Image.asset("assets/images/location_settings/avatar-config1.png", width: 80, height: 85,),
                  ),
                  Positioned(
                    bottom: 10,
                    width: (wv*100),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                  left: 0.0,
                                  top: 0.5,
                                ),
                                child: Material(
                                  color: kPrimaryColor,
                                  elevation: 4,
                                  borderRadius:
                                  BorderRadius.circular(100),
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: CircleAvatar(
                                        radius: 12,
                                        backgroundImage: NetworkImage(
                                          'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                        )),
                                  ),
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                ),
                                child: Material(
                                  color: kPrimaryColor,
                                  elevation: 4,
                                  borderRadius:
                                  BorderRadius.circular(100),
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: CircleAvatar(
                                        radius: 12,
                                        backgroundImage: NetworkImage(
                                          'https://play-images-prod-cms.tech.tvnz.co.nz/api/v1/web/image/content/dam/images/entertainment/shows/p/person-of-interest/personofinterest_coverimg.png.2017-03-08T11:21:33+13:00.jpg?width=960&height=540',
                                        )),
                                  ),
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                  left: 32.0,
                                ),
                                child: Material(
                                  color: kPrimaryColor,
                                  elevation: 4,
                                  borderRadius:
                                  BorderRadius.circular(100),
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: CircleAvatar(
                                        radius: 12,
                                        backgroundImage: NetworkImage(
                                          'https://i.insider.com/5c9a115d8e436a63e42c2883?width=600&format=jpeg&auto=webp',
                                        )),
                                  ),
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 50.0,
                              ),
                              child: Material(
                                color: kPrimaryColor,
                                elevation: 4,
                                borderRadius:
                                BorderRadius.circular(100),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: whiteColor,
                                    child: Text("+254", style: TextStyle(fontSize: 7.75, fontWeight: FontWeight.w400, color: kPrimaryColor),),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),

                  ),

                ],
              );
            },
          ),*/
        ),
      title: "Liste des configurations",
      devKey: _scaffoldKey,
      fullBgImg: "assets/images/location_settings/bg-body-add-location.png",
      isBottomNav: false,
      isDrawerNavRight: false,
      bgHeader: "assets/images/location_settings/bg-header-add-location.png",
      heightBgHeader: 125,
    );
  }


  List<ListSettingsModel> listSettings = <ListSettingsModel>[
    ListSettingsModel(
      positionName: "Table 1",
      headerItem: 'Config 1',
      desc: 'bonjour bonjour',
      bgColor: const Color(0xffCCF9FF),
      screenshot: "assets/images/delegate_account/event_details_orange.png",
      smallIcon: "assets/images/location_settings/small_location_orange.png",
      locationNumber: "+32",
      iconColor: const Color(0xff05B7D4),
      state: "Invités",
    ),
  ];


}
