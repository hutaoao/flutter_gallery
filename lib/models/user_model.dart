import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier{
  int counter = 0;

  void add() {
    counter++;
    notifyListeners();
    print(counter);
  }
}
