import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier{
  GlobalKey<ScaffoldState> myKey = GlobalKey();
  bool themeIsDark = false;

  void changeTheme() {
    themeIsDark = !themeIsDark;
    notifyListeners();
  }

}