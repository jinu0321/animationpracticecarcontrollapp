import 'package:flutter/material.dart';
import 'package:tesla_animated_app/constants.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard(
      {Key? key,
      required this.isBottom,
      required this.tyrePsi,
      required this.temp,
      required this.isLowPressure})
      : super(key: key);

  final bool isBottom;
  final double tyrePsi;
  final int temp;
  final bool isLowPressure;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isLowPressure ? redColor.withOpacity(0.1) : Colors.white10,
          border: Border.all(
              color: isLowPressure ? redColor : primaryColor, width: 2),
          borderRadius: BorderRadius.circular(6)),
      padding: EdgeInsets.all(defaultPadding),
      child: isBottom
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [logPressureText(context), Spacer(), psiText(context)])
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [psiText(context), Spacer(), logPressureText(context)]),
    );
  }

  Column psiText(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text.rich(TextSpan(
          text: '$tyrePsi',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          children: [TextSpan(text: 'psi', style: TextStyle(fontSize: 24))])),
      SizedBox(height: defaultPadding),
      Text('${temp}°C'),
    ]);
  }

  Widget logPressureText(BuildContext context) {
    if (!isLowPressure) return Container();

    return Column(children: [
      Text('LOW',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
      Text('Pressure'.toUpperCase(), style: TextStyle(fontSize: 20)),
    ]);
  }
}
