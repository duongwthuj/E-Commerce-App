import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtils{

  // Hide Keyboard
  static void hideKeyboard(BuildContext context){
    FocusScope.of(context).unfocus();
  }

  // Check if device nằm ngang
  static bool isLandscapeOrientation(BuildContext context){
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // check if device nằm dọc
  static bool isPortraitOrientation(BuildContext context){
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  // Get Screen Width
  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  // Get Screen Height
  static double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }


  // check IOS
  static bool isIOS(){
    return Platform.isIOS;
  }

  // check Android
  static bool isAndroid(){
    return Platform.isAndroid;
  }


  // launch URL
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}