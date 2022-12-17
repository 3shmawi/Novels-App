import 'package:flutter/material.dart';
import 'package:novels/fire_store_controller/controller.dart';
import 'package:novels/models/user.dart';
import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/utilities/enums/shared_pref.dart';

import '../../../../utilities/components/item_components/image.dart';
import '../../../../utilities/shared/icon_broken/icon_broken.dart';

class DefaultUserData extends StatelessWidget {
  const DefaultUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uid = CacheHelper.getData(key: SharedPrefKeys.id);
    return StreamBuilder<UserModel>(
      stream: FireStoreDataBase().getUserDataStream(uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var usrData = snapshot.data;
          if (usrData == null) {
            return Padding(
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
                            'User Name...',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'User Email Address...',
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
            );
          }
          return Padding(
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
                    child: Container(
                      height: 77,
                      width: 77,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: DefaultImageView(
                        image: usrData.imgUrl,
                      ),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          usrData.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          usrData.email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w500),
                        ),const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Uou are now Admin :)',
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
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
