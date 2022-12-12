import 'package:flutter/material.dart';

import '../../../utilities/components/item_components/head_title.dart';
import '../../../utilities/components/item_components/novel_item.dart';
import 'component/page_components.dart';
import 'component/tap_bar_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool show = false;
    Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      show = false;
    });

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (show)
                const DefaultHeadTitle(
                  title: 'Welcome back, Mohammed!',
                ),
              Text(
                'What do you want to \nread today?',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(height: 1.5),
              ),
              const DefaultSearch(),
              const DefaultTapBarCategory(),
              const DefaultHeadTitle(
                title: ' New Arrivals',
              ),
              GridView.count(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 15,
                childAspectRatio: 1 / 1.9,
                children: List.generate(
                  9,
                  (index) {
                    // int index = products.length - count - 1;

                    return const DefaultNovelItem(
                      width: 0.1,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
