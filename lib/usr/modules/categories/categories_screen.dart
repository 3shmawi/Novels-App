import 'package:flutter/material.dart';
import 'package:novels/utilities/components/item_components/head_title.dart';
import 'package:novels/utilities/components/item_components/novel_item.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DefaultHeadTitle(title: ' Novel'),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),

                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const DefaultNovelItem(),
                  itemCount: 10,
                ),
              ),
            ],
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
