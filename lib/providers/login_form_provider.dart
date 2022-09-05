
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  //PROPERTIES
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  bool isLoading = false;



  //METHODS
  bool isValidForm(){

    print('LOGIN IS : ${formKey.currentState?.validate()}');
    print('EMAIL IS : $email');
    print('PASSWORD IS : $password');


    return formKey.currentState?.validate() ?? false;
  }

  //getters
  GlobalKey<FormState> getFormKey() => formKey;
  String getName() => name;
  String getEmail() => email;
  String getPassword() => password;
  bool getIsLoading() => isLoading;


  //setters
  void setName(String value) {
    name = value;
    notifyListeners();
  }
  void setEmail(String email){
    this.email = email;
    notifyListeners();
  }
  void setPassword(String password){
    this.password = password;
    notifyListeners();
  }
  void setIsLoading(bool isLoading){
    this.isLoading = isLoading;
    notifyListeners();
  }

}