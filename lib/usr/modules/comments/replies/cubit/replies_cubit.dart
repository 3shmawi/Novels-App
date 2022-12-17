// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:novels/usr/modules/comments/replies/cubit/replies_state.dart';
//
// import '../../../../../models/comment.dart';
// import '../../../../../services/firestore_services.dart';
// import '../../../../../utilities/firebase/collection_path.dart';
//
// class RepliesCubit extends Cubit<RepliesState> {
//   RepliesCubit() : super(RepliesInitial());
//
//   final FirestoreServices _service = FirestoreServices.instance;
//
//   void setRepliesComment(
//       {required CommentModel comment, required String novelId}) {
//     emit(SetRepliesCommentLoadingState());
//     _service
//         .setData(
//             path: FirebaseCollectionPath.setNovelReplyComment(novelId),
//             data: comment.toMap())
//         .then((value) {
//       emit(SetRepliesCommentSuccessState());
//     }).catchError((error) {
//       emit(SetRepliesCommentErrorState());
//     });
//   }
// }
