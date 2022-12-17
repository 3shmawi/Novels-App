import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/utilities/components/rate/cubit/rate_state.dart';

import '../../../../models/rate.dart';
import '../../../../services/firestore_services.dart';
import '../../../firebase/collection_path.dart';

class RateCubit extends Cubit<RateState> {
  RateCubit() : super(RateInitial());

  final FirestoreServices _service = FirestoreServices.instance;

  void setRate({required RateModel valueRate, required String novelId}) {
    emit(SetRateLoadingState());
    _service
        .setData(
        path: FirebaseCollectionPath.setNovelRate(novelId),
        data: valueRate.toMap())
        .then((value) {
      emit(SetRateSuccessState());
    }).catchError((error) {
      emit(SetRateErrorState());
    });
  }

}
