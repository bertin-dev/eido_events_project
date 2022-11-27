import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../pages/home_page.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color textColor;
  final String text;
  final double? textSize;
  final Color color;

   const CustomButton({Key? key,
    required this.onPressed,
    required this.text,
    this.textSize = 16.0,
    required this.textColor,
    required this.color
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 5.0,
        textColor: textColor,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        child: Padding(
          padding: const EdgeInsets.only(top:16.0, bottom: 16.0),
          child: Text(text, style: TextStyle(fontSize: textSize!, fontWeight: FontWeight.w700, fontFamily: "Inter", fontStyle: FontStyle.normal,),textAlign: TextAlign.center,),
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
          Navigator.of(context, rootNavigator: true)
              .pushNamed(HomePageView.pageName);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, //button's fill color
          onPrimary: Colors.red, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
          onSurface: Colors.orange, //specify the button's disabled text, icon, and fill color
          shadowColor: Colors.black, //specify the button's elevation color
          elevation: 4.0, //buttons Material shadow
          fixedSize: const Size(5.0, 1.0),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'roboto'), //specify the button's text TextStyle
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0), //specify the button's Padding
          minimumSize: const Size(20, 40), //specify the button's first: width and second: height
          side: const BorderSide(color: Colors.yellow, width: 2.0, style: BorderStyle.solid), //set border for the button
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)), // set the buttons shape. Make its birders rounded etc
          enabledMouseCursor: MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
          disabledMouseCursor: MouseCursor.uncontrolled, //used to construct ButtonStyle.mouseCursor
          visualDensity: const VisualDensity(horizontal: 0.0, vertical: 0.0), //set the button's visual density
          tapTargetSize: MaterialTapTargetSize.padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
          animationDuration: const Duration(milliseconds: 100), //the buttons animations duration
          enableFeedback: true, //to set the feedback to true or false
          alignment: Alignment.bottomCenter, //set the button's child Alignment
        ),

        child: Padding(
    padding: isLoading ? const EdgeInsets.symmetric(vertical:16.0, horizontal: 32.0) : const EdgeInsets.symmetric(vertical:16.0, horizontal: 32.0),
    child: isLoading ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2,):Text(widget.text, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontFamily: "Inter",), textAlign: TextAlign.center,),
    ),
    )
    );
  }
}


class CustomButtonWithLoading2 extends StatefulWidget {

  final VoidCallback onPressed;
  final Color textColor;
  final String text;
  final Color color;

  CustomButtonWithLoading2({Key? key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.color,
  }) : super(key: key);

  @override
  _CustomButtonWithLoading2State createState() => _CustomButtonWithLoading2State();
}

class _CustomButtonWithLoading2State extends State<CustomButtonWithLoading2> {

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
        child: MaterialButton(
          //onPressed: widget.onPressed,
          elevation: 5.0,
          textColor: widget.textColor,
          color: widget.color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              isLoading ? null : _startLoading();
            });
            Navigator.of(context, rootNavigator: true).pushNamed(HomePageView.pageName);
          },
          child: Padding(
            padding: isLoading ? const EdgeInsets.symmetric(vertical:10.0, horizontal: 26.0) : const EdgeInsets.symmetric(vertical:16.0, horizontal: 32.0),
            child: isLoading ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2,):Text(widget.text, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontFamily: "Inter",), textAlign: TextAlign.center,),
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
  final Widget? leftIcon;

  IpasswordField({
    Key? key,
    this.hintText,
    @required this.emptyValidatorText,
    @required this.controller,
    this.onSavedFunc,
    this.keyboardType,
    this.validator,
    this.color,
    this.maxLength,
    this.leftIcon
  }) : super(key: key);

  @override
  _IpasswordFieldState createState() => _IpasswordFieldState();
}

