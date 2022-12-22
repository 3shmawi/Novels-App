import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/novel.dart';
import 'package:novels/usr/modules/comment/comments/cubit/comment_cubit.dart';
import 'package:novels/usr/modules/comment/comments/cubit/comment_state.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../models/comment.dart';
import '../../../../utilities/components/item_components/bar_item.dart';
import '../../../../utilities/components/no_data.dart';
import '../components/bottom_send_comment_bar.dart';
import '../components/comment_components.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({
    required this.novel,
    this.index = 0,
    Key? key,
  }) : super(key: key);

  final NovelModel novel;
  final int index;
  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController commentController = TextEditingController();

  final ItemScrollController sc= ItemScrollController();


  Future scrollToIndex(int index, {bool isAnimating = true}) async {
    const double alignment = 0;
    if (isAnimating) {
      await sc.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        alignment: alignment,
      );
    }else{
      sc.jumpTo(index: index,alignment: alignment);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder<List<CommentModel>>(
                stream:
                    FireStoreDataBase().getNovelCommentsStream(widget.novel.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var comments = snapshot.data;
                    if (comments == null || comments.isEmpty) {
                      return const DefaultNoData(text: 'Comments');
                    }
                    return BlocBuilder<CommentCubit, CommentState>(
                      buildWhen: (_, current) => current is ChangeLengthState,
                      builder: (context, state) {
                        var cubit = context.read<CommentCubit>();
                        cubit.changeIndex(comments.length);
                        return ScrollablePositionedList.builder(
                          itemScrollController: sc,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(top: 40, bottom: 60),
                          itemBuilder: (context, index) =>
                              DefaultCommentComponent(
                                color: index == widget.index ? Colors.blueGrey:Colors.white,
                            comment: comments[index],
                          ),
                          itemCount: comments.length,
                        );
                      },
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
              scrollController: sc,
              novel: widget.novel,
            ),
          ],
        ),
      ),
    );
  }
}
