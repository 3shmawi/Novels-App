import 'package:flutter/material.dart';

class DefaultUploadPageFormField extends StatelessWidget {
  const DefaultUploadPageFormField({
    required this.textEditingController,
    this.maxLines = 1,
    this.label,
    this.hint,
    Key? key,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final String? label;
  final String? hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: Theme.of(context).textTheme.caption,
          hintStyle: Theme.of(context)
              .textTheme
              .button!
              .copyWith(color: Colors.grey, height: 3),
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}

