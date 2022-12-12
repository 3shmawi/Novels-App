import 'package:flutter/material.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';

import '../../../utilities/components/item_components/bar_item.dart';
import 'component/page_components.dart';

class NovelTextScreen extends StatelessWidget {
  const NovelTextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: const [
                DefaultNovelContent(),
                DefaultFontSizeSlider(),
              ],
            ),
            DefaultBarItem(
              onPressed: () {},
              textCenter: 'Catcher in the Rye',
              widget: const Icon(
                IconBroken.moreSquare,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
