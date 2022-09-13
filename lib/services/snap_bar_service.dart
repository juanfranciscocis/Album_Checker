import 'package:flutter/material.dart';

class SnapBarService{

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message){

    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );

    messengerKey.currentState!.showSnackBar(snackBar);


  }




}