import 'package:flutter/material.dart';
import 'package:novels/utilities/components/system_ui_overlay.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';

PreferredSize defaultAppBar(context) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, kToolbarHeight),
    child: ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
      child: AppBar(
        // brightness: Brightness.light,
        systemOverlayStyle: style,
        backgroundColor: Colors.white.withOpacity(.5),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.arrowLeftSquare,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconBroken.bookmark,
            ),
          ),
        ],
      ),
    ),
  );
}
