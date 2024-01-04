import 'package:dharura_barabarani/models/states.dart';
import 'package:dharura_barabarani/models/user_inputs.dart';
import 'package:dharura_barabarani/screens/account_setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:dharura_barabarani/models/user_inputs.dart';

import '../screens/verification_screen.dart';

class Authentication extends ChangeNotifier {
  String? _verificationId;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<dynamic> createUser(String? phoneNumber, BuildContext context) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+255$phoneNumber'.trim(),
      verificationCompleted: (PhoneAuthCredential credential) {
        _firebaseAuth.signInWithCredential(credential).then((value) {
          Provider.of<States>(context,listen: false).setIsloggeIn(true);
          print('${value} verification complete');
        });
        print('User criated');
        Navigator.pushNamed(context, AccountSetting.id);
      },
      verificationFailed: (e) {
        print('there was an error during verifying mobile number');
      },
      codeSent: (String verificationId, int? resendToken) {
        // PhoneAuthCredential credential= PhoneAuthProvider.credential(verificationId: verificationId, smsCode: _smsCode.toString());
        // _firebaseAuth.signInWithCredential(credential).then((value) {print('user signed in');});
        // print(credential);
        _verificationId = verificationId;
        Navigator.pushNamed(context, PhoneNumberVerificationScreen.id);
        print('heyyyyyy is${resendToken}');
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (verificationId) => {print('time out')},
    );
  }

  Future<void> verifyOtp(
    BuildContext context,
  ) async {
    String smsCode = context.read<UserInputs>().verificationCode;
    try {
      PhoneAuthCredential credintial = PhoneAuthProvider.credential(
          verificationId: _verificationId.toString(),
          smsCode: smsCode.toString());
      _firebaseAuth.signInWithCredential(credintial).then((value) {

        Navigator.pushNamed(context, AccountSetting.id);
      });
    } catch (e) {
      print("there is an error");
    }
  }
}
