import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/admin/modules/home/home_screen.dart';
import 'package:novels/admin/modules/upload/new_novel_screen.dart';

import '../../../utilities/shared/icon_broken/icon_broken.dart';
import 'admin_layout_state.dart';

class AdminLayoutCubit extends Cubit<AdminLayoutState> {
  AdminLayoutCubit() : super(AdminLayoutInitial());
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.upload,
      ),
      label: 'New Novel',
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
     NewNovelScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(AdminLayoutBottomNavState());
  }
}
