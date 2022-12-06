import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_animated_app/constants.dart';
import 'package:tesla_animated_app/screens/home_controller.dart';
import 'package:tesla_animated_app/widgets/battery_status.dart';
import 'package:tesla_animated_app/widgets/door_lock_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var controller = HomeController();

  late AnimationController batteryAnimationController;
  late Animation<double> animationBattery;
  late Animation<double> animationBatteryStatus;

  void setupBatteryAnimation() {
    batteryAnimationController =
        AnimationController(vsync: this, duration: defaultDuration * 2);

    animationBattery = CurvedAnimation(
        parent: batteryAnimationController, curve: Interval(0.0, 0.5));

    animationBatteryStatus = CurvedAnimation(
        parent: batteryAnimationController, curve: Interval(0.6, 1));
  }

  @override
  void initState() {
    setupBatteryAnimation();
    super.initState();
  }

  @override
  void dispose() {
    batteryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([controller, batteryAnimationController]),
        builder: (context, _) {
          print(animationBattery.value);
          return Scaffold(
            bottomNavigationBar:
                TeslaBottomNavigationBar(controller.selectedTabIndex, (i) {
              if (i == 1)
                batteryAnimationController.forward();
              else if (controller.selectedTabIndex == 1 && i != 1)
                batteryAnimationController.reverse(from: 0.7);
              controller.onBottomNavigationTabChange(i);
            }),
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
                  AnimatedPositioned(
                      duration: defaultDuration,
                      left: controller.selectedTabIndex == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        opacity: controller.selectedTabIndex == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: DoorLockButton(controller.isDoorLockList[0],
                            () => controller.updateDoorLock(0)),
                      )),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      right: controller.selectedTabIndex == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        opacity: controller.selectedTabIndex == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: DoorLockButton(controller.isDoorLockList[1],
                            () => controller.updateDoorLock(1)),
                      )),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      top: controller.selectedTabIndex == 0
                          ? constraints.maxHeight * 0.13
                          : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        opacity: controller.selectedTabIndex == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: DoorLockButton(controller.isDoorLockList[2],
                            () => controller.updateDoorLock(2)),
                      )),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: controller.selectedTabIndex == 0
                          ? constraints.maxHeight * 0.13
                          : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        opacity: controller.selectedTabIndex == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: DoorLockButton(controller.isDoorLockList[3],
                            () => controller.updateDoorLock(3)),
                      )),
                  Opacity(
                    opacity: animationBattery.value,
                    child: SvgPicture.asset('assets/icons/Battery.svg',
                        width: constraints.maxWidth * 0.45),
                  ),
                  Positioned(
                    top: 50 * (1 - animationBatteryStatus.value),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Opacity(
                        opacity: animationBatteryStatus.value,
                        child: BatteryStatus(constraints)),
                  )
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
