import 'dart:core';
import 'package:dharura_barabarani/models/user_inputs.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class Validation extends ChangeNotifier{
   bool _hasError=false;
  void setHasError(bool? value){
    _hasError=value!;
    notifyListeners();
  }
  bool get hasError => _hasError;
  RegExp regExp=RegExp(r'^[6|7]\d{8}',caseSensitive: false);
   String? phoneNumberValidation(String? value){
    if( value== null || value.isEmpty){
      return 'Please Enter mobile number!';
    }else if(!regExp.hasMatch(value)){
      return "Enter valid mobile number!";
    }
    return null;
  }

 final RegExp _regExp=RegExp(r'\d{4}',caseSensitive: false);

   bool? verificationCode(BuildContext context,String? code){
     if(!_regExp.hasMatch(code.toString())){
       return false;
     }
     context.read<UserInputs>().setVerificationCode(code);
     return true;
   }
   RegExp wordRegExp=RegExp(r'[A-Za-z]');
   String? wordsValidations(String? value){
     
   }
}