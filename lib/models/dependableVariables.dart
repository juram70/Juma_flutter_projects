import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DependableVariables extends ChangeNotifier{
   bool? _codeProvidedIsValid=false;



   void setCodeProvidedIsValid(bool? isValid){
     _codeProvidedIsValid= isValid ;
     notifyListeners();

   }
   bool get codeProvidedIsValid => _codeProvidedIsValid!;

}