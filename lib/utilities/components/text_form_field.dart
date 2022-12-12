import 'dart:ui';

import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isPassword;
  final String hintText;

  const DefaultFormField({
    Key? key,
    required this.textInputType,
    required this.textEditingController,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: textEditingController,
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: isPassword,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black.withOpacity(.7),
          ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
        ),
      ),
    );
  }
}


