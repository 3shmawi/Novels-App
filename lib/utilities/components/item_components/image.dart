import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultImageView extends StatelessWidget {
  const DefaultImageView({
    Key? key,
    required this.image,
    this.height,
  }) : super(key: key);
  final String image;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (image.startsWith('https://')) {
      return Image(
        image: CachedNetworkImageProvider(
          image,
        ),
        fit: BoxFit.cover,
      );
    } else {
      return Image.memory(
        base64Decode(
          image,
        ),
        fit: BoxFit.cover,
      );
    }
  }
}
