import 'package:flutter/material.dart';

class TextViewModel extends ChangeNotifier{
  int counter = 0;

  void add() {
    counter++;
    notifyListeners();
  }
}
