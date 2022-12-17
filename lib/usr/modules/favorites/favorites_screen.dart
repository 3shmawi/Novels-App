import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/utilities/components/no_data.dart';
import 'package:novels/utilities/routes/screens_route.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';

import '../../../utilities/components/item_components/image.dart';
import '../../../utilities/components/rate/rate_components.dart';
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
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () => Navigator.pushNamed(
                          context,
                          ScreenRoute.openNovelScreenRoute,
                          arguments: cubit.booked[index],
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 120,
                              child: Card(
                                elevation: 20,
                                color: Colors.grey[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(100.0, 0, 8, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' ${cubit.booked[index].title}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(height: 2),
                                      ),
                                      Text(
                                        ' ${cubit.booked[index].authorName}',
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                      const Spacer(),
                                      DefaultRating(
                                        id: cubit.booked[index].id,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                height: 120,
                                width: 90,
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.zero,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: DefaultImageView(
                                    image: cubit.booked[index].imgUrl,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: IconButton(
                                onPressed: () => cubit.deleteFromBookedDataBase(
                                  cubit.booked[index].dbId!,
                                ),
                                icon: const Icon(
                                  IconBroken.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
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
