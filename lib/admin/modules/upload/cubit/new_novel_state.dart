abstract class NewNovelState {}

class NewNovelInitial extends NewNovelState {}

class ResetImageState extends NewNovelState {}

class PickedImageSuccessState extends NewNovelState {}

class PickedImageErrorState extends NewNovelState {
  final String error;

  PickedImageErrorState(this.error);
}

class ChangeSelectedCategoryState extends NewNovelState {}

class CreateNewIdState extends NewNovelState {}

class PostNovelAtAdminPathLoadingState extends NewNovelState {}

class PostNovelAtAdminPathSuccessState extends NewNovelState {}

class PostNovelAtNovelsPathErrorState extends NewNovelState {}

class PostNovelAtAdminPathErrorState extends NewNovelState {}
