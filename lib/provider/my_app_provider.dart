
import 'package:flutter/material.dart';

class MyAppProvider extends ChangeNotifier{
  int weight = 0;
  bool isMale = true;
  int age = 0;
  double sliderValue = 0;

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