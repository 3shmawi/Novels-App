
abstract class CommentState {}

class CommentInitial extends CommentState {}

class SetCommentLoadingState extends CommentState {}

class SetCommentSuccessState extends CommentState {}

class SetCommentErrorState extends CommentState {}


class SetRepliesCommentLoadingState extends CommentState {}

class SetRepliesCommentSuccessState extends CommentState {}

class SetRepliesCommentErrorState extends CommentState {}
