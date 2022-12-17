import 'package:flutter/material.dart';
import 'package:novels/utilities/components/get_novels_stream/novels_stream.dart';

import '../../../fire_store_controller/controller.dart';
import '../../../utilities/components/item_components/head_title.dart';
import 'component/notification.dart';
import 'component/page_components.dart';
import 'component/tap_bar_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool show = false;
    Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      show = false;
    });

    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (show)
                    const DefaultHeadTitle(title: 'Welcome back, Mohammed!'),
                  Text(
                    'What do you want to \nread today?',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          height: 1.5,
                        ),
                  ),
                  const DefaultSearch(),
                  const DefaultTapBarCategory(),
                  const DefaultHeadTitle(title: ' New Arrivals'),
                  GetNovelsStream(
                      stream: FireStoreDataBase().getAllNovelsStream()),
                ],
              ),
            ),
          ),
          const DefaultNotification(),
        ],
      ),
    );
  }
}
