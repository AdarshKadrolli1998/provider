import 'package:flutter/material.dart';

class Calc extends ChangeNotifier{
  // ignore: non_constant_identifier_names
  var BMIResult;
  var weight;

  var height;
  double get getCounter {
    return BMIResult;
  }


  // ignore: non_constant_identifier_names
  void CalculateBmi(double myWeight, double myHeight){
      double weight = myWeight;
      double height = myHeight;
      var mass = weight*10000;
      var height1 = height * 30.48;
      var heightSquare = height1 * height1;
      BMIResult = mass / heightSquare;
      notifyListeners();
  }

}