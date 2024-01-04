import 'package:dharura_barabarani/screens/phone_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:dharura_barabarani/widgets/buddyButton.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  static const String id = 'startScreen';

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/start_screen_image.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Image(
                        image: AssetImage('images/logo.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Your lifeline on the road',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),

                          child: BuddyButton(
                            buttonText: 'Get started',
                            textColor: Colors.white,
                            buttonColor:Colors.lightBlueAccent,
                            onPressed: () {
                              Navigator.pushNamed(context, PhoneNumberScreen.id);
                            },
                          ),
                        ),


                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
