import 'package:flutter/material.dart';
import 'package:novels/utilities/components/item_components/head_title.dart';
import 'package:novels/utilities/routes/screens_route.dart';
import '../../../utilities/components/button.dart';
import '../../../utilities/components/item_components/bar_item.dart';
import '../../../utilities/components/item_components/image.dart';
import '../../../utilities/components/rating.dart';
import '../../../utilities/shared/icon_broken/icon_broken.dart';
import 'component/page_components.dart';

class NovelDetailScreen extends StatelessWidget {
  const NovelDetailScreen({Key? key}) : super(key: key);

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
                          SizedBox(
                            height: 300,
                            width: 200,
                            child: Card(
                              margin: EdgeInsets.zero,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const DefaultImageView(
                                image:
                                    'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHJlYWRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                              ),
                            ),
                          ),
                          Text(
                            'Catcher in the Rye',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(height: 2),
                          ),
                          Text(
                            'J.D. Salinger',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0, bottom: 5),
                            child: DefaultRating(id: ''),
                          ),
                          Row(
                            children: [
                              DefaultHeadButton(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(ScreenRoute.commentsScreenRoute),
                                text: '158 ',
                                iconData: IconBroken.chat,
                              ),
                              const DefaultHeadButton(
                                text: '4.5 ',
                                iconData: IconBroken.star,
                              ),
                              const DefaultHeadButton(
                                text: '1K ',
                                iconData: IconBroken.show,
                              ),
                              DefaultHeadButton(
                                onTap: () {},
                                text: 'Share',
                                iconData: IconBroken.send,
                                fontSize: 12.5,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const DefaultHeadTitle(title: 'About the author'),
                              Text(
                                'J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its public cation, Salinger published several short stories in Story magazine',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(height: 1.4),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const DefaultHeadTitle(title: 'Overview'),
                              Text(
                                'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique......',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(height: 1.4),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: DefaultOutlinedButton(),
                  ),
                ],
              ),
            ),
            DefaultBarItem(
              onPressed: () {},
              textCenter: '',
              widget: const Icon(
                IconBroken.bookmark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
