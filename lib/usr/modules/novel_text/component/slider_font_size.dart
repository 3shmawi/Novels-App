import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/usr/modules/novel_text/cubit/text_cubit.dart';
import 'package:novels/usr/modules/novel_text/cubit/text_state.dart';

import 'novel_content_text.dart';
class DefaultFontSizeSlider extends StatelessWidget {
  const DefaultFontSizeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.grey[200],
      elevation: 50,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 8),
            child: DefaultNovelText(
              text: 'Font Size',
              fontSize: 12,
            ),
          ),
          BlocBuilder<TextCubit, TextState>(
            buildWhen: (_, current) => current is ChangeTextSizeState,
            builder: (context, state) {
              var cubit = context.read<TextCubit>();
              return Slider(
                value: cubit.size,
                max: 50,
                min: 12,
                onChanged: (v) => cubit.changeTextSize(v),
              );
            },
          ),
        ],
      ),
    );
  }
}
