
import 'dart:ui';

import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.onTap,
    required this.textButton,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: size.width / 8,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: FittedBox(
              child: Text(
                textButton,
                style: TextStyle(color: Colors.white.withOpacity(.8)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
