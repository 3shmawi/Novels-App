import 'package:flutter/material.dart';
import 'package:novels/models/comment.dart';
import 'package:novels/models/replies.dart';
import 'package:novels/usr/modules/comment/replies/replies_screen.dart';
import 'package:novels/utilities/logic/dart_methods.dart';

import '../../../../utilities/components/item_components/image.dart';
import '../../../../utilities/routes/screens_route.dart';

class DefaultCommentComponent extends StatelessWidget {
  const DefaultCommentComponent({
    required this.comment,
    this.isJustComment = true,
    this.color = Colors.white,
    Key? key,
  }) : super(key: key);

  final CommentModel comment;
  final bool isJustComment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  child: DefaultImageView(image: comment.userModel.imgUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' ${comment.userModel.name}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '  ${daysBetween(DateTime.parse(comment.dateTime))}',
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
                        index: 0,
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
                          style: Theme.of(context).textTheme.caption!.copyWith(
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
    );
  }
}

class DefaultReplyCommentComponent extends StatelessWidget {
  const DefaultReplyCommentComponent({
    required this.comment,
    this.color = Colors.white,
    Key? key,
  }) : super(key: key);

  final RepliesModel comment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
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
                    child: DefaultImageView(image: comment.userModel.imgUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ${comment.userModel.name}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '  ${daysBetween(DateTime.parse(comment.dateTime))}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
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
