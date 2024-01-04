import 'package:dharura_barabarani/models/authentications.dart';
import 'package:dharura_barabarani/screens/phone_number_screen.dart';
import 'package:dharura_barabarani/models/user_inputs.dart';
import 'package:dharura_barabarani/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
import 'package:flutter/services.dart' as service;
import 'package:provider/provider.dart';
import 'package:dharura_barabarani/models/validations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dharura_barabarani/models/dependableVariables.dart';
import 'package:dharura_barabarani/screens/account_setup.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:dharura_barabarani/models/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance
      // Your personal reCaptcha public key goes here:
      .activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
  service.SystemChrome.setPreferredOrientations([
    service.DeviceOrientation.portraitUp,
    service.DeviceOrientation.portraitDown
  ]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Validation>(create: (context) => Validation()),
    ChangeNotifierProvider<Authentication>(
        create: (context) => Authentication()),
    ChangeNotifierProvider<UserInputs>(create: (context) => UserInputs()),
    ChangeNotifierProvider<DependableVariables>(
        create: (context) => DependableVariables()),
    ChangeNotifierProvider<States>(create: (context) => States()),
  ], child: App()));
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
        future: Provider.of<States>(context, listen: false).getisLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            bool? isLoggedIn = snapshot.data ?? false;
            return MaterialApp(
              theme: ThemeData.light().copyWith(
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(fontFamily: 'Roboto'),
                  bodyMedium: TextStyle(fontFamily: 'Roboto'),
                  bodySmall: TextStyle(fontFamily: 'Roboto'),
                ),
              ),
              initialRoute: isLoggedIn ? AccountSetting.id : StartScreen.id,
              routes: {
                StartScreen.id: (context) => const StartScreen(),
                PhoneNumberScreen.id: (context) => PhoneNumberScreen(),
                PhoneNumberVerificationScreen.id: (context) =>
                    PhoneNumberVerificationScreen(),
                AccountSetting.id: (context) => const AccountSetting(),
              },
            );
          } else {
            return Container();
          }
        });
  }
}
