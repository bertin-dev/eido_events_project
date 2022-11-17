
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import '../../constants.dart';
import '../../providers/app.dart';
import '../../widgets/custom_widgets.dart';
import '../../widgets/location_base_settings_widget.dart';
import 'list_of_program_page.dart';
import 'manage_product_page.dart';

class AddProductPageView extends StatefulWidget {
  const AddProductPageView({Key? key}) : super(key: key);
  static const String pageName = "manage_rubrique/add_product";

  @override
  State<AddProductPageView> createState() => _AddProductPageViewState();
}

class _AddProductPageViewState extends State<AddProductPageView> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  AutovalidateMode? _autovalidate;
  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  final _addFormKey = GlobalKey<FormState>();
  final TextEditingController _addProductNameController = TextEditingController();
  final TextEditingController _addPriceNameController = TextEditingController();
  late String productName;
  late String price;

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
    return LocationBaseSettingsWidget(
      containerWidget: ListView(
        padding: const EdgeInsets.only(top: 125),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 30),
            child: Form(
              autovalidateMode: _autovalidate,
              key: _addFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nom du produit",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                    focus: focusNode1,
                    //: labelColorTextField,
                    textColor: bottomNavUnSelected,
                    prefix: Image.asset("assets/images/rubrique/product-icon.png", width: 32, height: 32,),
                    hintText: "Ex Canette de coca Cola",
                    controller: _addProductNameController,
                    keyboardType: TextInputType.text,
                    onChanged: (val) => productName = val,
                    backgroundColor: grayLocation,
                    validator: _addNameFieldValidator,
                    emptyValidatorText: 'Veuillez entrez le nom',
                    radius: 8.0,
                    pLeftPreffix: 15.0,
                    pTopPreffix: 10.0,
                    pBottomPreffix: 10.0,
                    pRightPreffix: 15.0,
                  ),
                  const SizedBox(height: 10,),


                  const Text("Modele de billet",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: labelColorTextField),),
                  const SizedBox(height: 5,),
                  _uploadImageWidget(title: "Cliquez pour choisir votre modèle billet", image: 0, context: context),
                  const SizedBox(height: 20,),


                  const Text("Prix du produit",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, fontFamily: "Inter", color: titleProgramEventManage),),
                  const SizedBox(height: 5,),
                  ItextFieldImgIcon(
                    focus: focusNode2,
                    //: labelColorTextField,
                    textColor: bottomNavUnSelected,
                    prefix: Image.asset("assets/images/rubrique/money.png", width: 32, height: 32,),
                    hintText: "Entrez le montant",
                    controller: _addPriceNameController,
                    keyboardType: TextInputType.number,
                    onChanged: (val) => price = val,
                    backgroundColor: grayLocation,
                    validator: _addNameFieldValidator,
                    emptyValidatorText: 'Veuillez entrez le montant',
                    radius: 8.0,
                    pLeftPreffix: 15.0,
                    pTopPreffix: 10.0,
                    pBottomPreffix: 10.0,
                    pRightPreffix: 15.0,
                  ),
                  const SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: CustomButtonRightIcon(
                      color: kPrimaryColor,
                      text: 'Ajouté le produit',
                      textColor: Colors.white,
                      onPressed: () async {
                        Navigator.of(context).pushNamed(ManageProductPageView.pageName);
                      }, radius: 100,
                      pVertical: 8,
                      pHorizontal: 80,
                      size: 13,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      title: "Ajouter un produit",
      iconMenuLeft: "assets/images/rubrique/arrow-rounded-left.png",
      onPressedMenuLeft: () async {
        Navigator.of(context).pop();
        },
      devKey: _scaffoldKey,
      fullBgImg: "",
      isBottomNav: false,
      isDrawerNavRight: false,
      bgHeader: "assets/images/rubrique/bg-img.png",
      heightBgHeader: 125,
    );
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
