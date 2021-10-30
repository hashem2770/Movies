import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movie_getx/Views/Main-screen/Playing-now.dart';
import 'package:movie_getx/Views/Main-screen/Popular.dart';
import 'package:movie_getx/Views/Main-screen/TopRated.dart';

class NavController extends GetxController{
  int _navigatorValue=0;
  int get navigatorValue => _navigatorValue;

  Widget _currentScreen=Popular();
  Widget get currentScreen => _currentScreen;

  void changeSelectedValue(int index){
    _navigatorValue = index;
    switch(index){
      case 0:
        _currentScreen = Popular();
        break;
      case 1:
        _currentScreen=PlayingNow();
        break;
      case 2 :
        _currentScreen = TopRated();
        break;
    }
    update();
  }
}