class _IpasswordFieldState extends State<IpasswordField> {

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      textInputAction: TextInputAction.done,
      cursorColor: kPrimaryColor,
      obscureText: passwordVisible,
      style: TextStyle(fontWeight: FontWeight.w400, color: widget.color, fontFamily: 'Inter'),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        //prefixIcon: widget.leftIcon != null ? widget.leftIcon! : const Icon(Icons.lock, color: iconColor,),
        prefixIcon: widget.leftIcon != null
            ? Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 14),
          child: widget.leftIcon ?? const Icon(Icons.lock, color: iconColor,),
        )
            : const Icon(Icons.lock, color: iconColor,),
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
        labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: widget.color, fontFamily: 'Inter'),
        filled: true,
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


class ItextField extends StatefulWidget {
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
  final Widget? imgLeftIcon;

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
    this.labelColor,
    this.imgLeftIcon
  }) : super(key: key);

  @override
  State<ItextField> createState() => _ItextFieldState();
}

class _ItextFieldState extends State<ItextField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      child: widget.maxLength != null ? TextFormField(
        style: TextStyle(fontWeight: FontWeight.w400, color: widget.labelColor, fontFamily: 'Inter'),
        textInputAction: TextInputAction.next,
        cursorColor: kPrimaryColor,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          //suffixIcon: Icon(icon, color: const Color(0xff039BE5),),
          //prefixIcon:  Icon(icon, color: iconColor,) ?? imgLeftIcon!,

          prefixIcon: widget.imgLeftIcon != null
              ? Container(
            padding: const EdgeInsets.only(left: 15, right: 14, top: 15, bottom: 15),
            child: widget.imgLeftIcon ?? Icon(widget.icon, color: iconColor,),
          )
              : Icon(widget.icon, color: iconColor,),

          //labelText: hintText,
          hintText: widget.hintText,
          fillColor: Colors.white,
          filled: true,
          labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: widget.labelColor, fontFamily: 'Inter'),
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
        validator: widget.validator,
        controller: widget.controller,
        onChanged: widget.onChangedFunc,
        onSaved: widget.onSavedFunc,
      )
          :
      TextFormField(
        style: TextStyle(fontWeight: FontWeight.w400, color: widget.labelColor, fontFamily: 'Inter'),
        textInputAction: TextInputAction.next,
        cursorColor: kPrimaryColor,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          //suffixIcon: Icon(icon, color: const Color(0xff039BE5),),
          labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: widget.labelColor, fontFamily: 'Inter'),
          prefixIcon: widget.imgLeftIcon != null
              ? Container(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 15, bottom: 15),
            child: widget.imgLeftIcon ?? Icon(widget.icon, color: iconColor,),
          )
              : Icon(widget.icon, color: iconColor,),
          //labelText: hintText,
          hintText: widget.hintText,
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
        validator: widget.validator,
        controller: widget.controller,
        onChanged: widget.onChangedFunc,
        onSaved: widget.onSavedFunc,
      )
      ,
    );
  }
}

class ItextFieldImgIcon extends StatelessWidget {
  final String? hintText;
  final String emptyValidatorText;
  final TextEditingController controller;
  void Function(String?)? onSavedFunc;
  final TextInputType? keyboardType;
  String? Function(String?)? validator;
  Function(String)? onChangedFunc;

  final Color? labelColor;

  Function? onChanged;
  Function? onSuffixTap;
  String? placeholder;
  bool? obscureText = false;
  FocusNode? focus;
  List<TextInputFormatter>? inputFormatters;
  Key? key;
  Widget? suffix;
  String? selectValue;
  Widget? prefix;
  bool disable;
  Color? backgroundColor;
  Color? textColor;
  int ?line;
  bool? readOnly;
  double? radius;
  double? pLeftSuffix;
  double? pRightSuffix;
  double? pTopSuffix;
  double? pBottomSuffix;
  double? pLeftPreffix;
  double? pRightPreffix;
  double? pTopPreffix;
  double? pBottomPreffix;
  bool? suffixbgColor;

