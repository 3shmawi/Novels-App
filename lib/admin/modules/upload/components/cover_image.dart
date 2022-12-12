import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/utilities/components/item_components/image.dart';

import '../../../../utilities/shared/colors/default_app_color.dart';
import '../cubit/new_novel_cubit.dart';
import '../cubit/new_novel_state.dart';

class AddCoverPhoto extends StatelessWidget {
  const AddCoverPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<NewNovelCubit, NewNovelState>(
      buildWhen: (_, current) => current is PickedImageSuccessState,
      builder: (context, state) {
        var cubit = context.read<NewNovelCubit>();
        return InkWell(
          onTap: () => cubit.pickImageBase64(),
          borderRadius: BorderRadius.circular(10),
          child: cubit.base64String != null
              ? Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: size.width / 2.5,
                  height: size.height / 3.5,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: DefaultImageView(
                    image: cubit.base64String!,
                  ),
                )
              : Container(
                  width: size.width / 2.5,
                  height: size.height / 3.5,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: defaultColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: defaultColor,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Add Novel Cover',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: defaultColor),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
