import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/comment.dart';
import 'package:novels/models/notification.dart';
import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/usr/modules/comment/components/send_comment_form_field.dart';
import 'package:novels/usr/modules/notification/cubit/notification_cubit.dart';
import 'package:novels/usr/modules/notification/cubit/notification_state.dart';
import 'package:novels/utilities/enums/shared_pref.dart';
import 'package:novels/utilities/logic/dart_methods.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../models/novel.dart';
import '../../../../models/user.dart';
import '../../../../utilities/shared/icon_broken/icon_broken.dart';
import '../comments/cubit/comment_cubit.dart';
import '../comments/cubit/comment_state.dart';

class DefaultSendCommentBar extends StatelessWidget {
  const DefaultSendCommentBar({
    required this.textEditingController,
    required this.scrollController,
    required this.novel,
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final NovelModel novel;
  final ItemScrollController scrollController;
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
                  if (usr == null) {
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
                  }
                  return BlocConsumer<CommentCubit, CommentState>(
                    listener: (context, state) {

                      if (state is SetCommentSuccessState || state is SetCommentLoadingState) {
                        textEditingController.clear();
                      }
                    },
                    buildWhen: (_, current) =>
                        current is SetCommentSuccessState,
                    builder: (context, state) {
                      var cubit = context.read<CommentCubit>();
                      return SizedBox(
                        height: 45,
                        width: 45,
                        child:
                            BlocBuilder<NotificationCubit, NotificationState>(
                          buildWhen: (_, current) =>
                              current is SetNotificationSuccessState ||
                              current is SendNotificationSuccessState,
                          builder: (context, state) {
                            var notificationCubit =
                                context.read<NotificationCubit>();
                            return InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                if (textEditingController.text.isNotEmpty) {
                                  var newId = createNewId();

                                  if (novel.userModel.token != usr.token) {
                                    notificationCubit.sendNotification(
                                      title:
                                          '${usr.name} Commented in your novel',
                                      body: textEditingController.text,
                                      token: novel.userModel.token,
                                    );
                                    notificationCubit.setNotification(
                                      notification: NotificationModel(
                                        id: newId,
                                        state: 'comments',
                                        dateTime: DateTime.now().toString(),
                                        to: novel.userModel.id,
                                        title: textEditingController.text,
                                        name: usr.name,
                                        index: cubit.length,
                                        commentModel: CommentModel(id: newId, title:textEditingController.text, dateTime: DateTime.now().toString(), userModel: usr, novelModel: novel)
                                      ),
                                    );
                                  }
                                  cubit.setComment(
                                    comment: CommentModel(
                                      id: newId,
                                      title: textEditingController.text,
                                      dateTime: DateTime.now().toString(),
                                      userModel: usr,
                                      novelModel: novel,
                                    ),
                                    newId: newId,
                                  );
                                  if(cubit.length > 3) {
                                    scrollController.jumpTo(index: cubit.length);
                                  }
                                }
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
                            );
                          },
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
