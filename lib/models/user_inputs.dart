import 'package:flutter/cupertino.dart';

class UserInputs extends ChangeNotifier{
  String? _phoneNumber;
  String? _verificationCode;
  void setVerificationCode(String? verCode){
    _verificationCode=verCode;
  }
  void setPhoneNumber(String? phoneNumber){
    _phoneNumber=phoneNumber;
  }
  String get verificationCode => _verificationCode.toString();
  String get phoneNumber => _phoneNumber.toString();
}