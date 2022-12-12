import 'package:flutter/material.dart';
import 'package:novels/utilities/routes/screens_route.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';

import '../../../utilities/components/item_components/image.dart';
import '../../../utilities/components/rating.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: ()=>Navigator.pushNamed(context, ScreenRoute.openNovelScreenRoute),
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
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100.0, 0, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            ' Catcher in the Rye',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(height: 2),
                          ),
                          Text(
                            ' J.D. Salinger',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 3.0),
                            child: DefaultRating(
                              id: '',
                              size: 18,
                            ),
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
                      child: const DefaultImageView(
                        image:
                        'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHJlYWRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconBroken.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
