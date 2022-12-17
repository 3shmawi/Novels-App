import 'package:flutter/material.dart';
import 'package:novels/utilities/shared/colors/default_app_color.dart';

class DefaultNoData extends StatelessWidget {
  const DefaultNoData({
    this.height = 260,
    this.text = 'data',
    Key? key,
  }) : super(key: key);

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty.png',
            ),
            Text(
              'No $text yet!       ',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: defaultColor),
            ),
          ],
        ),
      ),
    );
  }
}
