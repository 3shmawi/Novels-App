import 'package:flutter/material.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../models/comment.dart';
import '../../../../utilities/components/item_components/bar_item.dart';
import '../../../../utilities/components/no_data.dart';
import '../components/bottom_send_comment_bar.dart';
import '../components/comment_components.dart';

class RepliesScreen extends StatelessWidget {
  RepliesScreen({required this.replyComment, required this.novelId, Key? key})
      : super(key: key);

  final TextEditingController commentController = TextEditingController();
  final String novelId;
  final CommentModel replyComment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 45,
                ),
                DefaultCommentComponent(
                  isJustComment: false,
                  color: Colors.black.withOpacity(0.2),
                  novelId: novelId,
                  comment: replyComment,
                ),
                StreamBuilder<List<CommentModel>>(
                  stream:
                      FireStoreDataBase().getNovelReplyCommentStream(novelId,replyComment.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      var comments = snapshot.data;
                      if (comments == null || comments.isEmpty) {
                        return const DefaultNoData(text: 'Replies');
                      }
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 60),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              DefaultCommentComponent(
                            isJustComment: false,
                            isReply: true,
                            novelId: novelId,
                            comment: comments[index],
                          ),
                          itemCount: comments.length,
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
            DefaultBarItem(
              textCenter: 'Replies of Comments',
              widget: Container(),
            ),
            DefaultSendCommentBar(
              textEditingController: commentController,
              novelId: novelId,
              isReply: true,
              commentId: replyComment.id,
            ),
          ],
        ),
      ),
    );
  }
}
