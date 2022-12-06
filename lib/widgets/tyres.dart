import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Widget> tyres(BoxConstraints constraints) {
  return [
    Positioned(
      left: constraints.maxWidth * 0.17,
      top: constraints.maxHeight * 0.22,
      child: SvgPicture.asset('assets/icons/FL_Tyre.svg'),
    ),
    Positioned(
      right: constraints.maxWidth * 0.17,
      top: constraints.maxHeight * 0.22,
      child: SvgPicture.asset('assets/icons/FL_Tyre.svg'),
    ),
    Positioned(
      left: constraints.maxWidth * 0.17,
      bottom: constraints.maxHeight * 0.27,
      child: SvgPicture.asset('assets/icons/FL_Tyre.svg'),
    ),
    Positioned(
      right: constraints.maxWidth * 0.17,
      bottom: constraints.maxHeight * 0.27,
      child: SvgPicture.asset('assets/icons/FL_Tyre.svg'),
    ),
  ];
}
