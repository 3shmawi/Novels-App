abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends AuthState {
  final String error;

  LoginErrorState(this.error);
}

class CreateLoadingState extends AuthState {}

class CreateUserSuccessState extends AuthState {}

class CreateUserErrorState extends AuthState {
  final String error;

  CreateUserErrorState(this.error);
}

class ChangePasswordVisibilityState extends AuthState {}
class ChangeAuthStateState extends AuthState {}
