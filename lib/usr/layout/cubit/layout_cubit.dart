import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/shared/icon_broken/icon_broken.dart';
import '../../modules/categories/categories_screen.dart';
import '../../modules/favorites/favorites_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/settings/settings_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingScreen(),
  ];

  List<IconData> listOfIcons = [
    IconBroken.home,
    IconBroken.category,
    IconBroken.bookmark,
    IconBroken.setting,
  ];

  List<String> listOfStrings = [
    'Home',
    'Categories',
    'Booked',
    'Settings',
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
