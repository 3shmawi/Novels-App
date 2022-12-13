import 'package:flutter/material.dart';
import 'package:novels/models/category.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../utilities/components/item_components/novel_item.dart';

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
            return const Center(child: Text('no data yet'));
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
                    (count) {
                      int index = categories.length - count - 1;
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
                  height: height / 2.6,
                  child: TabBarView(
                    children: List.generate(
                      categories.length,
                      (index) => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const DefaultNovelItem(),
                        itemCount: 10,
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
