import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/comment.dart';

import '../../../../services/firestore_services.dart';
import '../../../../utilities/firebase/collection_path.dart';
import 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  final FirestoreServices _service = FirestoreServices.instance;

  void setComment({required CommentModel comment, required String novelId,required String newId}) {
    emit(SetCommentLoadingState());
    _service
        .setData(
        path: FirebaseCollectionPath.setNovelComment(novelId,newId),
        data: comment.toMap())
        .then((value) {
      emit(SetCommentSuccessState());
    }).catchError((error) {
      emit(SetCommentErrorState());
    });
  }

  void setRepliesComment(
      {required CommentModel comment, required String novelId,required String newId,required String commentId}) {
    emit(SetRepliesCommentLoadingState());
    _service
        .setData(
        path: FirebaseCollectionPath.setNovelReplyComment(newId: newId,novelId: novelId,commentId:commentId ),
        data: comment.toMap())
        .then((value) {
      emit(SetRepliesCommentSuccessState());
    }).catchError((error) {
      emit(SetRepliesCommentErrorState());
    });
  }

}
