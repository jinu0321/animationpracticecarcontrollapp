import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_animated_app/constants.dart';
import 'package:tesla_animated_app/screens/home_controller.dart';
import 'package:tesla_animated_app/widgets/door_lock_button.dart';

class HomeScreen extends StatelessWidget {
  var controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigationBar(
                controller.selectedTabIndex, controller.onTabChange),
            body:
                SafeArea(child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.1),
                      child: SvgPicture.asset('assets/icons/Car.svg',
                          width: double.infinity)),
                  Positioned(
                      left: constraints.maxWidth * 0.05,
                      child: DoorLockButton(controller.isDoorLockList[0],
                          () => controller.updateDoorLock(0))),
                  Positioned(
                      right: constraints.maxWidth * 0.05,
                      child: DoorLockButton(controller.isDoorLockList[1],
                          () => controller.updateDoorLock(1))),
                  Positioned(
                      top: constraints.maxHeight * 0.13,
                      child: DoorLockButton(controller.isDoorLockList[2],
                          () => controller.updateDoorLock(2))),
                  Positioned(
                      bottom: constraints.maxHeight * 0.17,
                      child: DoorLockButton(controller.isDoorLockList[3],
                          () => controller.updateDoorLock(3))),
                ],
              );
            })),
          );
        });
  }
}

class TeslaBottomNavigationBar extends StatelessWidget {
  TeslaBottomNavigationBar(this.selectedTabIndex, this.onTap);

  int selectedTabIndex;
  ValueChanged<int> onTap;

  List<String> navIconSrc = [
    'assets/icons/Lock.svg',
    'assets/icons/Charge.svg',
    'assets/icons/Temp.svg',
    'assets/icons/Tyre.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      items: [
        for (int i = 0; i < navIconSrc.length; i++)
          BottomNavigationBarItem(
              icon: SvgPicture.asset(navIconSrc[i],
                  color: selectedTabIndex == i ? primaryColor : Colors.white54),
              label: ''),
      ],
    );
  }
}
