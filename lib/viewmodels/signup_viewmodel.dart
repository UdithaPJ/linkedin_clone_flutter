import 'package:flutter/material.dart';
import 'package:linkedin_clone_flutter/core/models/signup_model.dart';

class SignupViewModel extends ChangeNotifier {
  final SignupModel _signupData = SignupModel();
  int _stepsCompleted = 0;

  int get stepsCompleted => _stepsCompleted;
  SignupModel get signupData => _signupData;

  void updateName(String firstname, String lastname) {
    _signupData.firstname = firstname;
    _signupData.lastname = lastname;
    notifyListeners();
  }

  void updateEmail(String email) {
    _signupData.email = email;
    notifyListeners();
  }

  void nextStep() {
    _stepsCompleted++;
    notifyListeners();
  }

  void previousStep() {
    if (_stepsCompleted > 0) _stepsCompleted--;
    notifyListeners();
  }
}