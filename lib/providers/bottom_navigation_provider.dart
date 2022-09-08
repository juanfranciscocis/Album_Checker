

import 'package:flutter/cupertino.dart';

class NavigationProvider with ChangeNotifier{
  int _currentPage = 0;
  String _currentPageWidget = '/home';




  //GETTER AND SETTER
  String get page => this._currentPageWidget;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;

    if(value == 0){
      _currentPageWidget = '/home';
    }else if(value == 1){
      _currentPageWidget = '/unchecked';
    }else{
      _currentPageWidget = '/profile';
    }
    notifyListeners();
  }
}