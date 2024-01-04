import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class States extends ChangeNotifier{
  bool _isLoggedIn=false;

  bool get isLoggedIn=> _isLoggedIn;
  Future<void> setIsloggeIn(bool value)async{
    final SharedPreferences pref= await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', value);
  }
Future<bool?> getisLoggedIn()async{
    try{
      final SharedPreferences pref= await SharedPreferences.getInstance();
      print(pref.getBool('isLoggedIn'));
      return pref.getBool('isLoggedIn');
    }catch(e){
      print(e);
    }

}
}