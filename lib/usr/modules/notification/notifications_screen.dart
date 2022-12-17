import 'package:flutter/material.dart';

import '../../../utilities/components/item_components/bar_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
Card(
  child: Row(

    children: [

    ],
  ),
)
              ],
            ),
            DefaultBarItem(
              textCenter: 'Notifications',
              widget: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
