import 'package:flutter/material.dart';

import '../../../../utilities/components/button.dart';

class DefaultBarButton extends StatelessWidget {
  const DefaultBarButton({
    required this.onPressed,
    required this.iconData,
    required this.header,
    Key? key,
  }) : super(key: key);

  final String header;
  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: DefaultElevatedButton(
          header: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                header,
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.white,
                    ),
              ),
              Icon(iconData),
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
