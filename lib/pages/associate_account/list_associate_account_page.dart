import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../../constants.dart';
import '../../models/items_associate_list_model.dart';
import '../../providers/app.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';
import '../delegate_account/delegate_login_page.dart';
import 'menu_edit_associate_account.dart';

class ListAssociateAccountPageView extends StatefulWidget {
  static const String pageName = "associate_account/list";
  const ListAssociateAccountPageView({Key? key}) : super(key: key);

  @override
  State<ListAssociateAccountPageView> createState() => _ListAssociateAccountPageViewState();
}

class _ListAssociateAccountPageViewState extends State<ListAssociateAccountPageView> {
  late bool isChecked;
  List<ItemsAssociateListModel> itemsAssociate = [];
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late final _creatAssociateAccountFormKey;
  AutovalidateMode? _autovalidate;
  final TextEditingController _addPositionTitleController = TextEditingController();
  final TextEditingController _addPositionDescController = TextEditingController();
  String? codeBlinderName;
  String? phone;
  String? email;
  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();
  late List _accountList = [];

  Color cardBackgroundColor = whiteColor;
  Color bgChipColor = const Color(0xffD4FFE6);
  Color txtChipColor = const Color(0xff219653);
  String status = "Activer";

  String avatars = "assets/images/associate_account/user-avatar.png";
  Color titleColors = labelColorTextField;
  Color subTitleColors = grayForProfilName;
  Color btnEditTextColors = whiteColor;
  Color btnSendTextColors = whiteColor;
  Color btnBgEditColors = kPrimaryColor;
  Color btnBgSendColors = bottomNavSelected;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _creatAssociateAccountFormKey = GlobalKey<FormState>();
    _accountList = [
      "Associé",
      "Délégué",
      "Serveur"
    ];
    isChecked = Global.shared.isInstructionView;
    itemsAssociate.add(ItemsAssociateListModel(
        name: "Chatnoir123", 
        phone: "+237 690 000 000", 
        avatar: Image.asset(avatars, width: 37, height: 37,),
        state: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: bgChipColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(status,
              style: TextStyle(fontSize: 8.0, color: txtChipColor, fontWeight: FontWeight.w400, fontFamily: "Inter"),),
          ),
        ),
        switchButton: Transform.scale(
          alignment: Alignment.topRight,
          scale: 0.8,
          child: Switch(
            value: isChecked,
            onChanged: (bool isOn) {
              if (kDebugMode) {
                print(isOn);
              }
              setState(() {
                isChecked = isOn;
                Global.shared.isInstructionView = isOn;
                isOn =!isOn;
                if (kDebugMode) {
                  print(isChecked);
                }
              });

              setState(() {
                if(status=="activer"){
                  print("désactiver");
                  status = "désactiver";
                }else{
                  print("activer");
                  status = "activer";
                }
              });
            },
            activeColor: switchGreenColor,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: whiteColor,
          ),
        ),
        editButton: MaterialButton(
            height: 26,
            //minWidth: 117,
            padding: const EdgeInsets.all(5),
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            onPressed: (){
              _scaffoldKey.currentState!.openEndDrawer();
            },
            child: Row(
              children: [
                Image.asset("assets/images/associate_account/edit-white.png", width: 16, height: 16,),
                const SizedBox(width: 6.84,),
                Text('Modifier',
                  style: TextStyle(color: btnEditTextColors, fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center,),
              ],
            )
        ),
        sendButton: MaterialButton(
            height: 26,
            //minWidth: 117,
            padding: const EdgeInsets.all(5),
            color: bottomNavSelected,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            onPressed: share,
            child: Row(
              children: [
                Image.asset("assets/images/associate_account/send-white.png", width: 16, height: 16,),
                const SizedBox(width: 6.84,),
                Text('Envoyer les accès',
                  style: TextStyle(color: btnSendTextColors, fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center,),
              ],
            )
        ),
        isSelected: false
    ));
    itemsAssociate.add(ItemsAssociateListModel(
        name: "Chatnoir123",
        phone: "+237 690 000 000",
        avatar: Image.asset(avatars, width: 37, height: 37,),
        state: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: bgChipColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(status,
              style: TextStyle(fontSize: 8.0, color: txtChipColor, fontWeight: FontWeight.w400, fontFamily: "Inter"),),
          ),
        ),
        switchButton: Transform.scale(
          alignment: Alignment.topRight,
          scale: 0.8,
          child: Switch(
            value: isChecked,
            onChanged: (bool isOn) {
              if (kDebugMode) {
                print(isOn);
              }
              setState(() {
                isChecked = isOn;
                Global.shared.isInstructionView = isOn;
                isOn =!isOn;
                if (kDebugMode) {
                  print(isChecked);
                }
              });

              setState(() {
                if(status=="activer"){
                  print("désactiver");
                  status = "désactiver";
                }else{
                  print("activer");
                  status = "activer";
                }
              });
            },
            activeColor: switchGreenColor,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: whiteColor,
          ),
        ),
        editButton: MaterialButton(
            height: 26,
            //minWidth: 117,
            padding: const EdgeInsets.all(5),
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            onPressed: (){
              _scaffoldKey.currentState!.openEndDrawer();
            },
            child: Row(
              children: [
                Image.asset("assets/images/associate_account/edit-white.png", width: 16, height: 16,),
                const SizedBox(width: 6.84,),
                Text('Modifier',
                  style: TextStyle(color: btnEditTextColors, fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center,),
              ],
            )
        ),
        sendButton: MaterialButton(
            height: 26,
            //minWidth: 117,
            padding: const EdgeInsets.all(5),
            color: bottomNavSelected,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            onPressed: share,
            child: Row(
              children: [
                Image.asset("assets/images/associate_account/send-white.png", width: 16, height: 16,),
                const SizedBox(width: 6.84,),
                Text('Envoyer les accès',
                  style: TextStyle(color: btnSendTextColors, fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center,),
              ],
            )
        ),
        isSelected: false
    ));
    itemsAssociate.add(ItemsAssociateListModel(
        name: "Chatnoir123",
        phone: "+237 690 000 000",
        avatar: Image.asset(avatars, width: 37, height: 37,),
        state: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: bgChipColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(status,
              style: TextStyle(fontSize: 8.0, color: txtChipColor, fontWeight: FontWeight.w400, fontFamily: "Inter"),),
          ),
        ),
        switchButton: Transform.scale(
          alignment: Alignment.topRight,
          scale: 0.8,
          child: Switch(
            value: isChecked,
            onChanged: (bool isOn) {
              if (kDebugMode) {
                print(isOn);
              }
              setState(() {
                isChecked = isOn;
                Global.shared.isInstructionView = isOn;
                isOn =!isOn;
                if (kDebugMode) {
                  print(isChecked);
                }
              });

              setState(() {
                if(status=="activer"){
                  print("désactiver");
                  status = "désactiver";
                }else{
                  print("activer");
                  status = "activer";
                }
              });
            },
            activeColor: switchGreenColor,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: whiteColor,
          ),
        ),
        editButton: MaterialButton(
            height: 26,
            //minWidth: 117,
            padding: const EdgeInsets.all(5),
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            onPressed: (){
              _scaffoldKey.currentState!.openEndDrawer();
            },
            child: Row(
              children: [
                Image.asset("assets/images/associate_account/edit-white.png", width: 16, height: 16,),
                const SizedBox(width: 6.84,),
                Text('Modifier',
                  style: TextStyle(color: btnEditTextColors, fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center,),
              ],
            )
        ),
        sendButton: MaterialButton(
            height: 26,
            //minWidth: 117,
            padding: const EdgeInsets.all(5),
            color: bottomNavSelected,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            onPressed: share,
            child: Row(
              children: [
                Image.asset("assets/images/associate_account/send-white.png", width: 16, height: 16,),
                const SizedBox(width: 6.84,),
                Text('Envoyer les accès',
                  style: TextStyle(color: btnSendTextColors, fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center,),
              ],
            )
        ),
        isSelected: false
    ));
  }

   changeState({
     required Color bgColor,
     required String avatarImg,
     required Color titleColor,
     required Color subTitleColor,
     required Color btnEditTextColor,
     required Color btnSendTextColor,
     required Color btnBgEditColor,
     required Color btnBgSendColor}) {
    setState(() {
      cardBackgroundColor = bgColor;
      avatars = avatarImg;
      titleColors = titleColor;
      subTitleColors = subTitleColor;
      btnEditTextColors = btnEditTextColor;
      btnSendTextColors = btnSendTextColor;
      btnBgEditColors = btnBgEditColor;
      btnBgSendColors = btnBgSendColor;
    });
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'EidoEvents',
        text: 'Partage des accès',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'My EidoEvents'
    );
  }

