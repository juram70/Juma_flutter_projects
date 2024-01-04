import 'package:flutter/material.dart';

class ResponsiveUi extends StatelessWidget {
  const ResponsiveUi({Key? key, required this.mobile,required this.tabScreen}) : super(key: key);

  final Widget mobile;
  final Widget tabScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,screensSize){
      if(screensSize.maxWidth>320){
        return tabScreen;
      }
      else{
        return mobile;
      }
    })  ;
  }
}
