import 'package:flutter/material.dart';

import '../../../../utilities/components/item_components/image.dart';
import '../../../../utilities/components/rate/rate_components.dart';
import '../../../../utilities/shared/icon_broken/icon_broken.dart';

class DefaultFavItem extends StatelessWidget {
  const DefaultFavItem({
    Key? key,
    required this.authorName,
    required this.title,
    required this.imgUrl,
    required this.id,
    required this.onPressed,
    this.onTap,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final VoidCallback? onPressed;
  final String title;
  final String id;
  final String authorName;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
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
                padding: const EdgeInsets.fromLTRB(100.0, 0, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      ' $title',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(height: 2),
                    ),
                    Text(
                      ' $authorName',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const Spacer(),
                    DefaultRating(
                      id: id,
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
                  image: imgUrl,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                IconBroken.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
