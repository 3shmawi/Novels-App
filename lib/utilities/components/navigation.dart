import 'package:flutter/material.dart';

Future navigateAndFinish(context, route) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => route,
  ),
      (route) => false,
);