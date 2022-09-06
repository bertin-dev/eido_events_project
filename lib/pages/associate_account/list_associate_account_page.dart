import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/items_associate_list_model.dart';
import '../../widgets/location_base_settings_widget.dart';
import '../delegate_account/delegate_login_page.dart';

class ListAssociateAccountPageView extends StatefulWidget {
  static const String pageName = "associate_account/list";
  const ListAssociateAccountPageView({Key? key}) : super(key: key);

  @override
  State<ListAssociateAccountPageView> createState() => _ListAssociateAccountPageViewState();
}

class _ListAssociateAccountPageViewState extends State<ListAssociateAccountPageView> {
  late bool isChecked;
  List<ItemsAssociateListModel> itemsAssociate = [];

  @override
  void initState() {
    isChecked = Global.shared.isInstructionView;
    itemsAssociate.add(ItemsAssociateListModel(
        name: "Chatnoir123", 
        phone: "+237 690 000 000", 
        avatar: Image.asset("assets/images/associate_account/user-avatar.png", width: 37, height: 37,),
        state: Chip(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: const Color(0xffD4FFE6),
          label: Align(
            alignment: Alignment.center,
            child: Container(
              child: const Text("Activer", style: TextStyle(
                  fontSize: 8.0,
                  color: Color(0xff219653),
                  fontWeight: FontWeight.w400
              ),
              ),
            ),
          ),),
        switchButton: Switch(
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
          },
          activeColor: iconColor,
          inactiveTrackColor: Colors.grey,
          inactiveThumbColor: Colors.grey,
        ),
        editButton: MaterialButton(
            height: 26,
            //minWidth: 117,
            padding: const EdgeInsets.all(5),
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            onPressed: () {
              //Navigator.of(context).pushNamed(AddSettingsPageView.pageName);
            },
            child: Row(
              children: [
                Image.asset("assets/images/associate_account/edit-white.png", width: 16, height: 16,),
                const SizedBox(width: 6.84,),
                const Text('Modifier',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center,),
              ],
            )
        ),
        sendButton: MaterialButton(
            height: 26,
            //minWidth: 117,
            padding: const EdgeInsets.all(5),
            color: bottomNavSelected,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            onPressed: () {
              //Navigator.of(context).pushNamed(AddSettingsPageView.pageName);
            },
            child: Row(
              children: [
                Image.asset("assets/images/associate_account/send-white.png", width: 16, height: 16,),
                const SizedBox(width: 6.84,),
                const Text('Envoyer les accès',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center,),
              ],
            )
        ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return LocationBaseSettingsWidget(
        containerWidget: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120, left: 10, right: 10),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: itemsAssociate.length,
                  itemBuilder: (context, int position){
                    return Card(
                      elevation: 5,
                      child: Container(
                        //width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(5),
                                    child: itemsAssociate[position].avatar!,),
                                    Container(
                                      color: Colors.yellow,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(itemsAssociate[position].name!,
                                                  style: const TextStyle(fontSize: 14.0, color: labelColorTextField, fontWeight: FontWeight.w700)),
                                              const SizedBox(width: 5,),
                                              itemsAssociate[position].state!,
                                            ],
                                          ),
                                          Text(itemsAssociate[position].phone!,
                                              style: const TextStyle(fontSize: 12.0, color: grayForProfilName, fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                itemsAssociate[position].switchButton!,
                              ],
                            ),
                            Row(
                              children: [
                                itemsAssociate[position].editButton!,
                                const SizedBox(width: 5,),
                                itemsAssociate[position].sendButton!
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
        ),
        title: "Comptes associés",
      iconMenu: "assets/images/associate_account/add-user.png",
    );
  }

}
