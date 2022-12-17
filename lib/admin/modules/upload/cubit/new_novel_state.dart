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

class PostNovelLoadingState extends NewNovelState {}

class PostNovelSuccessState extends NewNovelState {}

class PostNovelAtNovelsPathErrorState extends NewNovelState {}

class PostNovelAtAdminPathErrorState extends NewNovelState {}

