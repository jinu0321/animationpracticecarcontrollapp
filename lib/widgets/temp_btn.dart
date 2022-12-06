import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_animated_app/constants.dart';

class TempBtn extends StatelessWidget {
  TempBtn(
      {Key? key,
      required this.svgSrc,
      required this.title,
      this.isActive = false,
      required this.onTap,
      required this.activeColor})
      : super(key: key);

  final String svgSrc, title;
  final bool isActive;
  final VoidCallback onTap;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOutBack,
              height: isActive ? 76 : 50,
              width: isActive ? 76 : 50,
              child: SvgPicture.asset(svgSrc,
                  color: isActive ? activeColor : Colors.white38)),
          SizedBox(height: defaultPadding / 2),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
                fontSize: 16,
                color: isActive ? activeColor : Colors.white38,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
            child: Text(title.toUpperCase()),
          )
        ],
      ),
    );
  }
}
