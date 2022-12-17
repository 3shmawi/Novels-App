import 'package:flutter/material.dart';
import '../../../fire_store_controller/controller.dart';
import '../../../models/comment.dart';
import '../../../utilities/components/item_components/bar_item.dart';
import '../../../utilities/components/no_data.dart';
import 'components/bottom_send_comment_bar.dart';
import 'components/comment_components.dart';

class CommentsScreen extends StatelessWidget {
  CommentsScreen({
    required this.novelId,
    Key? key,
  }) : super(key: key);

  final TextEditingController commentController = TextEditingController();
  final String novelId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder<List<CommentModel>>(
                stream: FireStoreDataBase().getNovelCommentsStream(novelId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var comments = snapshot.data;
                    if (comments == null || comments.isEmpty) {
                      return const DefaultNoData(text: 'Comments');
                    }
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 40, bottom: 60),
                      itemBuilder: (context, index) => DefaultCommentComponent(
                        novelId: novelId,
                        comment: comments[index],
                      ),
                      itemCount: comments.length,
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
            DefaultBarItem(
              textCenter: 'Comments',
              widget: Container(),
            ),
            DefaultSendCommentBar(
              textEditingController: commentController,
              novelId: novelId,
            ),
          ],
        ),
      ),
    );
  }
}
