import 'package:flutter/material.dart';
import '../../../utilities/components/item_components/bar_item.dart';
import 'components/bottom_send_comment_bar.dart';
import 'components/comment_components.dart';

class CommentsScreen extends StatelessWidget {
  CommentsScreen({Key? key}) : super(key: key);

  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 40),
              itemBuilder: (context, index) => const DefaultCommentComponent(),
              itemCount: 10,
            ),
            DefaultBarItem(
              textCenter: 'Comments',
              widget: Container(),
            ),
            DefaultSendCommentBar(
              textEditingController: commentController,
            ),
          ],
        ),
      ),
    );
  }
}
