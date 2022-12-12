import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required this.header,
  }) : super(key: key);
  final String header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Text(
        header,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
