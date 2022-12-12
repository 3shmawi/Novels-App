import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/utilities/components/background.dart';

import 'component/page_components.dart';
import 'cubit/layout_cubit.dart';
import 'cubit/layout_state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: BlocBuilder<LayoutCubit, LayoutStates>(
        buildWhen: (_, current) => current is ChangeBottomNavState,
        builder: (context, state) {
          var cubit = context.read<LayoutCubit>();
          return Stack(
            children: [
              const MyCustomBackground(),
              cubit.bottomScreens[cubit.currentIndex],
            ],
          );
        },
      ),
      bottomNavigationBar: const DefaultBottomNavigationBar(),
    );
  }
}
