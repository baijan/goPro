import 'package:flutter/material.dart';

class Countik extends ChangeNotifier {
  int cifra = 0;

  void goPro() {
    notifyListeners();
  }
}