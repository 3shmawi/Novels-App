import 'package:flutter/material.dart';
import 'package:novels/fire_store_controller/controller.dart';
import 'package:novels/models/notification.dart';
import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/usr/modules/comment/replies/replies_screen.dart';
import 'package:novels/utilities/components/no_data.dart';
import 'package:novels/utilities/enums/shared_pref.dart';
import 'package:novels/utilities/routes/screens_route.dart';
import 'package:novels/utilities/shared/colors/default_app_color.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';

import '../../../utilities/components/item_components/bar_item.dart';
import '../comment/comments/comments_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var usrId = CacheHelper.getData(key: SharedPrefKeys.id);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder<List<NotificationModel>>(
              stream: FireStoreDataBase().getNotificationsStream(usrId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  var notifications = snapshot.data;
                  if (notifications == null || notifications.isEmpty) {
                    return const DefaultNoData(text: 'Notifications');
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 40),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, count) {
                      int index = notifications.length - count - 1;
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          // cubit.jumpTo(notifications[index].index);
                          if (notifications[index].state == 'comments') {
                            Navigator.of(context).pushNamed(
                              ScreenRoute.commentsScreenRoute,
                              arguments: CommentsScreen(
                                novel: notifications[index]
                                    .commentModel
                                    .novelModel,
                                index: notifications[index].index,
                              ),
                            );
                          } else {
                            Navigator.of(context).pushNamed(
                              ScreenRoute.repliesScreenRoute,
                              arguments: RepliesScreen(
                                replyComment: notifications[index].commentModel,
                                index: notifications[index].index,
                              ),
                            );
                          }
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      notifications[index].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            color: defaultColor,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: SizedBox(
                                      width: 165,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notifications[index].state ==
                                                    'comments'
                                                ? 'Commented in your Novel'
                                                : 'Replies in your Comment',
                                            style: Theme.of(context)
                                                .textTheme
                                                .button,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            notifications[index].title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Icon(
                                    IconBroken.arrowRight3,
                                    color: defaultColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: notifications.length,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            DefaultBarItem(
              textCenter: 'Notifications',
              widget: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
