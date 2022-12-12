import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utilities/components/navigation.dart';
import '../../../../utilities/components/toast.dart';
import '../../../../utilities/logic/dart_methods.dart';
import '../../../../utilities/routes/screens_route.dart';
import '../../../../utilities/shared/colors/default_app_color.dart';
import '../../../layout/layout_screen.dart';
import '../component/auth_button.dart';
import '../component/auth_form_field.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    required this.emailController,
    required this.size,
    required this.passwordController,
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.only(top: size * .1),
            child: Text(
              'Novels App',
              style: TextStyle(
                color: Colors.white.withOpacity(.7),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 4,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AuthFormField(
                  textEditingController: emailController,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  hintText: 'Email...',
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    var cubit = context.read<AuthCubit>();
                    return AuthFormField(
                      textEditingController: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock_outline,
                      hintText: 'Password...',
                      isPassword: cubit.isPassword,
                      suffixIcon: IconButton(
                        onPressed: () => cubit.changePasswordVisibility(),
                        icon: Icon(
                          cubit.suffix,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) =>
                      listenerCondition(state, context),
                  builder: (context, state) {
                    var cubit = context.read<AuthCubit>();
                    return state is LoginLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: defaultColor,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: AuthButton(
                                  onTap: () {
                                    cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                  textButton: 'LOGIN',
                                ),
                              ),
                              SizedBox(width: size / 60),
                              Expanded(
                                child: AuthButton(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ScreenRoute.resetScreenRoute);
                                  },
                                  textButton: 'Forgotten Password!',
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    var cubit = context.read<AuthCubit>();
                    return AuthButton(
                      onTap: () {
                        emailController.clear();
                        passwordController.clear();
                        cubit.changeLoginState();
                      },
                      textButton: 'Create a new Account',
                    );
                  },
                ),
                SizedBox(height: size * .05),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void listenerCondition(AuthState state, BuildContext context) {
  if (state is LoginSuccessState) {
    showToast(text: 'Login Success', color: Colors.green);
    navigateAndFinish(context, const LayoutScreen());
  } else if (state is LoginErrorState) {
    showToast(text: getErrorMessage(state.error), color: Colors.red);
  }
}