/*  Future<void> shareFile() async {
    List<dynamic> docs = await DocumentsPicker.pickDocuments;
    if (docs == null || docs.isEmpty) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: docs[0] as String,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return LocationBaseAssociateAccountWidget(
      containerWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 115, left: 10, right: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemsAssociate.length,
                    itemBuilder: (context, int position){
                      return InkWell(
                        splashColor: Colors.grey,
                        onTap: (){

                          setState((){
                            itemsAssociate[position].isSelected = !itemsAssociate[position].isSelected!;
                          });

                          print("before: ${!itemsAssociate[position].isSelected!}");
                          print("position=$position");
                          print("after: ${itemsAssociate[position].isSelected}");

                         /* if(itemsAssociate[position].isSelected!){
                            changeState(
                              bgColor:bottomNavSelected,
                              avatarImg: "assets/images/associate_account/user-orange.png",
                              titleColor: whiteColor,
                              subTitleColor: whiteColor,
                              btnEditTextColor: kPrimaryColor,
                              btnSendTextColor: bottomNavSelected,
                              btnBgEditColor: whiteColor,
                              btnBgSendColor: whiteColor,
                            );
                          }*/
                          Navigator.of(context).pushNamed(MenuEditAssociateAccountPageView.pageName);
                        },
                        child: Container(
                          decoration:BoxDecoration (
                              color: itemsAssociate[position].isSelected! ? bottomNavSelected : cardBackgroundColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 16,
                                    spreadRadius: 0.2,
                                    offset: const Offset(0, 8)),
                              ]
                          ),
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: itemsAssociate[position].avatar!,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(itemsAssociate[position].name!,
                                                  style: TextStyle(fontSize: 14.0, color: titleColors, fontWeight: FontWeight.w700)),
                                              const SizedBox(width: 5,),
                                              itemsAssociate[position].state!,
                                            ],
                                          ),
                                          Text(itemsAssociate[position].phone!,
                                              style: TextStyle(fontSize: 12.0, color: subTitleColors, fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      itemsAssociate[position].editButton!,
                                      const SizedBox(width: 5,),
                                      itemsAssociate[position].sendButton!
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                                height: 30,
                                //alignment: Alignment.topRight,
                                child: itemsAssociate[position].switchButton!,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
        ),
      title: "Comptes associés",
      iconMenu: "assets/images/associate_account/add-user.png",
      onPressedMenu:() {
          getBottomSheet(context);
      },
      devKey: _scaffoldKey,
      fullBgImg: "assets/images/associate_account/bg-ass-account.png",
      onPressedShared: share,
      isBottomNav: true,
      isDrawerNavRight: true,
    );
  }

    getBottomSheet(context) {
      String currentAccountSelectedValue = "Associé";
      final hv = MediaQuery.of(context).size.height / 100;
      final wv = MediaQuery.of(context).size.width / 100;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: whiteColor,
        elevation: 1.0,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0)),
        ),
        //enableDrag: true,
        builder: (context) => SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/associate_account/bg-bottomsheet.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 7,  right: 13,  left: 13,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Center(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right:10, top: 14.0, bottom: 15),
                          child: Container(
                            height: 5.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: bottomUnderline,
                            ),
                          ),
                        ),
                      )
                  ),
                  const Text(
                    'Créer un compte délégué',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19, fontFamily: "Inter", color: kPrimaryColor),
                  ),
                  const SizedBox(height: 11.0,),
                  Container(height: 2, color: kPrimaryColor,),
                  const SizedBox(height: 11.0,),
                  Container(width: (wv*100)/2, height: 2, color: kPrimaryColor,),
                  const SizedBox(height: 39.0,),
                  Form(
                    autovalidateMode: _autovalidate,
                    key: _creatAssociateAccountFormKey,
                    child: Column(
                      children: <Widget>[

                        ItextFieldImgIcon(
                          focus: focusNode1,
                          labelColor: labelColorTextField,
                          textColor: labelColorTextField,
                          prefix: Image.asset("assets/images/associate_account/profile-icon.png", width: 22, height: 22,),
                          hintText: "Code blinde",
                          controller: _addPositionTitleController,
                          keyboardType: TextInputType.text,
                          onChanged: (val) => codeBlinderName = val,
                          backgroundColor: whiteColor,
                          validator: _addLocationTitleFieldValidator,
                          emptyValidatorText: 'Entrer un nome de profil',
                          radius: 12.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 15.0,
                          pBottomPreffix: 15.0,
                          pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 20,),
                        ItextFieldImgIcon(
                            focus: focusNode2,
                            labelColor: labelColorTextField,
                            textColor: labelColorTextField,
                            prefix: Image.asset("assets/images/associate_account/lock-blue-icon.png", width: 22, height: 22,),
                            suffix: Image.asset("assets/images/associate_account/group-user-icon.png", width: 22, height: 22,),
                            hintText: "Numéro de téléphone",
                            controller: _addPositionDescController,
                            keyboardType: TextInputType.number,
                            onChanged: (val) => phone = val,
                            backgroundColor: whiteColor,
                            validator: _addLocationTitleFieldValidator,
                            emptyValidatorText: 'Entrer le numero de telephone',
                            radius: 12.0,
                            pLeftPreffix: 15.0,
                            pTopPreffix: 15.0,
                            pBottomPreffix: 15.0,
                            pRightPreffix: 15.0,
                            pLeftSuffix: 15.0,
                            pTopSuffix: 15.0,
                            pBottomSuffix: 15.0,
                            pRightSuffix: 15.0,
                            suffixbgColor: true
                        ),
                        const SizedBox(height: 20,),
                        ItextFieldImgIcon(
                          focus: focusNode3,
                          labelColor: labelColorTextField,
                          textColor: labelColorTextField,
                          prefix: Image.asset("assets/images/associate_account/message-icon.png", width: 22, height: 22,),
                          hintText: "Email",
                          controller: _addPositionDescController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) => email = val,
                          backgroundColor: whiteColor,
                          validator: _addLocationTitleFieldValidator,
                          emptyValidatorText: 'Entrer votre adresse email',
                          radius: 12.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 15.0,
                          pBottomPreffix: 15.0,
                          pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          //padding: EdgeInsets.all(15),
                          decoration: const ShapeDecoration(
                            color: whiteColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color(0xffE4DFDF)),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                          child: DropdownButtonFormField<String>(

                              decoration: InputDecoration(
                                hintText: '',
                                enabledBorder: InputBorder.none,
                                disabledBorder:InputBorder.none,
                                focusedBorder: InputBorder.none,
                                prefixIcon: Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset("assets/images/associate_account/paper-icon.png", width: 22, height: 22,),
                                ),
                              ),
                              dropdownColor: whiteColor,
                              focusColor: whiteColor,
                              //borderRadius: BorderRadius.circular(12.0),
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down, color: labelColorTextField),
                              items: _accountList.map((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: labelColorTextField, fontFamily: "Inter")),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  currentAccountSelectedValue = value!;
                                });
                                print(currentAccountSelectedValue);
                              },
                              value: currentAccountSelectedValue
                          ),
                        ),

                        SizedBox(height: hv * 3.0),

                        CustomButton(
                          color: kPrimaryColor,
                          text: 'Créer un compte',
                          textColor: Colors.white,
                          onPressed: () async {
                            showDialog(
                              barrierColor: whiteColor.withOpacity(0.8),
                                context: context,
                                builder: (context){
                                  return Center(
                                      child: Container(
                                        width: 118.5,
                                        height: 118.5,
                                        child: const CircularProgressIndicator(
                                          color: kPrimaryColor,
                                          strokeWidth: 10,
                                        ),
                                      )
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 45),
                ],
              ),
            ),
          ),
        ));
  }


  String? _addLocationTitleFieldValidator(String? value) {
    if (value!.isEmpty) {
      return "Entrez un numéro";
    }
    String p = "^[:;,\-@0-9a-zA-Zâéè'.\s]{9}\$";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      // So, the phone nber is valid
      return null;
    }
    // The pattern of the phone nber didn't match the regex above.
    return 'Phone number must be 9 characters long';
  }

}
