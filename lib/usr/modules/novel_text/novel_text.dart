import 'package:flutter/material.dart';
import 'package:novels/models/novel.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';

import '../../../utilities/components/item_components/bar_item.dart';
import '../../../utilities/components/toast.dart';
import 'component/novel_content_text.dart';
import 'component/slider_font_size.dart';

class NovelTextScreen extends StatelessWidget {
  const NovelTextScreen({
    required this.novel,
    Key? key,
  }) : super(key: key);

  final NovelModel novel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                DefaultNovelContent(
                  authorName: novel.authorName,
                  novel: novel.novelText,
                ),
                const DefaultFontSizeSlider(),
              ],
            ),
            DefaultBarItem(
              onPressed: () {
                showToast(text: 'لسه مخلصتهاش 🙂', color: Colors.red);

              },
              textCenter: novel.title,
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
