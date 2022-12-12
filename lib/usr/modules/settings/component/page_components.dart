import 'package:flutter/material.dart';

import '../../../../utilities/shared/icon_broken/icon_broken.dart';


class DefaultButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final GestureTapCallback? onTap;

  const DefaultButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 20,
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                IconBroken.arrowRight2,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
