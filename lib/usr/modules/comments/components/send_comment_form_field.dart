import 'dart:ui';

import 'package:flutter/material.dart';

class DefaultAddCommentFormField extends StatelessWidget {
  const DefaultAddCommentFormField({
    required this.textEditingController,
    required this.textInputType,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final bool isPassword;
  final TextInputType textInputType;
  final IconData prefixIcon;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 8,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: textEditingController,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            obscureText: isPassword,
            keyboardType: textInputType,
            decoration: InputDecoration(
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.black,
              ),
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[1000],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
