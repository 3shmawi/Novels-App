import 'package:flutter/material.dart';
import 'package:novels/utilities/components/app_bar.dart';
import 'package:novels/utilities/components/item_components/image.dart';

class OpenPhotoScreen extends StatelessWidget {
  const OpenPhotoScreen({required this.image, Key? key}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DefaultImageView(
            image: image,
          ),
        ),
      ),
    );
  }
}
