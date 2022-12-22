import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/fire_store_controller/controller.dart';
import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/utilities/enums/shared_pref.dart';
import 'package:novels/utilities/logic/dart_methods.dart';

import '../../../../models/novel.dart';
import '../../../../models/user.dart';
import '../../../../utilities/components/toast.dart';
import '../../../../utilities/shared/colors/default_app_color.dart';
import '../cubit/new_novel_cubit.dart';
import '../cubit/new_novel_state.dart';

class DefaultPostButton extends StatelessWidget {
  const DefaultPostButton({
    required this.novelTextController,
    required this.overViewController,
    required this.aboutAuthorController,
    required this.authorNameController,
    required this.novelNameController,
    required this.category,
    required this.formKey,
    Key? key,
  }) : super(key: key);

  final TextEditingController novelNameController;
  final TextEditingController authorNameController;
  final TextEditingController aboutAuthorController;
  final TextEditingController overViewController;
  final TextEditingController novelTextController;
  final String category;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var uid = CacheHelper.getData(key: SharedPrefKeys.id);
    return BlocConsumer<NewNovelCubit, NewNovelState>(
      listener: (context, state) {
        if (state is PostNovelSuccessState) {
          context.read<NewNovelCubit>().resetBase64();
          novelNameController.clear();
          authorNameController.clear();
          aboutAuthorController.clear();
          overViewController.clear();
          novelTextController.clear();
          showToast(text: 'Added Novel Successfully', color: Colors.green);
        }
      },
      builder: (context, state) {
        var cubit = context.read<NewNovelCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Post New Novel',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  StreamBuilder<UserModel>(
                    stream: FireStoreDataBase().getUserDataStream(uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        var userData = snapshot.data;
                        if (userData == null) {
                          return OutlinedButton(
                            onPressed: () {
                              cubit.createNewIdState();
                              if (formKey.currentState!.validate()) {
                                if (cubit.base64String == null) {
                                  showToast(
                                    text: 'Novel Cover required',
                                    color: Colors.red,
                                  );
                                } else if (cubit.imageSize) {
                                  showToast(
                                      text:
                                          'Image size should be less than one mega',
                                      color: Colors.red);
                                } else {
                                  showToast(
                                    text: 'check your network please!',
                                    color: Colors.red,
                                  );
                                }
                              }
                            },
                            child: Text(
                              'POST',
                              style:
                                  Theme.of(context).textTheme.button!.copyWith(
                                        color: defaultColor,
                                      ),
                            ),
                          );
                        }
                        return OutlinedButton(
                          onPressed: () {
                            cubit.createNewIdState();
                            if (formKey.currentState!.validate()) {
                              if (cubit.base64String == null) {
                                showToast(
                                  text: 'Novel Cover required',
                                  color: Colors.red,
                                );
                              } else if (cubit.imageSize) {
                                showToast(
                                    text:
                                        'Image size should be less than one mega',
                                    color: Colors.red);
                              } else {
                                cubit.setNovelAtPathAdmin(
                                  NovelModel(
                                    id: cubit.newId!,
                                    imgUrl: cubit.base64String!,
                                    title: makeFirstUpper(
                                        novelNameController.text),
                                    authorName: makeFirstUpper(
                                        authorNameController.text),
                                    aboutTheAuthor: makeFirstUpper(
                                        aboutAuthorController.text),
                                    overview:
                                        makeFirstUpper(overViewController.text),
                                    category: category,
                                    novelText: makeFirstUpper(
                                        novelTextController.text),
                                    userModel: userData,
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            'POST',
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: defaultColor,
                                ),
                          ),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
              if (state is PostNovelLoadingState)
                const Center(
                  child: LinearProgressIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }
}
