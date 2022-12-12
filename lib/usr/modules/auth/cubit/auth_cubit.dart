import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/user.dart';
import '../../../../services/cache_helper_services.dart';
import '../../../../services/firebase_auth_services.dart';
import '../../../../services/firestore_services.dart';
import '../../../../utilities/enums/shared_pref.dart';
import '../../../../utilities/firebase/conllection_path.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    Auth().loginWithEmailAndPassword(email, password).then((value) {
      CacheHelper.saveData(key: SharedPrefKeys.id, value: value!.uid);
      emit(LoginSuccessState(value.uid));
      if (kDebugMode) {
        print('Login Success');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('hello');
      }
      emit(LoginErrorState(
        error.toString(),
      ));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  final FirestoreServices _service = FirestoreServices.instance;

  Future<void> createUser(UserModel clientUser) async => _service.setData(
        path: FirebaseCollectionPath.user(clientUser.id),
        data: clientUser.toMap(),
      );

  Future<void> userRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(CreateLoadingState());

    Auth().signUpWithEmailAndPassword(email, password).then((value) {
      CacheHelper.saveData(key: SharedPrefKeys.id, value: value!.uid);
      if (kDebugMode) {
        print('Create User Success');
      }
      createUser(
        UserModel(
          isAdmin: false,
          id: value.uid,
          name: name,
          email: email,
          imgUrl:
              'https://us.123rf.com/450wm/ne2pi/ne2pi2011/ne2pi201100001/158603194-anonymes-vektorsymbol-inkognito-zeichen-datenschutzkonzept-menschlicher-kopf-mit-glitch-gesicht-illu.jpg?ver=6',
        ),
      ).then((value) {
        emit(CreateUserSuccessState());
      }).catchError((error) {
        emit(CreateUserErrorState(error.toString()));
      });
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(CreateUserErrorState(error.toString()));
    });
  }

  bool authIsLoginState = true;

  void changeLoginState() {
    authIsLoginState = !authIsLoginState;
    emit(ChangeAuthStateState());
  }
}
