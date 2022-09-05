

import 'dart:convert';

import 'package:album_checker/models/models.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginFirebaseService extends ChangeNotifier {


  //PROPERGTIES
  bool _isLoading = false;
  bool _isLogin = false;

  //getters
  bool getIsLoading() => _isLoading;
  bool getIsLogin() => _isLogin;



  //METHODS
  Future login(Login login) async {
    _isLoading = true;
    //LOGIN USING EMAIL AND PASSWORD
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCyVW8X_u9i7ZG4wzmfcRiRp2paqR7tu_I');
    final response = await http.post(url, body: login.toJson());
    final decodedData = json.decode(response.body);
    login.idToken = await decodedData['idToken'];

    if(login.idToken != null) {
      print('Login Successfull...');
      print('ID TOKEN: ${login.idToken}');
      _isLogin = true;
    } else {
      print('Login Failed...');
      _isLogin = false;
      return;
    }

    //GET USER DATA, DISPLAY NAME
    final url2 = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyCyVW8X_u9i7ZG4wzmfcRiRp2paqR7tu_I');
    final response2 = await http.post(url2, body: login.toJson());
    final decodedData2 = json.decode(response2.body);
    login.displayName = await decodedData2['users'][0]['displayName'];

    _isLoading = false;



    return decodedData['idToken'];
  }

  Future register(Login login) async {
    _isLoading = true;
    //CREATING ACCOUNT WITH MAIL AND PASSWORD
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCyVW8X_u9i7ZG4wzmfcRiRp2paqR7tu_I');
    final response = await http.post(url, body: login.toJson());
    final decodedData = json.decode(response.body);
    login.idToken = await decodedData['idToken'];

    //UPDATING ACCOUNT WITH DISPLAY NAME
    final url2 = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyCyVW8X_u9i7ZG4wzmfcRiRp2paqR7tu_I');
    final response2 = await http.post(url2, body: login.toJson());
    final decodedData2 = json.decode(response2.body);

    _isLoading = false;

    return decodedData['idToken'];
  }




}