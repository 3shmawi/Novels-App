

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/admin/modules/upload/components/cubit/right_state.dart';

import '../../../../../utilities/logic/dart_methods.dart';

class RightCubit extends Cubit<RightState> {
  RightCubit() : super(RightInitial());



  bool changeDirections(String text) {
    if (text.isNotEmpty) {
      if (isFirstCharArabic(text)) {
        emit(ChangeDirectionState());
        return true;
      } else {
        emit(ChangeDirectionState());
        return false;
      }
    }
    emit(ChangeDirectionState());
    return false;
  }
}
