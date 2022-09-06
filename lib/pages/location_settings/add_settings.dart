import 'dart:io';

import 'package:eido_events_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../models/location_settings_model.dart';
import '../../providers/app.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';
import '../../widgets/offline_page.dart';
import 'list_settings.dart';


class AddSettingsPageView extends StatefulWidget {
  static const String pageName = "location_settings/add_settings";
  AddSettingsPageView({Key? key}): super(key: key);

  @override
  _AddSettingsState createState() => _AddSettingsState();
}

class _AddSettingsState extends State<AddSettingsPageView> {
  final _addLocationFormKey = GlobalKey<FormState>();
  final TextEditingController _addPositionTitleController = TextEditingController();
  final TextEditingController _addPositionDescController = TextEditingController();
  AutovalidateMode? _autovalidate;
  String? titleConfig;
  String? descConfig;
  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();

  late File _image;
  final List<File> _images = [];
  bool openBottom = false;
  int positionCounter = 0;

  counterPlus(){
    setState(() {
      positionCounter++;
    });
  }

  counterMoin(){
    setState(() {
      if(positionCounter > 0){
        positionCounter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return LocationBaseSettingsWidget(
      containerWidget: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120, left: 10, right: 10),
            child: Form(
              autovalidateMode: _autovalidate,
              key: _addLocationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Ajouter des configurations pour pouvoir y assigner des configuations",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, fontFamily: "Inter", color: labelColorTextField),),
                  const SizedBox(height: 25,),
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: whiteColor,
                      border: Border.all(width: 2.0, color: kPrimaryColor),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 17, right: 17),
                          height: 58,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: kPrimaryColor,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Config 1",
                            style:TextStyle(fontSize: 15.0, color: whiteColor, fontWeight: FontWeight.w600, fontFamily: "Inter"), textAlign: TextAlign.left,),

                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context, rootNavigator: true).pushNamed(ListSettingsPageView.pageName);
                                    },
                                    child: Image.asset("assets/images/location_settings/success_setting.png", width: 24, height: 24,),
                                  ),
                                  const SizedBox(width: 10,),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context, rootNavigator: true).pushNamed(OfflinePagePageView.pageName);
                                    },
                                    child: Image.asset("assets/images/location_settings/trash_setting.png", width: 24, height: 24,),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17, right: 17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 19,),
                              const Text("Nom de la position",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                              const SizedBox(height: 5,),
                              ItextFieldImgIcon(
                                focus: focusNode1,
                                //: labelColorTextField,
                                textColor: bottomNavUnSelected,
                                prefix: Image.asset("assets/images/location_settings/add-title-location.png", width: 32, height: 32,),
                                hintText: "Ex: table 1, rangée 1, etc...",
                                controller: _addPositionTitleController,
                                keyboardType: TextInputType.text,
                                onChanged: (val) => titleConfig = val,
                                backgroundColor: grayLocation,
                                validator: _addLocationTitleFieldValidator,
                                emptyValidatorText: 'Entrer un nom de la configuration',
                                radius: 100.0,
                                pLeftPreffix: 15.0,
                                pTopPreffix: 10.0,
                                pBottomPreffix: 10.0,
                                pRightPreffix: 15.0,
                              ),
                              const SizedBox(height: 20,),
                              const Text("Description",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                              const SizedBox(height: 5,),
                              ItextFieldImgIcon(
                                  focus: focusNode2,
                                  line: 5,
                                  //: labelColorTextField,
                                  textColor: bottomNavUnSelected,
                                  //prefix: Image.asset("assets/images/location_settings/add-title-location.png", width: 32, height: 32,),
                                  hintText: "Ex: la table 1 se trouve à côté de la porte d'entrée",
                                  controller: _addPositionDescController,
                                  keyboardType: TextInputType.text,
                                  onChanged: (val) => descConfig = val,
                                  backgroundColor: grayLocation,
                                  validator: _addLocationTitleFieldValidator,
                                  emptyValidatorText: 'Entrer la description',
                                  radius: 12.0
                              ),
                              const SizedBox(height: 20,),
                              const Text("Capture Photo de la position",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                              const SizedBox(height: 5,),
                              _uploadImageWidget(title: "Capturer la position", image: 0, context: context),
                              const SizedBox(height: 20,),
                              const Text("Nombre de place (ou d'invités)",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                              const SizedBox(height: 5,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex:1,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color(0xffE0E0E0),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                                child: GestureDetector(
                                                  onTap: () => counterMoin(),
                                                  child: Image.asset("assets/images/location_settings/btn-moin.png", width: 28, height: 30,),
                                                ),),
                                            Expanded(
                                                flex: 3,
                                                child: Container(
                                                  width: 28,
                                                  height: 30,
                                                  color: whiteColor,
                                                  child:  Center(
                                                    child: Text("$positionCounter",
                                                      style: TextStyle(fontFamily: "Inter", fontSize: 14, fontWeight: FontWeight.w400, color: labelColorTextField), textAlign: TextAlign.center,),
                                                  )
                                                )
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: GestureDetector(
                                                  onTap: () => counterPlus(),
                                                  child: Image.asset("assets/images/location_settings/btn-plus.png", width: 28, height: 30,),
                                                ),),
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex:1,
                                      child: Container()
                                  )
                                ],
                              ),
                              const SizedBox(height: 20,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          )
      ),
      title: "Ajout des Configurations"
    );
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

  Widget _uploadImageWidget(
      {required String title,
        void Function()? onPressed,
        required int image,
        required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        //color: Colors.black.withOpacity(0.1),
        onPressed: () async => await uploadImage(context, image),
        child: Container(
          height: 124,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffE7F4FF),
            border: Border.all(width: 1.0, color: const Color(0xffE4DFDF)),
          ),
          child: Stack(
            children: <Widget>[
              SizedBox(
                child: Container(
                  child: _images.isNotEmpty ? Image.file(_images[image], fit: BoxFit.fill): null,
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/location_settings/camera.png", width: 41, height: 41,),
                      Text(title),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage(context, int index) async {
    var logger = Logger();
    openBottom = true;
    Scaffold.of(context).showBottomSheet((context) => BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
        ),
        height: IApp.kheight(10, percent: true),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () async {
                  var image =
                  await _getImage(ImageSource.gallery, context);
                  setState(() {
                    _images[index] = image;
                  });
                },
                child: CircleAvatar(
                  radius: IApp.kwidth(25),
                  child: Image.asset("assets/images/location_settings/camera.png", width: 41, height: 41,),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  logger.d('ici');
                  var image =
                  await _getImage(ImageSource.camera, context);
                  setState(() {
                    _images[index] = image;
                  });
                },
                child: CircleAvatar(
                  radius: IApp.kwidth(25),
                  child: Image.asset("assets/images/location_settings/camera.png", width: 41, height: 41,),
                ),
              ),
            ]),
      ),
    ));
  }

  Future<File> _getImage(ImageSource source, BuildContext context) async {
    var imageTemporary;
    try{
      var image = await ImagePicker().pickImage(
          source: source, maxWidth: 480, maxHeight: 600);

       imageTemporary = File(image!.path);
      Navigator.of(context).pop();
    } on PlatformException catch(e){
      print('Failed to pick image $e');
    }
    return imageTemporary;
  }
}
