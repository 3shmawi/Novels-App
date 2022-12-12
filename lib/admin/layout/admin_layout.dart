import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/admin_layout_cubit.dart';
import 'cubit/admin_layout_state.dart';


class AdminLayoutScreen extends StatelessWidget {
  const AdminLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminLayoutCubit, AdminLayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: context
              .read<AdminLayoutCubit>()
              .screens[context.read<AdminLayoutCubit>().currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.read<AdminLayoutCubit>().currentIndex,
            onTap: (index) {
              context.read<AdminLayoutCubit>().changeBottomNavBar(index);
            },
            items: context.read<AdminLayoutCubit>().bottomItems,
          ),
        );
      },
    );
  }
}
