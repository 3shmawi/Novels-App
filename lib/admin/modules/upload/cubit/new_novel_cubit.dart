import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'new_novel_state.dart';

class NewNovelCubit extends Cubit<NewNovelState> {
  NewNovelCubit() : super(NewNovelInitial());

  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  String? base64String;

  void resetBase64() {
    base64String = null;

    imageSize = false;
    emit(ResetImageState());
  }

  bool imageSize = false;

  void pickImageBase64() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      Uint8List imageBytes = await image.readAsBytes();
      base64String = base64.encode(imageBytes);

      final imageTemp = File(image.path);

      imageFile = imageTemp;

      if ((((imageFile!.readAsBytesSync().lengthInBytes) / 1024) / 1024) >= 1) {
        imageSize = true;
      }

      emit(PickedImageSuccessState());
    } on PlatformException catch (e) {
      emit(PickedImageErrorState(e.toString()));
    }
  }
}
