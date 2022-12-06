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

  bool isCoolSelected = true;
  int coolTemp = 18, heatTemp = 24;

  int get currentTemp => isCoolSelected ? coolTemp : heatTemp;

  void updateCoolSelectedTab(bool isCoolBtn) {
    if (isCoolBtn)
      isCoolSelected = true;
    else
      isCoolSelected = false;
    notifyListeners();
  }

  void updateTemp(int value) {
    if (isCoolSelected) {
      coolTemp += value;
    } else {
      heatTemp += value;
    }
    notifyListeners();
  }

  bool isShowTyre = false;

  Future<void> showTyreController(int index) async {
    if (selectedTabIndex != 3 && index == 3) {
      await Future.delayed(Duration(milliseconds: 400));
      if (selectedTabIndex == 3) {
        isShowTyre = true;
        notifyListeners();
      }
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }

  bool isShowTyreStatus = false;

  Future<void> tyreStatusController(int index) async {
    if (selectedTabIndex != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      await Future.delayed(Duration(milliseconds: 600));
      isShowTyreStatus = false;
      notifyListeners();
    }
  }
}
