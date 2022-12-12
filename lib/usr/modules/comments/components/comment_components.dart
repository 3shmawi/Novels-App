import 'package:flutter/material.dart';

import '../../../../utilities/components/item_components/image.dart';
import '../../../../utilities/routes/screens_route.dart';


class DefaultCommentComponent extends StatelessWidget {
  const DefaultCommentComponent({
    this.isJustComment = true,
    this.isReply = false,
    this.color = Colors.white,
    Key? key,
  }) : super(key: key);

  final bool isJustComment;
  final bool isReply;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isReply ? 20 : 0),
      child: Card(
        elevation: 50,
        color: color,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    elevation: 10,
                    margin: const EdgeInsets.all(3),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const DefaultImageView(
                      image:
                      'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHJlYWRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        ' Mohamed Ashmawi',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '  Thu Dec 8  12:15:00 AM',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                if (isJustComment) const Spacer(),
                if (isJustComment)
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => Navigator.of(context).pushNamed(
                        ScreenRoute.repliesScreenRoute,
                      ),
                      child: Card(
                        color: Colors.grey[200],
                        elevation: 10,
                        margin: const EdgeInsets.all(3),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Reply',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.red,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 5,
              ),
              height: 1.5,
              width: double.infinity,
              color: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Text(
                'hello hello hello hello hello hello hello hello hello hello',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

