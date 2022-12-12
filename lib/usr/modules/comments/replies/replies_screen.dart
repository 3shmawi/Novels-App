import 'package:flutter/material.dart';

import '../../../../utilities/components/item_components/bar_item.dart';
import '../components/bottom_send_comment_bar.dart';
import '../components/comment_components.dart';

class RepliesScreen extends StatelessWidget {
  RepliesScreen({Key? key}) : super(key: key);

  final TextEditingController commentController = TextEditingController();

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
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        const DefaultCommentComponent(
                      isJustComment: false,
                      isReply: true,
                    ),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
            DefaultBarItem(
              textCenter: 'Replies of Comments',
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
