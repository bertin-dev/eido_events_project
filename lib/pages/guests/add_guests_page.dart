import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../constants.dart';
import '../../providers/app.dart';
import '../../utils/screen_size.dart';
import '../../widgets/custom_widgets.dart';
import '../events/success_event_page.dart';
import '../manage_event_programs/success_page.dart';

class AddGuestsPageView extends StatefulWidget {
  static const String pageName = "guests/add_guests_page";
  const AddGuestsPageView({Key? key}) : super(key: key);

  @override
  State<AddGuestsPageView> createState() => _AddGuestsPageViewState();
}

class _AddGuestsPageViewState extends State<AddGuestsPageView> {

  late final GlobalKey<ScaffoldState> _scaffoldKey;
  AutovalidateMode? _autovalidate;
  final _addLocationFormKey = GlobalKey<FormState>();

  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();
  var focusNode4 = FocusNode();
  var focusNode5 = FocusNode();
  var focusNode6 = FocusNode();

  final TextEditingController _addLastNameController = TextEditingController();
  final TextEditingController _addFirstNameController = TextEditingController();
  final TextEditingController _addPhoneController = TextEditingController();
  final TextEditingController _addCivilityController = TextEditingController();
  final TextEditingController _addGenreController = TextEditingController();
  final TextEditingController _addEmailController = TextEditingController();

  late String firstName;
  late String lastName;
  late String phone;
  late String civility;
  late String genre;
  late String email;

