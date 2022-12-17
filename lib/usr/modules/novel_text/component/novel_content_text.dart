import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utilities/logic/dart_methods.dart';
import '../cubit/text_cubit.dart';
import '../cubit/text_state.dart';

class DefaultNovelText extends StatelessWidget {
  const DefaultNovelText({
    required this.text,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection:
          isFirstCharArabic(text) ? TextDirection.rtl : TextDirection.ltr,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.caption!.copyWith(
          fontWeight: FontWeight.bold,
          height: 1.3,
          fontSize: fontSize,
          color: Colors.grey[600]),
    );
  }
}

class DefaultNovelContent extends StatelessWidget {
  const DefaultNovelContent({
    required this.novel,
    required this.authorName,
    Key? key,
  }) : super(key: key);

  final String authorName;
  final String novel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefaultNovelText(
                  text: authorName,
                  fontSize: 20,
                ),
              ),
              BlocBuilder<TextCubit, TextState>(
                buildWhen: (_, current) => current is ChangeTextSizeState,
                builder: (context, state) {
                  var cubit = context.read<TextCubit>();
                  return DefaultNovelText(
                    text: novel,
                    fontSize: cubit.size,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
