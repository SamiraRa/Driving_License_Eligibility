import 'package:flutter/material.dart';

class EligibilityScreenProvider extends ChangeNotifier{

   String _message = 'You have not given any input';

   bool _isEligibile = false;

    String get message => _message;

    bool get isEligibile => _isEligibile;

  void checkEligibility(int age){
    if(age>=18){
      eligible();
      notifyListeners();
    }
    else{
      notEligible();
      notifyListeners();
    }
  }

  void eligible() {
    _isEligibile = true;
    _message = "You are eligible to apply for driving license";
  }

  void notEligible() {
    _isEligibile = false;
    _message = "You are not eligible to apply for driving license";
  }
  
}