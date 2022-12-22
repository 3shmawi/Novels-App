import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/novel.dart';
import 'package:novels/usr/modules/open_a_novel/component/page_components.dart';

import '../../../../models/booked.dart';
import '../../../../utilities/shared/icon_broken/icon_broken.dart';
import '../../favorites/cubit/saved_cubit.dart';
import '../../favorites/cubit/saved_state.dart';

class DefaultSavedButton extends StatelessWidget {
  const DefaultSavedButton({
    required this.novel,
    Key? key,
  }) : super(key: key);

  final NovelModel novel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalDatabaseCubit, LocalDatabaseState>(
      builder: (context, state) {
        var cubit = context.read<LocalDatabaseCubit>();
        var bookedNovel = BookedModel(
          id: novel.id,
          imgUrl: novel.imgUrl,
          title: novel.title,
          authorName: novel.authorName,
          category: novel.category,
        );
        return DefaultHeadButton(
          onTap: () => cubit.bookedButton(bookedNovel),
          text: cubit.isBooked(bookedNovel) ? 'Saved' : 'Save',
          iconData:
              cubit.isBooked(bookedNovel) ? Icons.book : IconBroken.bookmark,
          fontSize: cubit.isBooked(bookedNovel) ? 12 : 12.5,
        );
      },
    );
  }
}
