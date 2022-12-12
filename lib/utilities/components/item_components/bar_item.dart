import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/usr/layout/cubit/layout_cubit.dart';
import 'package:novels/usr/layout/cubit/layout_state.dart';

import '../../shared/icon_broken/icon_broken.dart';

class DefaultBarItem extends StatelessWidget {
  const DefaultBarItem({
    required this.textCenter,
    required this.widget,
    this.isPop = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget widget;
  final String textCenter;
  final bool isPop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          BlocBuilder<LayoutCubit, LayoutStates>(
            buildWhen: (_, current) => current is ChangeBottomNavState,
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if(isPop) {
                    context.read<LayoutCubit>().changeBottom(0);
                  }
                  Navigator.pop(context);
                },
                icon: const Icon(
                  IconBroken.arrowLeftSquare,
                  color: Colors.black,
                ),
              );
            },
          ),
          Expanded(
            child: Text(
              textCenter,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: widget,
          ),
        ],
      ),
    );
  }
}
