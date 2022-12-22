import 'package:flutter/material.dart';
import 'package:novels/models/novel.dart';
import 'package:novels/utilities/components/item_components/image.dart';

import '../../routes/screens_route.dart';

class DefaultNovelItem extends StatelessWidget {
  const DefaultNovelItem({
    required this.novel,
    this.height = 3.03,
    this.width = 2.4,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;
  final NovelModel novel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ScreenRoute.openNovelScreenRoute,
          arguments: novel,
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: size.height / height,
            width: size.width / width,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: DefaultImageView(
                image: novel.imgUrl,
              ),
            ),
          ),
          Text(
            novel.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 2),
          ),
          Text(
            novel.authorName,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
