import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/usr/modules/comment/comments/cubit/comment_state.dart';
import 'package:novels/usr/modules/comment/components/bottom_send_reply_bar.dart';
import 'package:novels/usr/modules/comment/replies/cubit/replies_cubit.dart';
import 'package:novels/usr/modules/comment/replies/cubit/replies_state.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../models/comment.dart';
import '../../../../models/replies.dart';
import '../../../../utilities/components/item_components/bar_item.dart';
import '../../../../utilities/components/no_data.dart';
import '../components/comment_components.dart';

class RepliesScreen extends StatefulWidget {
  const RepliesScreen({required this.replyComment,this.index=0, Key? key}) : super(key: key);

  final CommentModel replyComment;
  final int index;
  @override
  State<RepliesScreen> createState() => _RepliesScreenState();
}

class _RepliesScreenState extends State<RepliesScreen> {
  final TextEditingController commentController = TextEditingController();
  final ItemScrollController sc = ItemScrollController();


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
                  comment: widget.replyComment,
                ),
                StreamBuilder<List<RepliesModel>>(
                  stream: FireStoreDataBase().getNovelRepliesCommentStream(
                      widget.replyComment.novelModel.id,
                      widget.replyComment.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      var comments = snapshot.data;
                      if (comments == null || comments.isEmpty) {
                        return const DefaultNoData(text: 'Replies');
                      }
                      return Expanded(
                        child: BlocBuilder<RepliesCubit, RepliesState>(
                          buildWhen: (_,current)=>current is ChangeLengthState,
                          builder: (context, state) {
                            var cubit = context.read<RepliesCubit>();
                            cubit.changeIndex(comments.length);
                            return ScrollablePositionedList.builder(
                              shrinkWrap: true,
                              itemScrollController: sc,
                              padding: const EdgeInsets.only(bottom: 60),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  DefaultReplyCommentComponent(
                                    color: index == widget.index ? Colors.blueGrey:Colors.white,
                                    comment: comments[index],
                                  ),
                              itemCount: comments.length,
                            );
                          },
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
            DefaultSendReplyBar(
              textEditingController: commentController,
              comment: widget.replyComment,
              scrollController: sc,
            ),
          ],
        ),
      ),
    );
  }
}
