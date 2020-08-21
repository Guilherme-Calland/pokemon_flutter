import 'package:flutter/material.dart';

class SharedData extends ChangeNotifier{
  String userName = "";
  changeUserName(String value){
    userName = value;
    notifyListeners();
  }
}