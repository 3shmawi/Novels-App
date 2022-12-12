import 'package:flutter/material.dart';
import 'package:novels/utilities/components/button.dart';
import 'components/cover_image.dart';
import 'components/page_component.dart';

class NewNovelScreen extends StatelessWidget {
  NewNovelScreen({Key? key}) : super(key: key);

  final TextEditingController novelNameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController aboutAuthorController = TextEditingController();
  final TextEditingController overViewController = TextEditingController();
  final TextEditingController novelTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AddCoverPhoto(),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultUploadPageFormField(
                          label: 'Novel Name',
                          textEditingController: novelNameController,
                        ),
                        DefaultUploadPageFormField(
                          label: 'Author Name',
                          textEditingController: authorNameController,
                        ),
                        DefaultUploadPageFormField(
                          label: 'About the Author',
                          textEditingController: aboutAuthorController,
                        ),
                        DefaultUploadPageFormField(
                          label: 'Overview',
                          textEditingController: overViewController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultUploadPageFormField(
                label: 'Novel Category',
                textEditingController: novelNameController,
              ),
              DefaultUploadPageFormField(
                hint: 'Novel String...',
                textEditingController: novelTextController,
                maxLines: 19,
              ),
              const SizedBox(
                height: 5,
              ),
              DefaultElevatedButton(
                header: Text(
                  'Submit',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
