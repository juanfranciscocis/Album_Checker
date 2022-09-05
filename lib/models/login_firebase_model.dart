// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

class Login extends ChangeNotifier{


  String email;
  String password;
  bool returnSecureToken = true;

  String? idToken;
  String? displayName;

  Login({
    required this.email,
    required this.password,
    this.displayName,
  });

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
    email: json["email"],
    password: json["password"],
    displayName: json["displayName"],
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "password": password,
    "returnSecureToken": returnSecureToken,
    "idToken": idToken,
    "displayName": displayName,
  };





}
