import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/cover_image.dart';
import 'components/cubit/right_cubit.dart';
import 'components/cubit/right_state.dart';
import 'components/page_component.dart';
import 'components/post_button.dart';
import 'components/select_category.dart';

class NewNovelScreen extends StatelessWidget {
  NewNovelScreen({Key? key}) : super(key: key);

  final TextEditingController novelNameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController aboutAuthorController = TextEditingController();
  final TextEditingController overViewController = TextEditingController();
  final TextEditingController novelTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Form(
        key: formKey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 45),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AddCoverPhoto(),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: BlocBuilder<RightCubit, RightState>(
                            buildWhen: (_,current)=>current is ChangeDirectionState,
                            builder: (context, state) {
                              var cubit = context.read<RightCubit>();
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DefaultUploadPageFormField(
                                    isRight: cubit.changeDirections(
                                        novelNameController.text),
                                    label: 'Novel Name',
                                    textEditingController: novelNameController,
                                  ),
                                  DefaultUploadPageFormField(
                                    isRight: cubit.changeDirections(
                                        overViewController.text),
                                    label: 'Overview',
                                    textEditingController: overViewController,
                                  ),
                                  DefaultUploadPageFormField(
                                    isRight: cubit.changeDirections(
                                        authorNameController.text),
                                    label: 'Author Name',
                                    textEditingController: authorNameController,
                                  ),
                                  DefaultUploadPageFormField(
                                    isRight: cubit.changeDirections(
                                        aboutAuthorController.text),
                                    label: 'About the Author',
                                    textEditingController:
                                        aboutAuthorController,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        '  Select Category',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    const DefaultSelectedCategory(),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        '  Novel Text',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1.3),
                      ),
                      child: BlocBuilder<RightCubit, RightState>(
                        builder: (context, state) {
                          var cubit = context.read<RightCubit>();
                          return DefaultUploadPageFormField(
                            isRight: cubit
                                .changeDirections(novelTextController.text),
                            hint: 'Novel Text...',
                            textEditingController: novelTextController,
                            textInputType: TextInputType.multiline,
                            maxLines: 20,
                          );
                        },
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
            ),
            DefaultPostButton(
              aboutAuthorController: aboutAuthorController,
              authorNameController: authorNameController,
              novelTextController: novelTextController,
              novelNameController: novelNameController,
              overViewController: overViewController,
              category: selectedCategory,
              formKey: formKey,
            ),
          ],
        ),
      ),
    );
  }
}
