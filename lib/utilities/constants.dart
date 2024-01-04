import 'package:flutter/material.dart';

const kPhoneInputDecoration = InputDecoration(
  prefixText: '+255 | ',
  labelText: 'Enter your mobile number',

  prefixStyle: TextStyle(
    color: Colors.black,
    fontSize: 16,
  ),
  labelStyle: TextStyle(
    color: Colors.lightBlueAccent,
    fontSize: 18.0,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  hintText:'745321456',
  errorBorder:OutlineInputBorder(
    borderSide: BorderSide(
      color:Colors.red,
      width:2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedErrorBorder:OutlineInputBorder(
    borderSide: BorderSide(
      color:Colors.red,
      width:2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const kTitles=TextStyle(
  fontSize: 24.0,
  color: Colors.black,
  fontWeight: FontWeight.w900,
);
const kDescriptionTextStyle=TextStyle(
  fontSize: 18.0,
  color: Colors.black,
 fontWeight: FontWeight.w200,
);
// verification button constant
