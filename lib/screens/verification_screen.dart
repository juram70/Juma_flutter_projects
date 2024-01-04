import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dharura_barabarani/models/authentications.dart';
import 'package:dharura_barabarani/utilities/constants.dart';
import 'package:dharura_barabarani/widgets/buddyButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:dharura_barabarani/models/user_inputs.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:dharura_barabarani/models/validations.dart';
import 'package:dharura_barabarani/models/dependableVariables.dart';

class PhoneNumberVerificationScreen extends StatefulWidget {
  PhoneNumberVerificationScreen({Key? key}) : super(key: key);
  static const String id = 'PhoneNumberVerificationScreen';

  @override
  State<PhoneNumberVerificationScreen> createState() =>
      _PhoneNumberVerificationScreenState();
}

class _PhoneNumberVerificationScreenState
    extends State<PhoneNumberVerificationScreen> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String phoneNumber = (context.read<UserInputs>().phoneNumber);
    bool? isValidFromModel =
        context.watch<DependableVariables>().codeProvidedIsValid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30.0,
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Text(
                  'Verify with code sent to  ***** ${phoneNumber.substring(7)}',
                  textAlign: TextAlign.left,
                  style: kTitles,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Flexible(

                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  focusNode: focusNode,
                  controller: controller,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true),
                  ],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeColor: Colors.lightBlueAccent,
                    inactiveColor: Colors.blueGrey,
                    selectedColor: Colors.lightBlueAccent,
                    disabledColor: Colors.lightBlueAccent,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    var isValid = context
                        .read<Validation>()
                        .verificationCode(context, value);
                    context
                        .read<DependableVariables>()
                        .setCodeProvidedIsValid(isValid);
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              BuddyButton(
                buttonText: 'Verify',
                buttonColor: Colors.lightBlueAccent,
                textColor: Colors.white,
                onPressed: isValidFromModel!
                    ? () async{
                        setState(() {
                          controller.clear();
                        });
                        await context.read<Authentication>().verifyOtp(context);
                      }
                    : () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.topSlide,
                          title: 'Empty or invalid code',
                          desc: 'Please enter valid code',
                          titleTextStyle: kTitles,
                          descTextStyle: kDescriptionTextStyle,
                          btnCancel: null,
                          btnOkColor: Colors.red,
                          btnOkOnPress: () {
                            setState(() {
                              controller.clear();
                            });
                          },
                        ).show();
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
