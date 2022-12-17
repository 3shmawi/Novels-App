import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:novels/utilities/routes/screens_route.dart';

import '../../../../utilities/shared/icon_broken/icon_broken.dart';

class DefaultNotification extends StatelessWidget {
  const DefaultNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Stack(
      children: [
        if(false) Container(
          margin: const EdgeInsets.all(10),
          height: 45,
          width: 40,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () =>Navigator.of(context).pushNamed(ScreenRoute.notificationScreenRoute),
              child: const Center(
                child: Icon(
                  IconBroken.notification,
                  size: 26,
                ),
              ),
            ),
          ),
        ),
        if(true)
          Container(
            margin: const EdgeInsets.all(10),
            height: 45,
            width: 40,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              color: Colors.white,

            ),
          ),
        if(true)
          InkWell(onTap: ()=>Navigator.of(context).pushNamed(ScreenRoute.notificationScreenRoute), child: Lottie.asset('assets/images/notification.json', height: 60))

      ],
    );
  }
}
