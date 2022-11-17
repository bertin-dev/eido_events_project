
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/guests_model.dart';
import '../../utils/screen_size.dart';
import '../../widgets/location_base_settings_widget.dart';
import 'add_guests_page.dart';
import 'edit_guests_page.dart';

class GuestsListPageView extends StatefulWidget {
  static const String pageName = "guests/guests_list_page";
  const GuestsListPageView({Key? key}) : super(key: key);

  @override
  State<GuestsListPageView> createState() => _GuestsListPageViewState();
}

class _GuestsListPageViewState extends State<GuestsListPageView> {

  late final GlobalKey<ScaffoldState> _scaffoldKey;
  List<GuestsModel> guestsModel = [];

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    guestsModel.add(GuestsModel(
        title: "Ella Patricia",
        createdAt: 'Crée le 25 mai 2022',
        avatar: 'assets/images/guests/avatar0.png',));
    guestsModel.add(GuestsModel(
        title: "Laura Donfack",
        createdAt: 'Crée le 25 mai 2022',
        avatar: 'assets/images/guests/avatar1.png',));
    guestsModel.add(GuestsModel(
        title: "Anne Frank",
        createdAt: 'Crée le 25 mai 2022',
        avatar: 'assets/images/guests/avatar2.png',));
    guestsModel.add(GuestsModel(
        title: "Jasper Noubissie",
        createdAt: 'Crée le 25 mai 2022',
        avatar: 'assets/images/guests/avatar3.png',));
    guestsModel.add(GuestsModel(
        title: "Maik's MacBook Pro",
        createdAt: 'Crée le 25 mai 2022',
        avatar: 'assets/images/guests/avatar4.png',));
    guestsModel.add(GuestsModel(
      title: "Ella Patricia",
      createdAt: 'Crée le 25 mai 2022',
      avatar: 'assets/images/guests/avatar0.png',));
    guestsModel.add(GuestsModel(
      title: "Laura Donfack",
      createdAt: 'Crée le 25 mai 2022',
      avatar: 'assets/images/guests/avatar1.png',));
    guestsModel.add(GuestsModel(
      title: "Anne Frank",
      createdAt: 'Crée le 25 mai 2022',
      avatar: 'assets/images/guests/avatar2.png',));
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return LocationBaseAssociateAccountWidget(
      containerWidget: Container(
          margin: EdgeInsets.only(top: media.longestSide <= 775
              ? screenAwareSize(115, context)
              : screenAwareSize(130, context),
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ListView(
            //shrinkWrap: true,
            children: [
              ListView.builder(
                //padding: const EdgeInsets.only(top: 117),
                shrinkWrap: true,
                primary: false,
                itemCount: guestsModel.length,
                itemBuilder: (_, position){
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(EditGuestsPageView.pageName);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      padding: const EdgeInsets.only(left: 0, right: 10, bottom: 10, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 16,
                                spreadRadius: 0.2,
                                offset: const Offset(0, 8)),
                          ],
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xFFE5E5E5),
                              /*Color(0xFFE7E6E5),
                              Color(0xFFE9E7E6),
                              Color(0xFFEDE8E6),
                              Color(0xFFF2EAE7),
                              Color(0xFFF5EBE8),
                              Color(0xFFF8ECE8),
                              Color(0xFFFCEDE9),
                              Color(0xFFFEEEE9),*/
                              Color(0xFFFEEEEA),
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipOval(
                              child: CircleAvatar(
                                radius: 22,
                                child: Image.asset(guestsModel[position].avatar),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(guestsModel[position].title,
                                  style:const TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                const SizedBox(height: 4,),
                                Text(guestsModel[position].createdAt,
                                  style:const TextStyle(fontSize: 11, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                const SizedBox(height: 8,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10,),
              ListView.builder(
                //padding: const EdgeInsets.only(top: 117),
                shrinkWrap: true,
                primary: false,
                itemCount: 2,
                itemBuilder: (_, position){
                  return InkWell(
                    onTap: (){},
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      padding: const EdgeInsets.only(left: 0, right: 10, bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipOval(
                              child: CircleAvatar(
                                radius: 22,
                                child: Image.asset(guestsModel[position].avatar),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(guestsModel[position].title,
                                  style:const TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                const SizedBox(height: 4,),
                                Text(guestsModel[position].createdAt,
                                  style:const TextStyle(fontSize: 11, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                                const SizedBox(height: 8,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),

            ],
          )
      ),
      title: "Liste d'invités",
      iconMenuLeft: "assets/images/guests/guest-close-icon.png",
      onPressedMenuLeft:() {
        Navigator.of(context).pop();
      },
      iconMenu: "assets/images/guests/filter-guests-filter.png",
      onPressedMenu:() {
        // method to show the search bar
        showSearch(
            context: context,
            // delegate to customize the search bar
            delegate: CustomSearchDelegate(guestsModel)
        );
      },
      iconMenu2: "assets/images/guests/filter-guests-icon.png",
      onPressedMenu2:() {
        //Navigator.of(context).pop();
      },
      iconMenu3: "assets/images/guests/add-guests-icon.png",
      onPressedMenu3:() {
        Navigator.of(context).pushNamed(AddGuestsPageView.pageName);
      },
      devKey: _scaffoldKey,
      fullBgImg: "assets/images/guests/full-bg-guests.png",
      bgHeader: "assets/images/guests/bg-guests-header.png",
      isBottomNav: false,
      isDrawerNavRight: false,
    );
  }

}




class CustomSearchDelegate extends SearchDelegate {
  List<GuestsModel> itemsList = [];

  CustomSearchDelegate(List<GuestsModel> guestsModel){
    itemsList = guestsModel;
  }

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Image.asset("assets/images/guests/guest-close-icon.png"),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<GuestsModel> matchQuery = [];
    for (var items in itemsList) {
      if (items.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(items);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InkWell(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: const EdgeInsets.only(left: 0, right: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 16,
                    spreadRadius: 0.2,
                    offset: const Offset(0, 8)),
              ],
              gradient: const LinearGradient(
                  colors: [
                    Color(0xFFE5E5E5),
                    /*Color(0xFFE7E6E5),
                              Color(0xFFE9E7E6),
                              Color(0xFFEDE8E6),
                              Color(0xFFF2EAE7),
                              Color(0xFFF5EBE8),
                              Color(0xFFF8ECE8),
                              Color(0xFFFCEDE9),
                              Color(0xFFFEEEE9),*/
                    Color(0xFFFEEEEA),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipOval(
                    child: CircleAvatar(
                      radius: 22,
                      child: Image.asset(result.avatar),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(result.title,
                        style:const TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                      const SizedBox(height: 4,),
                      Text(result.createdAt,
                        style:const TextStyle(fontSize: 11, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                      const SizedBox(height: 8,),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<GuestsModel> matchQuery = [];
    for (var items in itemsList) {
      if (items.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(items);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InkWell(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: const EdgeInsets.only(left: 0, right: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 16,
                    spreadRadius: 0.2,
                    offset: const Offset(0, 8)),
              ],
              gradient: const LinearGradient(
                  colors: [
                    Color(0xFFE5E5E5),
                    /*Color(0xFFE7E6E5),
                              Color(0xFFE9E7E6),
                              Color(0xFFEDE8E6),
                              Color(0xFFF2EAE7),
                              Color(0xFFF5EBE8),
                              Color(0xFFF8ECE8),
                              Color(0xFFFCEDE9),
                              Color(0xFFFEEEE9),*/
                    Color(0xFFFEEEEA),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipOval(
                    child: CircleAvatar(
                      radius: 22,
                      child: Image.asset(result.avatar),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(result.title,
                        style:const TextStyle(fontSize: 14, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter",), textAlign: TextAlign.left,),
                      const SizedBox(height: 4,),
                      Text(result.createdAt,
                        style:const TextStyle(fontSize: 11, color: Color(0xff747688), fontWeight: FontWeight.w400, fontFamily: "Inter",), textAlign: TextAlign.left,),
                      const SizedBox(height: 8,),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

