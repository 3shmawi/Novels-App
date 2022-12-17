import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/usr/modules/novel_text/cubit/text_state.dart';

class TextCubit extends Cubit<TextState> {
  TextCubit() : super(TextInitial());

  double size = 25;

  void changeTextSize(double newSize) {
    size = newSize;
    emit(ChangeTextSizeState());
  }
}
