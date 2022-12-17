import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/comment.dart';
import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/utilities/components/view/cubit/view_state.dart';
import 'package:novels/utilities/enums/shared_pref.dart';

import '../../../../services/firestore_services.dart';
import '../../../firebase/collection_path.dart';



class ViewCubit extends Cubit<ViewState> {
  ViewCubit() : super(ViewInitial());
  final FirestoreServices _service = FirestoreServices.instance;

  String id = CacheHelper.getData(key: SharedPrefKeys.id);

  void setView({required String novelId}) {
    emit(SetViewLoadingState());
    _service
        .setData(
            path: FirebaseCollectionPath.setNovelView(novelId),
            data: {'id':id})
        .then((value) {
      emit(SetViewSuccessState());
    }).catchError((error) {
      emit(SetViewErrorState());
    });
  }
}
