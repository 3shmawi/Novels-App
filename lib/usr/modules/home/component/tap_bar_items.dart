import 'package:flutter/material.dart';

import '../../../../utilities/components/item_components/novel_item.dart';


class DefaultTapBarCategory extends StatelessWidget {
  const DefaultTapBarCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = ['Novel', 'Self-Love', 'Science', 'Romance', 'History'];
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [ TabBar(
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
            list.length,
                (index) => Tab(
              child: Text(
                list[index],
                style: const TextStyle(
                  fontFamily: 'MyFont',
                ),
              ),
            ),
          ),
        ),
          SizedBox(
            height: height / 2.6,
            child: TabBarView(
              children: List.generate(
                list.length,
                    (index) => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const DefaultNovelItem(),
                  itemCount: 10,
                ),
              ),
            ),
          ),],
      ),
    );
  }
}
