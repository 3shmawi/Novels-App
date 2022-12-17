import 'package:flutter/material.dart';
import 'package:novels/fire_store_controller/controller.dart';
import 'package:novels/models/rate.dart';
import 'package:novels/usr/modules/open_a_novel/component/page_components.dart';

import '../../../../utilities/logic/dart_methods.dart';
import '../../../../utilities/shared/icon_broken/icon_broken.dart';

class DefaultRatingCount extends StatelessWidget {
  const DefaultRatingCount({required this.novelId,Key? key}) : super(key: key);
final String novelId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RateModel>>(
      stream: FireStoreDataBase().getNovelRateStream(novelId),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          var rates = snapshot.data;
          if(rates == null || rates.isEmpty){
            return  const DefaultHeadButton(
              text: '0.0 ',
              iconData: IconBroken.star,
            );
          }
          double rateSum = 0;
          for (var element in rates) {
            rateSum += element.rateValue;
          }
          return  DefaultHeadButton(
            text: '${getTwoDecimalDouble((rateSum / rates.length).toString())} ',
            iconData: IconBroken.star,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
