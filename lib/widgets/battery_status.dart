import 'package:flutter/material.dart';
import 'package:tesla_animated_app/constants.dart';

class BatteryStatus extends StatelessWidget {
  BatteryStatus(this.constraints);

  BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Text('220 mi',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.white)),
        Text('62%', style: TextStyle(fontSize: 24)),
        Spacer(),
        Text('Charging'.toUpperCase(), style: TextStyle(fontSize: 20)),
        Text('18 min remaining', style: TextStyle(fontSize: 20)),
        SizedBox(height: constraints.maxHeight * 0.14),
        DefaultTextStyle(
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(' 22 mi/hr'),
              Text('232 v '),
            ],
          ),
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
