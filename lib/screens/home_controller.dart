import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedTabIndex = 0;

  // left, right, top, down
  List<bool> isDoorLockList = [false, false, false, false];

  void onBottomNavigationTabChange(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  void updateDoorLock(int index) {
    isDoorLockList[index] = !isDoorLockList[index];
    notifyListeners();
  }
}