  ItextFieldImgIcon({
    Key? key,
    this.hintText,
    required this.emptyValidatorText,
    required this.controller,
    this.onSavedFunc,
    this.keyboardType,
    this.validator,
    this.onChangedFunc,
    this.labelColor,
    this.onChanged,
    this.obscureText,
    this.inputFormatters,
    this.focus,
    this.suffix,
    this.onSuffixTap,
    this.prefix,
    this.disable = false,
    this.line = 1,
    this.backgroundColor,
    this.textColor,
    this.readOnly = false,
    this.radius,
    this.pLeftSuffix,
    this.pRightSuffix,
    this.pTopSuffix,
    this.pBottomSuffix,
    this.pLeftPreffix,
    this.pRightPreffix,
    this.pTopPreffix,
    this.pBottomPreffix,
    this.suffixbgColor = false
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      child: TextFormField(
        style: TextStyle(fontWeight: FontWeight.w400, color: labelColor, fontFamily: 'Inter'),
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        onChanged: onChangedFunc,
        onSaved: onSavedFunc,

        autofocus: false,
        focusNode: focus ?? FocusNode(),
        readOnly: readOnly ?? false,
        cursorColor: textColor ?? Colors.white,
        inputFormatters: inputFormatters,
        minLines: line,
        maxLines: line,
        decoration: InputDecoration(
          suffixIcon: suffix != null && suffixbgColor==false
              ? Container(
            padding: EdgeInsets.only(left: pLeftSuffix??0, right: pRightSuffix??0, top: pTopSuffix??0, bottom: pBottomSuffix??0),
            child: suffix ?? const Text(''),
          )
              : suffix != null && suffixbgColor==true ?
                Container(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              /*boxShadow: [
                  BoxShadow(color: Colors.green, spreadRadius: 3)
                ]*/
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0)),
            ),
            padding: EdgeInsets.only(left: pLeftSuffix??0, right: pRightSuffix??0, top: pTopSuffix??0, bottom: pBottomSuffix??0),
            child: suffix ?? const Text(''),
          )
              : null,
          labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: labelColor, fontFamily: 'Inter'),
          prefixIcon: prefix != null
              ? Container(
            padding: EdgeInsets.only(left: pLeftPreffix??0, right: pRightPreffix??0, top: pTopPreffix??0, bottom: pBottomPreffix??0),
            child: prefix ?? const Text(''),
          )
              : null,
          //labelText: hintText,
          hintText: hintText,
          filled: true,
          fillColor: backgroundColor,
          contentPadding: const EdgeInsets.all(15.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: const BorderSide(color: kPrimaryColor,),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
            borderSide: const BorderSide(color: Color(0xffE4DFDF), width: 1.0,
            ),
          ),
        ),
      )
      ,
    );
  }
}

class CustomButtonRightIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Color textColor;
  final String text;
  final Color color;
  final String? icon;
  final double radius;
  final double pVertical;
  final double pHorizontal;
  final double? size;

  const CustomButtonRightIcon({Key? key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.color,
    this.icon,
    required this.radius,
    required this.pVertical,
    required this.pHorizontal,
    this.size
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: pVertical, horizontal: pHorizontal),
      color: color,
      shape:  RoundedRectangleBorder(
        side: BorderSide(width: 1.0, color: color),
        borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: onPressed,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: [
           Text(
            text,
            style: TextStyle(
                fontSize: size ?? 16.0, color: textColor, fontWeight: FontWeight.w700, fontFamily: "Inter"),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 12.0),
          if(icon!=null)...{
            Image.asset(icon!,
              fit: BoxFit.cover,
              width: 20,
              height: 20,),
          },
        ],
      ),
    );
  }
}

class CustomBtnForAlert extends StatelessWidget {
  final VoidCallback onPressedBtn;
  final Color textColorBtn;
  final String textBtn;
  final double textSizeBtn;
  final Color colorBtn;
  final String? iconLeftBtn;
  final String? iconRightBtn;
  final double radiusBtn;
  final double heightBtn;
  final double minWidthBtn;
  final double pTopBtn;
  final double pBottomBtn;
  final double pLeftBtn;
  final double pRightBtn;
  final double? sPacingBtn;
  final double? widthIconBtn;
  final double? heightIconBtn;

