import 'package:flutter/material.dart';
import 'package:novels/usr/modules/comments/components/send_comment_form_field.dart';

import '../../../../utilities/shared/icon_broken/icon_broken.dart';

class DefaultSendCommentBar extends StatelessWidget {
  const DefaultSendCommentBar({
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            Expanded(
              child: Card(
                color: Colors.black.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DefaultAddCommentFormField(
                  hintText: 'Write a comment',
                  textEditingController: textEditingController,
                  textInputType: TextInputType.text,
                  prefixIcon: IconBroken.chart,
                ),
              ),
            ),
            SizedBox(
              height: 45,
              width: 45,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Card(
                  color: Colors.black.withOpacity(0.5),
                  elevation: 10,
                  margin: const EdgeInsets.all(2),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      IconBroken.send,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
