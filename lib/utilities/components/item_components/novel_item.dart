import 'package:flutter/material.dart';
import 'package:novels/utilities/components/item_components/image.dart';

import '../../routes/screens_route.dart';

class DefaultNovelItem extends StatelessWidget {
  const DefaultNovelItem({
    this.height = 3.03,
    this.width = 2.4,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ScreenRoute.openNovelScreenRoute,
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: size.height / height,
            width: size.width / width,
            child: Card(
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
            style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 2),
          ),
          Text(
            'J.D. Salinger',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
