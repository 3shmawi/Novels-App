import 'package:flutter/material.dart';
import 'package:novels/models/category.dart';
import 'package:novels/models/novel.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../utilities/components/item_components/novel_item.dart';
import '../../../../utilities/components/no_data.dart';

class DefaultTapBarCategory extends StatelessWidget {
  const DefaultTapBarCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return StreamBuilder<List<CategoryModel>>(
      stream: FireStoreDataBase().getCategoriesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var categories = snapshot.data;
          if (categories == null || categories.isEmpty) {
            return const DefaultNoData(
              height: 300,
            );
          }
          return DefaultTabController(
            length: categories.length,
            child: Column(
              children: [
                TabBar(
                  labelStyle: const TextStyle(
                    height: 3,
                  ),
                  indicatorColor: Colors.black.withOpacity(.8),
                  unselectedLabelStyle:
                      TextStyle(color: Colors.black.withOpacity(.5)),
                  unselectedLabelColor: Colors.black.withOpacity(.4),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.black.withOpacity(.8),
                  automaticIndicatorColorAdjustment: true,
                  padding: const EdgeInsets.only(bottom: 10),
                  splashBorderRadius: BorderRadius.circular(15),
                  isScrollable: true,
                  tabs: List.generate(
                    categories.length,
                    (index) {
                      return Tab(
                        child: Text(
                          categories[index].title,
                          style: const TextStyle(
                            fontFamily: 'MyFont',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height / 2.5,
                  child: TabBarView(
                    children: List.generate(
                      categories.length,
                      (index) => StreamBuilder<List<NovelModel>>(
                        stream: FireStoreDataBase()
                            .getCategoryNovelsStream(categories[index].title),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            var novels = snapshot.data;
                            if (novels == null || novels.isEmpty) {
                              return DefaultNoData(
                                  height: height / 3, text: 'novels');
                            }
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, count) {
                                int index = novels.length - count - 1;
                                return DefaultNovelItem(
                                  novel: novels[index],
                                );
                              },
                              itemCount: novels.length,
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