  const CustomBtnForAlert({Key? key,
    required this.onPressedBtn,
    required this.textBtn,
    required this.textColorBtn,
    required this.textSizeBtn,
    required this.colorBtn,
    this.iconLeftBtn,
    this.iconRightBtn,
    required this.radiusBtn,
    required this.heightBtn,
    required this.minWidthBtn,
    required this.pTopBtn,
    required this.pBottomBtn,
    required this.pLeftBtn,
    required this.pRightBtn,
    this.sPacingBtn,
    this.widthIconBtn,
    this.heightIconBtn,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: heightBtn,
      minWidth: minWidthBtn,
      padding:  EdgeInsets.only(top:pTopBtn, bottom: pBottomBtn, right: pRightBtn, left: pLeftBtn),
      color: colorBtn,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusBtn)),
      onPressed: onPressedBtn,
      child: Row(
        children: [
          if(iconLeftBtn != null)...{
            Image.asset(iconLeftBtn!,
              fit: BoxFit.cover,
              width: widthIconBtn!=null ? widthIconBtn! : 20,
              height: heightIconBtn!=null ? heightIconBtn! : 20,),
            SizedBox(width: sPacingBtn!),
          },
          Text(textBtn,
            style: TextStyle(color: textColorBtn, fontWeight: FontWeight.w700, fontSize: textSizeBtn, fontFamily: 'Inter'), textAlign: TextAlign.center,),

          if(iconRightBtn != null)...{
            SizedBox(width: sPacingBtn!),
            Image.asset(iconRightBtn!,
              fit: BoxFit.cover,
              width: widthIconBtn!=null ? widthIconBtn! : 20,
              height: heightIconBtn!=null ? heightIconBtn! : 20,),
          },
        ],
      )
    );
  }
}

class CustomAlertDialogDelete extends StatelessWidget {

  final double radius;
  final String title;
  final Color titleColor;
  final double titleSize;
  final String body;
  final Color bodyColor;
  final double bodySize;
  final double pLeft;
  final double pRight;
  final double pTop;
  final double pBottom;

  /*final VoidCallback onPressedLeftBtn;
  final Color textColorLeftBtn;
  final String textLeftBtn;
  final double textSizeLeftBtn;
  final Color colorLeftBtn;
  final String? iconLeftBtn;

  final double radiusBtn;

  final VoidCallback onPressedRightBtn;
  final Color textColorRightBtn;
  final String textRightBtn;
  final double textSizeRightBtn;
  final Color colorRightBtn;
  final String? iconRightBtn;*/

  List<Widget>? action;



   CustomAlertDialogDelete({Key? key,
    required this.title,
    required this.titleColor,
    required this.titleSize,
    required this.body,
    required this.bodyColor,
    required this.bodySize,
    required this.radius,
    required this.pLeft,
    required this.pRight,
    required this.pTop,
    required this.pBottom,

    /*required this.onPressedLeftBtn,
    required this.textColorLeftBtn,
    required this.textLeftBtn,
    required this.textSizeLeftBtn,
    required this.colorLeftBtn,
    this.iconLeftBtn,
    required this.radiusBtn,
    required this.onPressedRightBtn,
    required this.textColorRightBtn,
    required this.textRightBtn,
    required this.textSizeRightBtn,
    required this.colorRightBtn,
    this.iconRightBtn*/

     this.action

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
      title:  Text(title,
        style:TextStyle(fontSize: titleSize, color: titleColor, fontWeight: FontWeight.w700, fontFamily: "Inter"), textAlign: TextAlign.center,),
      content: Text(body,
        style:TextStyle(fontSize: bodySize, color: bodyColor, fontWeight: FontWeight.w400, fontFamily: "Inter"), textAlign: TextAlign.center,),
      actionsPadding: EdgeInsets.fromLTRB(pRight, pTop, pRight, pBottom),
      actions: action
    );
  }
}


