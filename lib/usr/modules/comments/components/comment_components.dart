import 'package:flutter/material.dart';
import 'package:novels/models/comment.dart';
import 'package:novels/usr/modules/comments/replies/replies_screen.dart';

import '../../../../utilities/components/item_components/image.dart';
import '../../../../utilities/routes/screens_route.dart';

class DefaultCommentComponent extends StatelessWidget {
  const DefaultCommentComponent({
    required this.comment,
    required this.novelId,
    this.isJustComment = true,
    this.isReply = false,
    this.color = Colors.white,
    Key? key,
  }) : super(key: key);

  final CommentModel comment;
  final bool isJustComment;
  final bool isReply;
  final Color color;
  final String novelId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isReply ? 20 : 0),
      child: Card(
        elevation: 50,
        color: color,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    elevation: 10,
                    margin: const EdgeInsets.all(3),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  DefaultImageView(
                      image:comment.imgUrl
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ${comment.name}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '  ${comment.dateTime.substring(0,19)}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                if (isJustComment) const Spacer(),
                if (isJustComment)
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => Navigator.of(context).pushNamed(
                        ScreenRoute.repliesScreenRoute,
                        arguments: RepliesScreen(
                          replyComment: comment,
                          novelId: novelId,
                        ),
                      ),
                      child: Card(
                        color: Colors.grey[200],
                        elevation: 10,
                        margin: const EdgeInsets.all(3),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Reply',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.red,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 5,
              ),
              height: 1.5,
              width: double.infinity,
              color: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Text(
                comment.title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
