import 'package:flutter/material.dart';

class DefaultHeadButton extends StatelessWidget {
  const DefaultHeadButton({
    required this.iconData,
    required this.text,
    this.onTap,
    this.fontSize = 14,
    this.iconSize = 20,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final String text;
  final double iconSize;
  final double fontSize;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.grey[200],
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.red, fontSize: fontSize),
                ),
                Icon(
                  iconData,
                  size: iconSize,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