  late File _image;
  final List<File> _images = [];
  bool openBottom = false;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
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
                                  const Text("Ajouter un invité", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: whiteColor),textAlign: TextAlign.left,),
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
                                  style:TextStyle(fontSize: 20, color: titleProgramEventManage, fontWeight: FontWeight.w700, fontFamily: 'Inter',)),
                            ),
                          ),
                        ),)
                    ],
                  ),
                ),
                const SizedBox(height: 35,),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Form(
                    autovalidateMode: _autovalidate,
                    key: _addLocationFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Nom",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                        const SizedBox(height: 5,),
                        ItextFieldImgIcon(
                          focus: focusNode1,
                          //: labelColorTextField,
                          textColor: bottomNavUnSelected,
                          prefix: Image.asset("assets/images/guests/email.png", width: 32, height: 32,),
                          hintText: "Entrez le nom",
                          controller: _addLastNameController,
                          keyboardType: TextInputType.text,
                          onChanged: (val) => lastName = val,
                          backgroundColor: grayLocation,
                          validator: _addNameFieldValidator,
                          emptyValidatorText: 'Veuillez entrez le nom',
                          radius: 8.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 10.0,
                          pBottomPreffix: 10.0,
                          pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 20,),
                        const Text("Prenom",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                        const SizedBox(height: 5,),
                        ItextFieldImgIcon(
                          focus: focusNode2,
                          //: labelColorTextField,
                          textColor: bottomNavUnSelected,
                          prefix: Image.asset("assets/images/guests/email.png", width: 32, height: 32,),
                          hintText: "Entrez le prenom",
                          controller: _addFirstNameController,
                          keyboardType: TextInputType.text,
                          onChanged: (val) => lastName = val,
                          backgroundColor: grayLocation,
                          validator: _addNameFieldValidator,
                          emptyValidatorText: 'Veuillez entrez le prenom',
                          radius: 8.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 10.0,
                          pBottomPreffix: 10.0,
                          pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 20,),

                        const Text("Photo (facultatif)",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                        const SizedBox(height: 5,),
                        _uploadImageWidget(title: "Capturer ou selectionner la photo", image: 0, context: context),
                        const SizedBox(height: 20,),
                        const Text("Numéro de téléphone",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                        const SizedBox(height: 5,),
                        ItextFieldImgIcon(
                          focus: focusNode3,
                          textColor: bottomNavUnSelected,
                          prefix: Image.asset("assets/images/guests/email.png", width: 32, height: 32,),
                          hintText: "Entrer le Numéro de téléphone",
                          controller: _addPhoneController,
                          keyboardType: TextInputType.phone,
                          onChanged: (val) => phone = val,
                          backgroundColor: grayLocation,
                          validator: _addNameFieldValidator,
                          emptyValidatorText: 'Veuillez entrer le Numéro de téléphone',
                          radius: 8.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 10.0,
                          pBottomPreffix: 10.0,
                          pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 20,),

                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Civilité",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                                  const SizedBox(height: 5,),
                                  ItextFieldImgIcon(
                                    focus: focusNode4,
                                    textColor: bottomNavUnSelected,
                                    prefix: Image.asset("assets/images/guests/email.png", width: 32, height: 32,),
                                    hintText: "Ex: Mr, Mme",
                                    controller: _addCivilityController,
                                    keyboardType: TextInputType.name,
                                    onChanged: (val) => civility = val,
                                    backgroundColor: grayLocation,
                                    validator: _addNameFieldValidator,
                                    emptyValidatorText: 'Entrer un genre',
                                    radius: 8.0,
                                    pLeftPreffix: 15.0,
                                    pTopPreffix: 10.0,
                                    pBottomPreffix: 10.0,
                                    pRightPreffix: 15.0,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Genre",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                                  const SizedBox(height: 5,),
                                  ItextFieldImgIcon(
                                    focus: focusNode5,
                                    textColor: bottomNavUnSelected,
                                    prefix: Image.asset("assets/images/guests/email.png", width: 32, height: 32,),
                                    hintText: "M ou F",
                                    controller: _addGenreController,
                                    keyboardType: TextInputType.datetime,
                                    onChanged: (val) => genre = val,
                                    backgroundColor: grayLocation,
                                    validator: _addNameFieldValidator,
                                    emptyValidatorText: 'Entrer un genre',
                                    radius: 8.0,
                                    pLeftPreffix: 15.0,
                                    pTopPreffix: 10.0,
                                    pBottomPreffix: 10.0,
                                    pRightPreffix: 15.0,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 20,),
                        const Text("Email",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                        const SizedBox(height: 5,),
                        ItextFieldImgIcon(
                          focus: focusNode6,
                          textColor: bottomNavUnSelected,
                          prefix: Image.asset("assets/images/guests/email.png", width: 32, height: 32,),
                          hintText: "Entrez l'Email",
                          controller: _addEmailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) => email = val,
                          backgroundColor: grayLocation,
                          validator: _addNameFieldValidator,
                          emptyValidatorText: 'Entrez l\'Email',
                          radius: 8.0,
                          pLeftPreffix: 15.0,
                          pTopPreffix: 10.0,
                          pBottomPreffix: 10.0,
                          pRightPreffix: 15.0,
                        ),
                        const SizedBox(height: 20,),

                        const Text("Programmes",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                        const SizedBox(height: 5,),
                        Container(
                              margin: const EdgeInsets.only(top: 12.0, bottom: 20),
                              height: 92.0,
                              child: ListView(
                                primary: true,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    color: titleProgramEventManage,
                                    child: Stack(
                                      children: [
                                        const Align( alignment: Alignment.bottomLeft,
                                          child: Image(image: AssetImage("assets/images/events/ellipse.png"), width: 40, height: 40,),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: (){
                                                    print("dote d'Aicha et Martial");
                                                  },
                                                  child: Center(
                                                    child: Image.asset("assets/images/events/check-box-green.png", width: 16, height: 16,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: const [
                                                Text("dote d'Aicha et",
                                                    style:TextStyle(fontSize: 11, color: whiteColor, fontWeight: FontWeight.w600, fontFamily: "Inter")),
                                                SizedBox(height: 5,),
                                                Text("Martial",
                                                    style:TextStyle(fontSize: 11, color: whiteColor, fontWeight: FontWeight.w600, fontFamily: "Inter")),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Container(
                                    width: 120,
                                    color: grayLocation,
                                    child: Stack(
                                      children: [
                                        const Align( alignment: Alignment.bottomLeft,
                                          child: Image(image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"), width: 40, height: 40,),
                                        ),
                                        Column(
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
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Text("Mariage civil",
                                                    style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter")),
                                                SizedBox(height: 5,),
                                                Text("d'Aicha et Martial",
                                                    style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter")),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Container(
                                    width: 120,
                                    color: grayLocation,
                                    child: Stack(
                                      children: [
                                        const Align( alignment: Alignment.bottomLeft,
                                          child: Image(image: AssetImage("assets/images/manage_event_programs/bg-package-container.png"), width: 40, height: 40,),
                                        ),
                                        Column(
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
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Text("Mariage civil",
                                                    style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter")),
                                                SizedBox(height: 5,),
                                                Text("d'Aicha et Martial",
                                                    style:TextStyle(fontSize: 11, color: titleProgramEventManage, fontWeight: FontWeight.w600, fontFamily: "Inter")),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: CustomButton(
                            color: kPrimaryColor,
                            text: 'Valider',
                            textColor: Colors.white,
                            textSize: 13.0,
                            onPressed: () async {
                              Navigator.of(context)
                                  .pushNamed(SuccessEventsPageView.pageName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  String? _addNameFieldValidator(String? value) {
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
                      Image.asset("assets/images/guests/camera.png", width: 41, height: 41,),
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
