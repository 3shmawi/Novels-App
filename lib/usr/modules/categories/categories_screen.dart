import 'package:flutter/material.dart';
import 'package:novels/fire_store_controller/controller.dart';
import 'package:novels/models/category.dart';
import 'package:novels/utilities/components/item_components/head_title.dart';
import 'package:novels/utilities/components/item_components/novel_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: StreamBuilder<List<CategoryModel>>(
          stream: FireStoreDataBase().getCategoriesStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var categories = snapshot.data;
              if (categories == null || categories.isEmpty) {
                return const Center(
                  child: Text('NO DATA YET!'),
                );
              }
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, count) {
                  int index = categories.length - count - 1;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultHeadTitle(title: ' ${categories[index].title}'),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              const DefaultNovelItem(),
                          itemCount: 10,
                        ),
                      ),
                    ],
                  );
                },
                itemCount: categories.length,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
