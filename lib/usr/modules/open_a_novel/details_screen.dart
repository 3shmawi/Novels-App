import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/novel.dart';
import 'package:novels/usr/modules/open_a_novel/component/comments_button.dart';
import 'package:novels/usr/modules/open_a_novel/component/view_button.dart';
import 'package:novels/utilities/components/item_components/head_title.dart';
import 'package:novels/utilities/components/view/cubit/view_cubit.dart';
import 'package:novels/utilities/routes/screens_route.dart';
import '../../../utilities/components/button.dart';
import '../../../utilities/components/item_components/bar_item.dart';
import '../../../utilities/components/item_components/image.dart';
import '../../../utilities/components/rate/rate_components.dart';
import '../../../utilities/components/view/cubit/view_state.dart';
import '../../../utilities/logic/dart_methods.dart';
import '../../../utilities/shared/icon_broken/icon_broken.dart';
import 'component/rating_button.dart';
import 'component/saved_button.dart';

class NovelDetailScreen extends StatelessWidget {
  const NovelDetailScreen({
    required this.novel,
    Key? key,
  }) : super(key: key);

  final NovelModel novel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            height: 30,
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(
                              ScreenRoute.openPhotoScreenRoute,
                              arguments: novel.imgUrl,
                            ),
                            child: SizedBox(
                              height: 300,
                              width: 200,
                              child: Card(
                                margin: EdgeInsets.zero,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: DefaultImageView(image: novel.imgUrl),
                              ),
                            ),
                          ),
                          Text(
                            novel.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(height: 2),
                          ),
                          Text(
                            novel.authorName,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0, bottom: 5),
                            child: DefaultSetRatingFromUsr(
                              id: novel.id,
                            ),
                          ),
                          Row(
                            children: [
                              DefaultCommentsButton(novel: novel),
                              DefaultRatingCount(novelId: novel.id),
                              DefaultViewButton(novelId: novel.id),
                              DefaultSavedButton(novel: novel),
                            ],
                          ),
                          Column(
                            children: [
                              const Align(
                                alignment: AlignmentDirectional.topStart,
                                child: DefaultHeadTitle(
                                  title: 'About the author',
                                ),
                              ),
                              Align(
                                alignment:
                                    isFirstCharArabic(novel.aboutTheAuthor)
                                        ? AlignmentDirectional.topEnd
                                        : AlignmentDirectional.topStart,
                                child: Text(
                                  novel.aboutTheAuthor,
                                  textDirection:
                                      isFirstCharArabic(novel.aboutTheAuthor)
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(height: 1.4),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Align(
                                alignment: AlignmentDirectional.topStart,
                                child: DefaultHeadTitle(
                                  title: 'Overview',
                                ),
                              ),
                              Align(
                                alignment: isFirstCharArabic(novel.overview)
                                    ? AlignmentDirectional.topEnd
                                    : AlignmentDirectional.topStart,
                                child: Text(
                                  novel.overview,
                                  textDirection:
                                      isFirstCharArabic(novel.overview)
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(height: 1.4),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<ViewCubit, ViewState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DefaultOutlinedButton(
                          onPressed: () {
                            context
                                .read<ViewCubit>()
                                .setView(novelId: novel.id);
                            Navigator.pushNamed(
                              context,
                              ScreenRoute.novelTextScreenRoute,
                              arguments: novel,
                            );
                          },
                          header: 'READ NOW...',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            DefaultBarItem(
              onPressed: () {},
              textCenter: '',
              widget: const Icon(
                IconBroken.send,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
