

import 'dart:convert';

import 'package:album_checker/models/models.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginFirebaseService extends ChangeNotifier {


  //PROPERGTIES
  final storage = const FlutterSecureStorage();
  bool _isLoading = false;
  bool _isLogin = false;
  bool _isRegister = false;

  //getters
  bool getIsLoading() => _isLoading;
  bool getIsLogin() => _isLogin;
  bool getIsRegister() => _isRegister;



  //METHODS
  Future login(Login login) async {
    _isLoading = true;
    //LOGIN USING EMAIL AND PASSWORD
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyC2zdIgvMCVTGuxUBBLStCa5FAG0FVHoeQ');
    final response = await http.post(url, body: login.toJson());
    final decodedData = json.decode(response.body);
    login.idToken = await decodedData['idToken'];

    if(login.idToken != null) {
      print('Login Successfull...');
      print('ID TOKEN: ${login.idToken}');
      await storage.write(key: 'token', value: login.idToken);
      _isLogin = true;
    } else {
      print('Login Failed...');
      _isLogin = false;
      return;
    }

    //GET USER DATA, DISPLAY NAME
    final url2 = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyC2zdIgvMCVTGuxUBBLStCa5FAG0FVHoeQ');
    final response2 = await http.post(url2, body: login.toJson());
    final decodedData2 = json.decode(response2.body);
    login.displayName = await decodedData2['users'][0]['displayName'];

    _isLoading = false;



    return decodedData['idToken'];
  }

  Future register(Login login) async {
    _isLoading = true;
    //CREATING ACCOUNT WITH MAIL AND PASSWORD
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyC2zdIgvMCVTGuxUBBLStCa5FAG0FVHoeQ');
    final response = await http.post(url, body: login.toJson());
    final decodedData = json.decode(response.body);
    login.idToken = await decodedData['idToken'];

    if(login.idToken != null) {
      print('Register Successfull...');
      print('ID TOKEN: ${login.idToken}');
      await storage.write(key: 'token', value: login.idToken);
      _isRegister = true;
    } else {
      print('Register Failed...');
      _isRegister = false;
      return;
    }
    
    //UPDATING ACCOUNT WITH DISPLAY NAME
    final url2 = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyC2zdIgvMCVTGuxUBBLStCa5FAG0FVHoeQ');
    final response2 = await http.post(url2, body: login.toJson());
    final decodedData2 = json.decode(response2.body);

    _isLoading = false;

    return decodedData['idToken'];
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {

    return await storage.read(key: 'token') ?? '';

  }





}