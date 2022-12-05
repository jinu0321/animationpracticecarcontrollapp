import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_animated_app/constants.dart';

class DoorLockButton extends StatelessWidget {
  DoorLockButton(this.isLocked, this.onTap);

  bool isLocked;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        switchInCurve: Curves.easeInOutBack,
        switchOutCurve: Curves.easeInOutBack,
        child: isLocked
            ? SvgPicture.asset('assets/icons/door_lock.svg',
                key: ValueKey('lock'))
            : SvgPicture.asset('assets/icons/door_unlock.svg',
                key: ValueKey('unlock')),
      ),
    );
  }
}
