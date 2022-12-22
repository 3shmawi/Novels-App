import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/utilities/components/no_data.dart';
import 'package:novels/utilities/routes/screens_route.dart';

import '../../../fire_store_controller/controller.dart';
import '../../../models/novel.dart';
import 'component/fav_item.dart';
import 'cubit/saved_cubit.dart';
import 'cubit/saved_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<LocalDatabaseCubit, LocalDatabaseState>(
          builder: (context, state) {
            var cubit = context.read<LocalDatabaseCubit>();
            return cubit.booked.isEmpty
                ? const DefaultNoData(
                    text: 'Booked',
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, count) {
                      int index = cubit.booked.length - count - 1;
                      return StreamBuilder<List<NovelModel>>(
                        stream: FireStoreDataBase().getCategoryNovelsStream(
                            cubit.booked[index].category),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            var novels = snapshot.data;
                            if (novels == null || novels.isEmpty) {
                              return DefaultFavItem(
                                onPressed: () => cubit.deleteFromBookedDataBase(
                                  cubit.booked[index].dbId!,
                                ),
                                title: cubit.booked[index].title,
                                id: cubit.booked[index].id,
                                authorName: cubit.booked[index].authorName,
                                imgUrl: cubit.booked[index].imgUrl,
                              );
                            }
                            NovelModel? novel;
                            for (var element in novels) {
                              if (cubit.booked[index].id.contains(element.id)) {
                                novel = element;
                              }
                            }
                            return DefaultFavItem(
                              onTap: () {
                                if (novel != null) {
                                  Navigator.pushNamed(
                                    context,
                                    ScreenRoute.openNovelScreenRoute,
                                    arguments: novel,
                                  );
                                }
                              },
                              onPressed: () => cubit.deleteFromBookedDataBase(
                                cubit.booked[index].dbId!,
                              ),
                              title: cubit.booked[index].title,
                              id: cubit.booked[index].id,
                              authorName: cubit.booked[index].authorName,
                              imgUrl: cubit.booked[index].imgUrl,
                            );
                          }
                          return DefaultFavItem(
                            onPressed: () => cubit.deleteFromBookedDataBase(
                              cubit.booked[index].dbId!,
                            ),
                            title: cubit.booked[index].title,
                            id: cubit.booked[index].id,
                            authorName: cubit.booked[index].authorName,
                            imgUrl: cubit.booked[index].imgUrl,
                          );
                        },
                      );
                    },
                    itemCount: cubit.booked.length,
                  );
          },
        ),
      ),
    );
  }
}
