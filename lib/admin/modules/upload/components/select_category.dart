import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../fire_store_controller/controller.dart';
import '../../../../models/category.dart';
import '../cubit/new_novel_cubit.dart';
import '../cubit/new_novel_state.dart';

var selectedCategory = '';

class DefaultSelectedCategory extends StatelessWidget {
  const DefaultSelectedCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15.0, vertical: 10),
        child: StreamBuilder<List<CategoryModel>>(
          stream: FireStoreDataBase().getCategoriesStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.active) {
              final category = snapshot.data;
              if (category == null || category.isEmpty) {
                return const Center(
                  child: Text(
                    'No Category Available yet!',
                  ),
                );
              }

              return BlocBuilder<NewNovelCubit, NewNovelState>(
                builder: (context, state) {
                  var cubit = context.read<NewNovelCubit>();
                   selectedCategory = cubit.selectedCategory;
                  if (selectedCategory == '') {
                    selectedCategory = category[0].title;
                  }
                  return DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    alignment: AlignmentDirectional.center,
                    value: selectedCategory,
                    elevation: 15,
                    underline: Container(),
                    isExpanded: true,
                    focusColor: Colors.grey,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    dropdownColor: Colors.grey[300],
                    items: List.generate(
                      category.length,
                          (index) => DropdownMenuItem(
                        value: category[index].title,
                        child: Text(category[index].title),
                      ),
                    ),
                    onChanged: (String? category) {
                      cubit.changeSelectedCategory(category!);
                    },
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
