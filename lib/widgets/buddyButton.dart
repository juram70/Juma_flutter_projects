import 'package:flutter/material.dart';


class BuddyButton extends StatelessWidget {

  final String buttonText;
  final Color buttonColor, textColor;
  final onPressed;
  const BuddyButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(backgroundColor: buttonColor),
      child: Padding(
        padding: screenWidth>=600.0? const EdgeInsets.all(20.0): const EdgeInsets.all(8.0),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
