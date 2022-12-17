import 'package:flutter/material.dart';
import 'package:novels/models/novel.dart';
import 'package:novels/utilities/components/background.dart';
import 'package:novels/utilities/components/get_novels_stream/novels_stream.dart';
import 'package:novels/utilities/components/item_components/bar_item.dart';
import 'package:novels/utilities/routes/screens_route.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';

import '../../../fire_store_controller/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const MyCustomBackground(),
            GetNovelsStream(
              stream: FireStoreDataBase().getAdminNovelsStream(),
              padding: const EdgeInsets.fromLTRB(10, 45, 10, 0),
            ),
            StreamBuilder<List<NovelModel>>(
              stream: FireStoreDataBase().getAdminNovelsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  var novels = snapshot.data;
                  if (novels == null || novels.isEmpty) {
                    return DefaultBarItem(
                      isPop: true,
                      textCenter: 'All Novels',
                      onPressed: () => Navigator.of(context)
                          .pushNamed(ScreenRoute.searchScreenRoute),
                      widget: const Icon(
                        IconBroken.search,
                        color: Colors.black,
                      ),
                    );
                  }
                  return DefaultBarItem(
                    isPop: true,
                    textCenter: 'All Novels ${novels.length}',
                    onPressed: () => Navigator.of(context)
                        .pushNamed(ScreenRoute.searchScreenRoute),
                    widget: const Icon(
                      IconBroken.search,
                      color: Colors.black,
                    ),
                  );
                }
                return DefaultBarItem(
                  isPop: true,
                  textCenter: 'All Novels',
                  onPressed: () => Navigator.of(context)
                      .pushNamed(ScreenRoute.searchScreenRoute),
                  widget: const Icon(
                    IconBroken.search,
                    color: Colors.black,
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
