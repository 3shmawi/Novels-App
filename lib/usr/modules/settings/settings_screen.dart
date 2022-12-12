import 'package:flutter/material.dart';
import 'package:novels/utilities/routes/screens_route.dart';

import '../../../utilities/shared/icon_broken/icon_broken.dart';
import 'component/buttons.dart';
import 'component/page_components.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'My Profile',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const Spacer(),
                PopupMenuButton(
                  tooltip: 'More options',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 20,
                  icon: const Icon(IconBroken.moreSquare),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {},
                      height: 30,
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Delete Account  ',
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: Colors.red,
                                ),
                          ),
                          const Icon(
                            IconBroken.delete,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10,
                bottom: 25,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 38,
                      child: const Icon(
                        IconBroken.profile,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mohamed Ashmawi',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'mohamedashmawy918@gmail.com',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      DefaultButton(
                        title: 'My Novels',
                        onTap: () {},
                        subTitle: 'Already have 3 novels',
                      ),
                      DefaultButton(
                        title: 'About Us',
                        onTap: () {},
                        subTitle: 'All you need to know about us',
                      ),
                      DefaultButton(
                        title: 'Contact Us',
                        onTap: () {},
                        subTitle: 'send message on email...',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DefaultBarButton(
              header: 'Admin Page  ',
              iconData: IconBroken.chart,
              onPressed: () =>
                  Navigator.of(context).pushNamed(ScreenRoute.adminScreenRoute),
            ),
            DefaultBarButton(
              header: 'LOGOUT  ',
              iconData: IconBroken.logout,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
