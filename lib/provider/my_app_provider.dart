import 'package:flutter/material.dart';

class MyAppProvider extends ChangeNotifier {
  int weight = 0;
  bool isMale = true;
  int age = 0;
  double sliderValue = 0;

  void changeSliderValue(double val){
    sliderValue = val;
    notifyListeners();
  }
  
  void changeGender(bool x){
    isMale = x;
    notifyListeners();
  }

  void weightIncrement() {
    weight++;
    notifyListeners();
  }

  void weightDecrement() {
    weight--;
    notifyListeners();
  }

  void ageIncrement() {
    age++;
    notifyListeners();
  }

  void ageDecrement() {
    age--;
    notifyListeners();
  }
}
