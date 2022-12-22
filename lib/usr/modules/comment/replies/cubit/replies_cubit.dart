import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/models/replies.dart';
import 'package:novels/usr/modules/comment/replies/cubit/replies_state.dart';

import '../../../../../services/firestore_services.dart';
import '../../../../../utilities/firebase/collection_path.dart';

class RepliesCubit extends Cubit<RepliesState> {
  RepliesCubit() : super(RepliesInitial());

  final FirestoreServices _service = FirestoreServices.instance;

  void setRepliesComment({required RepliesModel reply, required String newId}) {
    emit(SetRepliesCommentLoadingState());
    _service
        .setData(
            path: FirebaseCollectionPath.setNovelReplyComment(
                novelId: reply.commentModel.novelModel.id,
                newId: newId,
                commentId: reply.commentModel.id),
            data: reply.toMap())
        .then((value) {
      emit(SetRepliesCommentSuccessState());
    }).catchError((error) {
      emit(SetRepliesCommentErrorState());
    });
  }

  int length = -1;

  void changeIndex(int index) {
    length = index;
    emit(ChangeRepliesLengthState());
  }
}
