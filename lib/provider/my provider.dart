import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

  int selectedIndex = 0;

   changeIndex(index)
   {
    selectedIndex = index;
    notifyListeners();
   }
}