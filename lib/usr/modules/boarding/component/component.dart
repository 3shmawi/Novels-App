import 'package:flutter/material.dart';
import 'package:novels/models/boarding.dart';

import '../../../../utilities/shared/colors/default_app_color.dart';


class DefaultBoardingItem extends StatelessWidget {
  const DefaultBoardingItem({required this.boardingModel,Key? key}) : super(key: key);

  final BoardingModel boardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            boardingModel.image,
            height: 2000,
            width: 1000,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          boardingModel.title,
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'MyFont',
            color: defaultColor,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          boardingModel.body,
          style: TextStyle(
            fontSize: 14.0,
            color: defaultColor,
            fontFamily: 'MyFont',
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
