import 'package:flutter/material.dart';
import 'package:novels/utilities/components/no_data.dart';

import '../../../models/novel.dart';
import '../item_components/novel_item.dart';

class GetNovelsStream extends StatelessWidget {
  const GetNovelsStream({
    required this.stream,
    this.padding = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  final Stream<List<NovelModel>>? stream;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NovelModel>>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var novels = snapshot.data;
          if (novels == null || novels.isEmpty) {
            return const DefaultNoData();
          }
          return GridView.count(
            padding: padding,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 15,
            childAspectRatio: 1 / 1.92,
            children: List.generate(
              novels.length,
              (count) {
                int index = novels.length - count - 1;

                return DefaultNovelItem(
                  novel: novels[index],
                  width: 0.1,
                );
              },
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
