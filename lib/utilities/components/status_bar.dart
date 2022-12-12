import 'dart:ui';

import 'package:flutter/material.dart';

class BlurTheStateBar extends StatelessWidget {
  const BlurTheStateBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: w / 11,
          color: Colors.black,
        ),
      ),
    );
  }
}
