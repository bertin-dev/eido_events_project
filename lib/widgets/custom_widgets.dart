import 'package:flutter/material.dart';

import '../constants.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color textColor;
  final String text;
  final Color color;

   const CustomButton({Key? key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.color
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: onPressed,
        elevation: 5.0,
        textColor: textColor,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        child: Padding(
          padding: const EdgeInsets.only(top:16.0, bottom: 16.0),
          child: Text(text, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}

class CustomButtonWithLoading extends StatefulWidget {

  final VoidCallback onPressed;
  final Color textColor;
  final String text;
  final Color color;

  CustomButtonWithLoading({Key? key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.color,
  }) : super(key: key);

  @override
  _CustomButtonWithLoadingState createState() => _CustomButtonWithLoadingState();
}

class _CustomButtonWithLoadingState extends State<CustomButtonWithLoading> {

  bool isLoading = false;
  void _startLoading() async {
    print("is downloading=$isLoading");
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
    print("is downloading=$isLoading");
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        //onPressed: widget.onPressed,
        onPressed: () {
          // Update the state i.e. toogle the state of passwordVisible variable
          setState(() {
            isLoading ? null : _startLoading();
          });
        },
        style: ElevatedButton.styleFrom(
          primary: widget.color,
          onPrimary: widget.textColor,
          elevation: 5.0,
          //fixedSize: const Size(5.0, 1.0),
          //textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //shadowColor: Colors.red,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
          //side: const BorderSide(width: 1.0, color: Colors.red,),
          ),
      ),

        child: Padding(
    padding: isLoading ? const EdgeInsets.symmetric(vertical:5.0, horizontal: 82.0) : const EdgeInsets.symmetric(vertical:16.0, horizontal: 62.0),
    child: isLoading ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2,):Text(widget.text, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700)),
    ),
    )
    );
  }
}

class IpasswordField extends StatefulWidget {
  final String? hintText;
  final String? emptyValidatorText;
  final TextEditingController? controller;
  void Function(String?)? onSavedFunc;
  final TextInputType? keyboardType;
  String? Function(String?)? validator;
  final Color? color;
  final int? maxLength;

  IpasswordField({
    Key? key,
    this.hintText,
    @required this.emptyValidatorText,
    @required this.controller,
    this.onSavedFunc,
    this.keyboardType,
    this.validator,
    this.color,
    this.maxLength
  }) : super(key: key);

  @override
  _IpasswordFieldState createState() => _IpasswordFieldState();
}

class _IpasswordFieldState extends State<IpasswordField> {

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength ?? null,
      textInputAction: TextInputAction.done,
      cursorColor: kPrimaryColor,
      obscureText: passwordVisible,
      style: TextStyle(fontWeight: FontWeight.w400, color: widget.color),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: iconColor,),
        //labelText: widget.hintText,
        hintText: widget.hintText,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(15.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor,),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xffE4DFDF),
            width: 1.0,
          ),
        ),
        labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: widget.color),
        //filled: true,
        //fillColor: Color.fromRGBO(255, 255, 255, 0.8),
        //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        /*enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff039BE5), width: 2.3, style: BorderStyle.solid)
        ),*/
        suffixIcon: IconButton( padding: const EdgeInsets.all(0.0),
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
              color: const Color(0xff7A7D86)
          ),

          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ),
      validator: widget.validator,
      controller: widget.controller,
      onSaved: widget.onSavedFunc,
    );
  }
}


class ICheckbox extends StatelessWidget {
  const ICheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ));
  }
}


class ItextField extends StatelessWidget {
  final String? hintText;
  final String emptyValidatorText;
  final TextEditingController controller;
  void Function(String?)? onSavedFunc;
  final TextInputType? keyboardType;
  final IconData? icon;
  String? Function(String?)? validator;
  Function(String)? onChangedFunc;
  final int? maxLength;
  final Color? labelColor;

  ItextField({
      Key? key,
    this.hintText,
    required this.emptyValidatorText,
    required this.controller,
    this.onSavedFunc,
    this.keyboardType,
    this.icon,
    this.validator,
    this.onChangedFunc,
    this.maxLength,
    this.labelColor
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      child: maxLength != null ? TextFormField(
        style: TextStyle(fontWeight: FontWeight.w400, color: labelColor),
        textInputAction: TextInputAction.next,
        cursorColor: kPrimaryColor,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            //suffixIcon: Icon(icon, color: const Color(0xff039BE5),),
            prefixIcon: Icon(icon, color: iconColor,),
            //labelText: hintText,
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: labelColor),
            contentPadding: const EdgeInsets.all(15.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: kPrimaryColor,),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Color(0xffE4DFDF), width: 1.0,
              ),
            ),
          ),
        validator: validator,
        controller: controller,
        onChanged: onChangedFunc,
        onSaved: onSavedFunc,
      )
          :
      TextFormField(
        style: TextStyle(fontWeight: FontWeight.w400, color: labelColor),
        textInputAction: TextInputAction.next,
        cursorColor: kPrimaryColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          //suffixIcon: Icon(icon, color: const Color(0xff039BE5),),
          labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: labelColor),
          prefixIcon: Icon(icon, color: iconColor,),
          //labelText: hintText,
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: kPrimaryColor,),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Color(0xffE4DFDF), width: 1.0,
            ),
          ),
        ),
        validator: validator,
        controller: controller,
        onChanged: onChangedFunc,
        onSaved: onSavedFunc,
      )
      ,
    );
  }
}

class ITextFieldOld extends StatelessWidget {
  final String? hintText;
  final String emptyValidatorText;
  final TextEditingController controller;
  void Function(String?)? onSavedFunc;
  final TextInputType? keyboardType;
  final IconData? icon;
  String? Function(String?)? validator;
  Function(String)? onChangedFunc;
  final int? maxLength;
  final Color? labelColor;

  ITextFieldOld({
    Key? key,
    this.hintText,
    required this.emptyValidatorText,
    required this.controller,
    this.onSavedFunc,
    this.keyboardType,
    this.icon,
    this.validator,
    this.onChangedFunc,
    this.maxLength,
    this.labelColor
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      child: maxLength != null ? TextFormField(
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: Color(0xff039BE5)),
        cursorColor: const Color(0xff039BE5),
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon: Icon(icon, color: const Color(0xff039BE5),),
            labelText: hintText,
            labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0, color: labelColor),
            //prefixIcon: Icon(icon, /*color: Color(0xff039BE5)*/),
            //hintText: this.hintText,
            //filled: true,
            //fillColor: Color.fromRGBO(255, 255, 255, 0.7),
            //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
            enabledBorder:const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff039BE5), width: 2.3, style: BorderStyle.solid)
            )
        ),
        validator: validator,
        controller: controller,
        onChanged: onChangedFunc,
        onSaved: onSavedFunc,
      )
          :
      TextFormField(
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Color(0xff039BE5)),
        keyboardType: keyboardType,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0.0),
            labelText: hintText,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: labelColor),
            //filled: true,
            //fillColor: Color.fromRGBO(255, 255, 255, 0.7),
            //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
            enabledBorder:const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff039BE5), width: 2.0, style: BorderStyle.solid)
            )
        ),
        validator: validator,
        controller: controller,
        onChanged: onChangedFunc,
        onSaved: onSavedFunc,
      )
      ,
    );
  }
}
