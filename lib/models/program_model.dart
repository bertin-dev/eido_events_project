

class ProgramModel{

  String title;
  String location;
  String startDate;
  String? endDate;
  int? amount;
  String? unity;
  bool? isPackage;
  String? img;
  bool? isChecked;

  ProgramModel({
    required this.title,
    required this.location,
    required this.startDate,
    this.endDate,
    this.amount,
    this.unity,
    this.isPackage,
    this.img,
    this.isChecked = false
});


}