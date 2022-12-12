import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  final IconData iconData;
  final GestureTapCallback onTap;
  final Color color;
  final Color? backgroundColor;
  final double size;

  const DefaultIconButton({
    Key? key,
    required this.onTap,
    required this.iconData,
    this.color = Colors.blueAccent,
    this.backgroundColor,
    this.size = 17,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(99),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black.withOpacity(.05),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Icon(
              iconData,
              size: w / size,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
