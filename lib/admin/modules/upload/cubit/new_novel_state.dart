abstract class NewNovelState {}

class NewNovelInitial extends NewNovelState {}

class ResetImageState extends NewNovelState {}

class PickedImageSuccessState extends NewNovelState {}

class PickedImageErrorState extends NewNovelState {
  final String error;

  PickedImageErrorState(this.error);
}
