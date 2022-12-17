import 'package:flutter/material.dart';

class DefaultUploadPageFormField extends StatelessWidget {
  const DefaultUploadPageFormField({

    required this.isRight,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.label,
    this.hint,
    Key? key,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final String? label;
  final String? hint;
  final int maxLines;
  final TextInputType textInputType;

  final bool isRight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: textInputType,
        maxLines: maxLines,
        validator: (value) {
          if (value!.isEmpty) return 'It required';
          return null;
        },
        textDirection:
        isRight ? TextDirection.rtl : TextDirection.ltr,
        decoration: InputDecoration(

          labelText: label,
          hintText: hint,
          labelStyle: Theme.of(context).textTheme.caption,
          hintStyle: Theme.of(context).textTheme.button!.copyWith(
            color: Colors.grey,
          ),
          hintTextDirection:  isRight ? TextDirection.rtl : TextDirection.ltr,

          border:
          maxLines > 5 ? InputBorder.none : const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          errorText: '',
          errorStyle: const TextStyle(height: 0.4),
        ),
      ),
    );
  }
}
