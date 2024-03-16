class Result {
  final double height;
  final bool isMale;
  final double weight;
  final int age;
  Result({
    required this.height,
    required this.isMale,
    required this.weight,
    required this.age,
  });
  double getBMIvalue(){
    return (weight/(height*height));
  }
  String getBMIdescribe(){
    if(getBMIvalue()<16){
      return "Severe Thinness";
    }else if(getBMIvalue()>=16&&getBMIvalue()<17){
      return "Moderate Thinness";
    }
    else if(getBMIvalue()>=17&&getBMIvalue()<18.5){
      return "Mild Thinness";
    }else if(getBMIvalue()>=18.5&&getBMIvalue()<25){
      return "Normal";
    }else if(getBMIvalue()>=25&&getBMIvalue()<30){
      return "Overweight";
    }else if(getBMIvalue()>=30&&getBMIvalue()<35){
      return "Obese Class I";
    }else if(getBMIvalue()>=35&&getBMIvalue()<40){
      return "Obese Class II";
    }else {
      return "Obese Class III";
    }
  }
  String getBMIrange(){
    if(getBMIvalue()<16){
      return "less Than 16";
    }else if(getBMIvalue()>=16&&getBMIvalue()<17){
      return "16 - 17";
    }
    else if(getBMIvalue()>=17&&getBMIvalue()<18.5){
      return "17 - 18.5";
    }else if(getBMIvalue()>=18.5&&getBMIvalue()<25){
      return "18.5 - 25";
    }else if(getBMIvalue()>=25&&getBMIvalue()<30){
      return "25 - 30";
    }else if(getBMIvalue()>=30&&getBMIvalue()<35){
      return "30 - 35";
    }else if(getBMIvalue()>=35&&getBMIvalue()<40){
      return "35 - 40";
    }else {
      return "greater than 40";
    }
  }
}
