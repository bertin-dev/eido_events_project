

import 'package:flutter/cupertino.dart';


class Privilege {
  final String name;
  final Widget icon;
  late final bool isChecked;

  Privilege(this.name, this.icon, this.isChecked);

  // Creating the getter method
  // to get input from Field/Property
  bool get getIsChecked{
    return isChecked;
  }

  // Creating the setter method
  // to set the input in Field/Property
  set setIsChecked(bool selected) {
    isChecked = selected;
  }


}