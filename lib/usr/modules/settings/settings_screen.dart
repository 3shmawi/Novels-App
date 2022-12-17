import 'package:flutter/material.dart';
import 'package:novels/utilities/routes/screens_route.dart';

import '../../../services/cache_helper_services.dart';
import '../../../services/firebase_auth_services.dart';
import '../../../utilities/components/toast.dart';
import '../../../utilities/enums/shared_pref.dart';
import '../../../utilities/shared/icon_broken/icon_broken.dart';
import '../auth/auth_screen.dart';
import 'component/buttons.dart';
import 'component/page_components.dart';
import 'component/usr_data.dart';

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
                      onTap: () {
                        showToast(text: 'لسه مخلصتهاش 🙂', color: Colors.red);
                      },
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
            const DefaultUserData(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      DefaultButton(
                        title: 'My Novels',
                        onTap: () {
                          showToast(text: 'لسه مخلصتهاش 🙂', color: Colors.red);
                        },
                        subTitle: 'Already have 3 novels',
                      ),
                      DefaultButton(
                        title: 'About Us',
                        onTap: () {
                          showToast(text: 'لسه مخلصتهاش 🙂', color: Colors.red);
                        },
                        subTitle: 'All you need to know about us',
                      ),
                      DefaultButton(
                        title: 'Contact Us',
                        onTap: () {
                          showToast(text: 'لسه مخلصتهاش 🙂', color: Colors.red);
                        },
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
              onPressed: () {
                Auth().logout().then((value) {
                  showToast(text: 'Logout Success', color: Colors.green);
                  CacheHelper.removeData(key: SharedPrefKeys.id);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthPage(),
                      ),
                      (route) => false);
                }).catchError((error) {
                  showToast(text: 'Logout Failed', color: Colors.red);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
