import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedTabIndex = 0;

  // left, right, top, down
  List<bool> isDoorLockList = [false, false, false, false];

  void onTabChange(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  void updateDoorLock(int index) {
    isDoorLockList[index] = !isDoorLockList[index];
    notifyListeners();
  }
}
