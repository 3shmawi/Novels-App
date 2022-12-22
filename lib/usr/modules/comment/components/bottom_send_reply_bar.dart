import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/comment.dart';
import 'package:novels/models/notification.dart';
import 'package:novels/models/replies.dart';
import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/usr/modules/comment/components/send_comment_form_field.dart';
import 'package:novels/usr/modules/comment/replies/cubit/replies_cubit.dart';
import 'package:novels/usr/modules/comment/replies/cubit/replies_state.dart';
import 'package:novels/usr/modules/notification/cubit/notification_cubit.dart';
import 'package:novels/usr/modules/notification/cubit/notification_state.dart';
import 'package:novels/utilities/enums/shared_pref.dart';
import 'package:novels/utilities/logic/dart_methods.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../models/user.dart';
import '../../../../utilities/shared/icon_broken/icon_broken.dart';

class DefaultSendReplyBar extends StatelessWidget {
  const DefaultSendReplyBar({
    required this.textEditingController,
    required this.scrollController,
    required this.comment,
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final ItemScrollController scrollController;
  final CommentModel comment;

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
                  return BlocConsumer<RepliesCubit, RepliesState>(
                    listener: (context, state) {
                      if(state is SetRepliesCommentSuccessState || state is SetRepliesCommentLoadingState) {
                        textEditingController.clear();
                      }

                    },
                    buildWhen: (_, current) =>
                        current is SetRepliesCommentSuccessState,
                    builder: (context, state) {
                      var cubit = context.read<RepliesCubit>();
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
                                var newId = createNewId();

                                if (comment.userModel.token != usr.token) {
                                  notificationCubit.sendNotification(
                                    title:
                                        '${usr.name} Replied in your comment',
                                    body: textEditingController.text,
                                    token: comment.userModel.token,
                                  );
                                  notificationCubit.setNotification(
                                    notification: NotificationModel(
                                      id: newId,
                                      state: 'replies',
                                      dateTime: DateTime.now().toString(),
                                      title: textEditingController.text,
                                      name: usr.name,
                                      to: comment.userModel.id,
                                      index: cubit.length,
                                      commentModel: comment,
                                    ),
                                  );
                                }
                                cubit.setRepliesComment(
                                  reply: RepliesModel(
                                    id: newId,
                                    title: textEditingController.text,
                                    dateTime: DateTime.now().toString(),
                                    commentModel: comment,
                                    userModel: usr,
                                  ),
                                  newId: newId,
                                );

                                if(cubit.length > 3) {
                                  scrollController.jumpTo(index: cubit.length);
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
