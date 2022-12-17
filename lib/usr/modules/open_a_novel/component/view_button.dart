import 'package:flutter/material.dart';
import 'package:novels/usr/modules/open_a_novel/component/page_components.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../utilities/shared/icon_broken/icon_broken.dart';

class DefaultViewButton extends StatelessWidget {
  const DefaultViewButton({required this.novelId,Key? key}) : super(key: key);

  final String novelId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      stream: FireStoreDataBase().getNovelViewsStream(novelId),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          var views = snapshot.data;
          if(views == null || views.isEmpty){
           return const DefaultHeadButton(
              text: '0 ',
              iconData: IconBroken.show,
            );
          }
          return  DefaultHeadButton(
            text: '${views.length} ',
            iconData: IconBroken.show,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
