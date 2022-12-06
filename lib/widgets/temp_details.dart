import 'package:flutter/material.dart';
import 'package:tesla_animated_app/constants.dart';
import 'package:tesla_animated_app/screens/home_controller.dart';

import 'temp_btn.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TempBtn(
                  svgSrc: 'assets/icons/coolShape.svg',
                  isActive: controller.isCoolSelected,
                  title: 'Cool',
                  onTap: () => controller.updateCoolSelectedTab(true),
                  activeColor: primaryColor),
              SizedBox(width: defaultPadding),
              TempBtn(
                  svgSrc: 'assets/icons/heatShape.svg',
                  isActive: !controller.isCoolSelected,
                  title: 'Heat',
                  onTap: () => controller.updateCoolSelectedTab(false),
                  activeColor: redColor),
            ],
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                onPressed: () => controller.updateTemp(1),
                padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_drop_up, size: 48),
              ),
              Text('${controller.currentTemp}' + '°C',
                  style: TextStyle(fontSize: 86)),
              IconButton(
                onPressed: () => controller.updateTemp(-1),
                padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_drop_down, size: 48),
              ),
            ],
          ),
          Spacer(),
          Text('Current Temperature'.toUpperCase()),
          SizedBox(height: defaultPadding),
          SizedBox(
            height: 120,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Inside'.toUpperCase()),
                    Text('20°C', style: Theme.of(context).textTheme.headline5),
                  ],
                ),
                SizedBox(width: defaultPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Outside'.toUpperCase(),
                        style: TextStyle(color: Colors.white54)),
                    Text('35°C',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white54)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
