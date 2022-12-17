import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/comment.dart';
import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/usr/modules/comments/components/send_comment_form_field.dart';
import 'package:novels/usr/modules/comments/cubit/comment_cubit.dart';
import 'package:novels/usr/modules/comments/cubit/comment_state.dart';
import 'package:novels/utilities/enums/shared_pref.dart';
import 'package:novels/utilities/logic/dart_methods.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../models/user.dart';
import '../../../../utilities/shared/icon_broken/icon_broken.dart';

class DefaultSendCommentBar extends StatelessWidget {
  const DefaultSendCommentBar({
    required this.textEditingController,
    required this.novelId,
    this.isReply = false,
    this.commentId,
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String novelId;
  final bool isReply;
  final String? commentId;

  @override
  Widget build(BuildContext context) {
    var uid = CacheHelper.getData(key: SharedPrefKeys.id);
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            Expanded(
              child: Card(
                color: Colors.black.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DefaultAddCommentFormField(
                  hintText: 'Write a comment',
                  textEditingController: textEditingController,
                  textInputType: TextInputType.text,
                  prefixIcon: IconBroken.chart,
                ),
              ),
            ),
            StreamBuilder<UserModel>(
              stream: FireStoreDataBase().getUserDataStream(uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  var usr = snapshot.data;
                  if (usr == null) {}
                  return BlocConsumer<CommentCubit, CommentState>(
                    listener: (context, state) {
                      if (state is SetCommentSuccessState ||
                          state is SetRepliesCommentSuccessState) {
                        textEditingController.clear();
                      }
                    },
                    buildWhen: (_, current) =>
                        current is SetCommentSuccessState ||
                        current is SetRepliesCommentSuccessState,
                    builder: (context, state) {
                      var cubit = context.read<CommentCubit>();
                      return SizedBox(
                        height: 45,
                        width: 45,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            var newId = createNewId();
                            isReply
                                ? cubit.setRepliesComment(
                                    comment: CommentModel(
                                      id: usr!.id,
                                      imgUrl: usr.imgUrl,
                                      title: textEditingController.text,
                                      name: usr.name,
                                      dateTime: DateTime.now().toString(),
                                    ),
                                    novelId: novelId,
                                    newId: newId,
                                    commentId: commentId!,
                                  )
                                : cubit.setComment(
                                    comment: CommentModel(
                                      id: usr!.id,
                                      imgUrl: usr.imgUrl,
                                      title: textEditingController.text,
                                      name: usr.name,
                                      dateTime: DateTime.now().toString(),
                                    ),
                                    novelId: novelId,
                                    newId: newId,
                                  );
                          },
                          child: Card(
                            color: Colors.black.withOpacity(0.5),
                            elevation: 10,
                            margin: const EdgeInsets.all(2),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Icon(
                                IconBroken.send,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return SizedBox(
                  height: 45,
                  width: 45,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Card(
                      color: Colors.black.withOpacity(0.5),
                      elevation: 10,
                      margin: const EdgeInsets.all(2),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          IconBroken.send,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
