import 'package:flutter/material.dart';
import 'package:novels/utilities/components/background.dart';
import 'package:novels/utilities/components/item_components/bar_item.dart';
import 'package:novels/utilities/routes/screens_route.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';

import '../../../utilities/components/item_components/novel_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const MyCustomBackground(),
            GridView.count(
              padding: const EdgeInsets.fromLTRB(10, 45, 10, 0),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
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
            DefaultBarItem(
              isPop: true,
              textCenter: 'All Novels 45',
              onPressed: () => Navigator.of(context)
                  .pushNamed(ScreenRoute.searchScreenRoute),
              widget:  const Icon(
                IconBroken.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
