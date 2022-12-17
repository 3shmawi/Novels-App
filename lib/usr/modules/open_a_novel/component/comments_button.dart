import 'package:flutter/material.dart';
import 'package:novels/fire_store_controller/controller.dart';
import 'package:novels/models/comment.dart';
import 'package:novels/usr/modules/open_a_novel/component/page_components.dart';

import '../../../../utilities/routes/screens_route.dart';
import '../../../../utilities/shared/icon_broken/icon_broken.dart';

class DefaultCommentsButton extends StatelessWidget {
  const DefaultCommentsButton({required this.novelId, Key? key})
      : super(key: key);

  final String novelId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommentModel>>(
      stream: FireStoreDataBase().getNovelCommentsStream(novelId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var comments = snapshot.data;
          if (comments == null || comments.isEmpty) {
            return DefaultHeadButton(
              onTap: () => Navigator.of(context).pushNamed(
                ScreenRoute.commentsScreenRoute,
                arguments: novelId,
              ),
              text: '0 ',
              iconData: IconBroken.chat,
            );
          }
          return DefaultHeadButton(
            onTap: () => Navigator.of(context).pushNamed(
              ScreenRoute.commentsScreenRoute,
              arguments: novelId,
            ),
            text: '${comments.length} ',
            iconData: IconBroken.chat,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
