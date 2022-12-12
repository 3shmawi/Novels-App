import 'package:flutter/material.dart';

class DefaultHeadTitle extends StatelessWidget {
  const DefaultHeadTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
