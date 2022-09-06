import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:qr_flutter/qr_flutter.dart';


class ControllerHomePageView extends StatefulWidget {
  const ControllerHomePageView({Key? key}) : super(key: key);
  static const String pageName = "controller_home_page";

  @override
  State<ControllerHomePageView> createState() => _ControllerHomePageViewState();
}

class _ControllerHomePageViewState extends State<ControllerHomePageView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  static const JsonCodec JSON = const JsonCodec();

  final TextEditingController _searchQueryController = TextEditingController();
  final FocusNode _focusNode =  FocusNode();

  bool _isSearching = true;
  String _searchText = "";
  List<String> _searchList = [];
  bool _onTap = false;
  int _onTapTextLength = 0;

  _SuggestionsPageState() {
    _searchQueryController.addListener(() {
      if (_searchQueryController.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
          _searchList = [];
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQueryController.text;
          _onTap = _onTapTextLength == _searchText.length;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }




  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          final hv = MediaQuery.of(context).size.height / 100;
          final wv = MediaQuery.of(context).size.width / 100;
          final _media = MediaQuery.of(context).size;
          return Scaffold(
            //backgroundColor: Colors.green,
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/controller_account/bg_qrcode.png'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 21, bottom: 52),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: labelColorTextField,
                            size: 22,
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ),
                        const Text("Recherche d'invité", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: labelColorTextField),textAlign: TextAlign.left,),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(height: 80.0),
                            TextFormField(
                              controller: _searchQueryController,
                              focusNode: _focusNode,
                              onFieldSubmitted: (String value) {
                                print("$value submitted");
                                setState(() {
                                  _searchQueryController.text = value;
                                  _onTap = true;
                                });
                              },
                              onSaved: (String? value) => print("$value saved"),
                              decoration: const InputDecoration(
                                border: const UnderlineInputBorder(),
                                filled: true,
                                icon: const Icon(Icons.search),
                                hintText: 'Type two words with space',
                                labelText: 'Seach words *',
                              ),
                            ),

                            const SizedBox(height: 40.0),
                            Center(
                              child:  MaterialButton(
                                  color: Colors.orangeAccent,
                                  onPressed: () => print("Pressed"),
                                  child: const Text(
                                    '    Search    ',
                                    style: const TextStyle(fontSize: 18.0),
                                  )),
                            ),
                            const SizedBox(height: 200.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      padding:  const EdgeInsets.only(
//                  top: MediaQuery.of(context).size.height * .18,
                          top: 136.0,
                          right: 0.0,
                          left: 38.0),
                      child: _isSearching && (!_onTap) ? getFutureWidget() : null),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 60.0,
                                color: whiteColor,
                              ),
                            ),
                      const Text(
                        'OU',
                        style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: whiteColor),
                      ),
                      Padding(
                              padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 60.0,
                                color: whiteColor,
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 168,),
                  QrImage(
                    data: "1234567890",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ],
              ),
            )
          );
        });
  }

  Widget getFutureWidget() {
    return FutureBuilder(
        future: _buildSearchList(),
        initialData: <ListTile>[],
        builder:
            (BuildContext context, AsyncSnapshot<List<ListTile>> childItems) {
          return Container(
            color: Colors.white,
            height: getChildren(childItems)!.length * 48.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
//            padding:  EdgeInsets.only(left: 50.0),
              children: childItems.data!.isNotEmpty
                  ? ListTile
                  .divideTiles(
                  context: context, tiles: getChildren(childItems)!)
                  .toList()
                  : [],
            ),
          );
        });
  }
  List<ListTile>? getChildren(AsyncSnapshot<List<ListTile>> childItems) {
    if (_onTap && _searchText.length != _onTapTextLength) _onTap = false;
    List<ListTile>? childrenList =
    _isSearching && !_onTap ? childItems.data : [];
    return childrenList;
  }

  ListTile _getListTile(String suggestedPhrase) {
    return  ListTile(
      dense: true,
      title:  Text(
        suggestedPhrase,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onTap: () {
        setState(() {
          _onTap = true;
          _isSearching = false;
          _onTapTextLength = suggestedPhrase.length;
          _searchQueryController.text = suggestedPhrase;
        });
        _searchQueryController.selection = TextSelection
            .fromPosition( TextPosition(offset: suggestedPhrase.length));
      },
    );
  }

  Future<List<ListTile>> _buildSearchList() async {
    if (_searchText.isEmpty) {
      _searchList = [];
      return [];
    } else {
      _searchList = await _getSuggestion(_searchText) ?? [];
//        ..add(_searchText);

      List<ListTile> childItems = [];
      for (var value in _searchList) {
        if (!(value.contains(" ") && value.split(" ").length > 2)) {
          childItems.add(_getListTile(value));
        }
      }
      return childItems;
    }
  }

  Future<List<String>?> _getSuggestion(String hintText) async {
    String url = "SOME_TEST_API?s=$hintText&max=4";

    var response =
    await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    List decode = JSON.decode(response.body);
    if (response.statusCode != HttpStatus.OK || decode.length == 0) {
      return null;
    }
    List<String> suggestedWords = [];

    if (decode.length == 0) return null;

    decode.forEach((f) => suggestedWords.add(f["word"]));
//    String data = decode[0]["word"];

    return suggestedWords;
  }

  _detailProfil() {
    showDialog(
      //barrierLabel: "dev",
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //titlePadding: EdgeInsets.only(left: 43, top: 19, bottom: 8,right: 38),
          title: Row(
            children: [
              const Text(
                "Close", textAlign: TextAlign.left,
                style: TextStyle(color: kPrimaryColor, fontSize: 8, fontWeight: FontWeight.w400),),
              const SizedBox(width: 5,),
              Image.asset("assets/images/controller_account/close_square.png", width: 14, height: 14,)
            ],
          ),
          contentPadding: const EdgeInsets.only(top: 13.83),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: whiteColor,
              ),
              width: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.zero,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            //color: Color(0xff01B2F1),
                            boxShadow: const [
                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 16.0,
                              ),
                            ],
                              image: const DecorationImage(
                                image: AssetImage('assets/images/controller_account/bg_profil_controller.png'),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                  child: CircleAvatar(
                                    child: Image.asset("assets/images/home_page/avatar.png"),
                                  ),
                                ),
                              const SizedBox(height: 3,),
                              const Text("Ngakam Kontchou",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: labelColorTextField, fontFamily: "Inter"),),
                              const SizedBox(height: 3,),
                              const Text("Président",
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: labelColorTextField, fontFamily: "Inter"),),
                              const SizedBox(height: 3,),
                               const Chip(
                                 backgroundColor: Color(0xff219653),
                                 label: Text("Président",
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: labelColorTextField, fontFamily: "Inter"),),
                               ),

                            ],
                          ),
                        ),
                        ListTile(
                          //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                          leading: ClipOval(
                            child: CircleAvatar(
                              child: Image.asset("assets/images/delegate_account/event_details_orange.png"),
                            ),
                          ),
                          title: const Text("Evenement concerné ",
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                          subtitle: Wrap(
                            children: const[
                              Text("Mariage de Sali ",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            ],
                          ),
                        ),
                        const Divider(color: Color(0xffFFE5DE),),
                        ListTile(
                          //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                          leading: ClipOval(
                            child: CircleAvatar(
                              child: Image.asset("assets/images/controller_account/call.png"),
                            ),
                          ),
                          title: const Text("Numéro de téléphone",
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                          subtitle: Wrap(
                            children: const[
                              Text("+237 696 78 54 78 ",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            ],
                          ),
                        ),
                        const Divider(color: Color(0xffFFE5DE),),
                        ListTile(
                          //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                          leading: ClipOval(
                            child: CircleAvatar(
                              child: Image.asset("assets/images/controller_account/send.png"),
                            ),
                          ),
                          title: const Text("Email ",
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                          subtitle: Wrap(
                            children: const[
                              Text("Ngakamkontchou@gmail.com ",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            ],
                          ),
                        ),
                        const Divider(color: Color(0xffFFE5DE),),
                        ListTile(
                          //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                          leading: ClipOval(
                            child: CircleAvatar(
                              child: Image.asset("assets/images/controller_account/profile.png"),
                            ),
                          ),
                          title: const Text("Genre ",
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                          subtitle: Wrap(
                            children: const[
                              Text("Masculin",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            ],
                          ),
                        ),
                        const Divider(color: Color(0xffFFE5DE),),
                        ListTile(
                          //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                          leading: ClipOval(
                            child: CircleAvatar(
                              child: Image.asset("assets/images/controller_account/location.png"),
                            ),
                          ),
                          title: const Text("Position dans la salle",
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: grayForProfilName, fontFamily: "Inter"),),
                          subtitle: Wrap(
                            children: const[
                              Text("S-D7, au fond à gauche",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: grayForProfilName, fontFamily: "Inter"),),
                            ],
                          ),
                        ),
                        const Divider(color: Color(0xffFFE5DE),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                      color: labelColorTextField,
                      shape:  RoundedRectangleBorder(
                        side: const BorderSide(width: 1.0, color: labelColorTextField),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      onPressed: () {
                        //TODO: Implement event associate functionality
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Voir la position',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700, fontFamily: "Inter"),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(width: 13.0),
                          Image.asset('assets/images/controller_account/map.png',
                            fit: BoxFit.cover,
                            width: 18,
                            height: 18,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Expanded(
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                      color: kPrimaryColor,
                      shape:  RoundedRectangleBorder(
                        side: const BorderSide(width: 1.0, color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      onPressed: () {
                        //TODO: Implement event associate functionality
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Confirmer l\'identité',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700, fontFamily: "Inter"),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(width: 13.0),
                          Image.asset('assets/images/controller_account/icons_check-box.png',
                            fit: BoxFit.cover,
                            width: 18,
                            height: 18,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        );
      },
    );
  }
}
