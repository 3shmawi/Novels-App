import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/usr/modules/notification/cubit/notification_cubit.dart';

import '../../notification/cubit/notification_state.dart';

class DefaultSearch extends StatelessWidget {
  const DefaultSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 5),
      child: BlocBuilder<NotificationCubit, NotificationState>(

        builder: (context, state) {
          var cubit =context.read<NotificationCubit>();
          return InkWell(
            onTap: () =>
                cubit.sendPushMessage('Test', 'test'),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Text(
                    ' Search',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
