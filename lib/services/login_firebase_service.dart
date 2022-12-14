

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
  String errorMessage = '';

  //getters
  bool getIsLoading() => _isLoading;
  bool getIsLogin() => _isLogin;
  bool getIsRegister() => _isRegister;
  String getErrorMessage() => errorMessage;



  //METHODS
  Future login(Login login) async {
    _isLoading = true;
    //LOGIN USING EMAIL AND PASSWORD
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBn5lfux3QfXX67_aV2Kax1YCzpfJO7Pq4');
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
      errorMessage = decodedData['error']['message'];
      _isLogin = false;
      return;
    }

    //GET USER DATA, DISPLAY NAME
    final url2 = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyBn5lfux3QfXX67_aV2Kax1YCzpfJO7Pq4');
    final response2 = await http.post(url2, body: login.toJson());
    final decodedData2 = json.decode(response2.body);
    login.displayName = await decodedData2['users'][0]['displayName'];

    _isLoading = false;



    return decodedData['idToken'];
  }

  Future register(Login login) async {
    _isLoading = true;
    //CREATING ACCOUNT WITH MAIL AND PASSWORD
    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBn5lfux3QfXX67_aV2Kax1YCzpfJO7Pq4');
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
      errorMessage = decodedData['error']['message'];
      _isRegister = false;
      return;
    }
    
    //UPDATING ACCOUNT WITH DISPLAY NAME
    final url2 = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyBn5lfux3QfXX67_aV2Kax1YCzpfJO7Pq4');
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