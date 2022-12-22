import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/comment.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../services/firestore_services.dart';
import '../../../../../utilities/firebase/collection_path.dart';
import 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  final FirestoreServices _service = FirestoreServices.instance;

  void setComment({required CommentModel comment, required String newId}) {
    emit(SetCommentLoadingState());
    _service
        .setData(
            path: FirebaseCollectionPath.setNovelComment(
                comment.novelModel.id, newId),
            data: comment.toMap())
        .then((value) {
      emit(SetCommentSuccessState());
    }).catchError((error) {
      emit(SetCommentErrorState());
    });
  }


  int length = -1;

  void changeIndex(int index) {
    length = index;
    emit(ChangeLengthState());
  }
}
