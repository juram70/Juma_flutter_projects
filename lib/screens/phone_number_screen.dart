import 'package:dharura_barabarani/models/dependableVariables.dart';
import 'package:dharura_barabarani/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:dharura_barabarani/models/validations.dart';
import 'package:dharura_barabarani/utilities/constants.dart';
import 'package:dharura_barabarani/widgets/buddyButton.dart';
import 'package:dharura_barabarani/models/authentications.dart';
import 'package:dharura_barabarani/models/user_inputs.dart';

class PhoneNumberScreen extends StatefulWidget {
  PhoneNumberScreen({Key? key}) : super(key: key);
  static const String id = 'PhoneNumberScreen';

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? controller = TextEditingController();

  FocusNode? focusNode;
  @override
  void initState() {
    // TODO: implement initState
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  const Flexible(
                    child: Text(
                      'Enter your mobile number to get OTP',
                      style: kTitles,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Focus(
                          focusNode: focusNode,
                          child: TextFormField(
                            controller: controller,
                            autofocus: true,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            validator: (value) => context
                                .read<Validation>()
                                .phoneNumberValidation(value),
                            decoration: kPhoneInputDecoration.copyWith(
                                labelStyle: TextStyle(
                              color: context.watch<Validation>().hasError
                                  ? Colors.red
                                  : Colors.lightBlueAccent,
                            )),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter(RegExp(r'[0-9]'),
                                  allow: true),
                            ],
                            onChanged: (value) {
                              context.read<UserInputs>().setPhoneNumber(value);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        BuddyButton(
                            buttonText: 'Get OTP',
                            buttonColor: Colors.lightBlueAccent,
                            textColor: Colors.white,
                            onPressed: () async {
                              // controller.clear();

                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                context.read<Validation>().setHasError(false);
                                try{
                                await context.read<Authentication>().createUser(
                                    context.read<UserInputs>().phoneNumber,context);}
                                    catch(e){
                                  print('Tatizo $e');
                                    }
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );


                                  return;
                                } else {
                                  return;
                                }
                              }
                              context.read<Validation>().setHasError(true);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
