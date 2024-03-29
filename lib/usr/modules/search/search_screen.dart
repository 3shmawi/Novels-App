import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/utilities/components/background.dart';

import '../../../utilities/components/icon_button.dart';
import '../../../utilities/components/toast.dart';
import '../../../utilities/shared/icon_broken/icon_broken.dart';
import 'cubit/search_cubit.dart';
import 'cubit/search_state.dart';



class SearchScreen extends StatelessWidget {
  SearchScreen({
    Key? key,
    required this.searchId,
  }) : super(key: key);
  final String searchId;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          const MyCustomBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        DefaultIconButton(
                          onTap: () =>
                            Navigator.pop(context),
                          iconData: IconBroken.arrowLeftSquare,
                          size: 12,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: BlocBuilder<SearchCubit, SearchState>(
                                builder: (context, state) {
                                  var cubit = context.read<SearchCubit>();
                                  return TextFormField(
                                    controller: searchController,
                                    onChanged: (String value) {
                                      if (value.isEmpty) {
                                        // cubit.clearSearchResult();
                                      } else {
                                        switch (searchId) {
                                          case 'allProducts':
                                            // cubit.searchAtAllProducts(value);
                                            break;
                                          case 'cartSearch':
                                            // cubit.searchAtCartProducts(value);
                                        }
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Search about you need',
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 15),
                                      border: InputBorder.none,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        BlocBuilder<SearchCubit, SearchState>(
                          builder: (context, state) {
                            var cubit = context.read<SearchCubit>();
                            return DefaultIconButton(
                              onTap: () {
                                showToast(text: 'لسه مخلصتهاش 🙂', color: Colors.red);
                                if (searchController.text.isEmpty) {
                                  showToast(
                                      text: 'Form search required',
                                      color: Colors.red);
                                } else {
                                  switch (searchId) {
                                    case 'allProducts':
                                      // cubit
                                      //     .searchAtAllProducts(searchController.text.toLowerCase());
                                      break;
                                    case 'cartSearch':
                                      // cubit.searchAtCartProducts(
                                      //     searchController.text.toLowerCase());
                                  }
                                }
                              },
                              iconData: IconBroken.search,
                              size: 13,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // BlocBuilder<SearchCubit, SearchState>(
                  //   buildWhen: (previous, current) => current is ChangeSearchState,
                  //   builder: (context, state) {
                  //     // var products = context.read<SearchCubit>().resultSearch;
                  //     return products.isNotEmpty
                  //         ? Expanded(
                  //       child: SingleChildScrollView(
                  //         child: Column(
                  //           children: List.generate(
                  //             products.length,
                  //                 (index) => DefaultProductCard(
                  //               product: products[index],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //         : Expanded(
                  //       child: Image.asset(
                  //         'assets/images/search.png',
                  //         width: double.infinity,
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
