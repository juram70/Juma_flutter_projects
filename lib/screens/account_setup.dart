import 'package:dharura_barabarani/utilities/constants.dart';
import 'package:flutter/material.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);

  static const String id = "AccountSetting";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
                child: Flexible(
                  child: Text(
                    'Basic Info?',
                    style: kTitles.copyWith(fontSize: 40.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Flexible(
                child:  Text(
                  'Enter your information to finish set up your Account',
                  softWrap: true,
                  style: TextStyle(color: Colors.black54, fontSize: 18.0),
                ),
              ),
              const Form(child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(

                  )
                ],
              )
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
