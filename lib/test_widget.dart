// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:async';
// import 'package:novels/modules/auth/cubit/auth_cubit.dart';
// import 'package:novels/modules/auth/cubit/auth_state.dart';
// import 'package:novels/utilities/components/button.dart';
// import 'package:novels/utilities/components/navigation.dart';
// import 'package:novels/utilities/components/text_form_field.dart';
// import 'package:novels/utilities/components/toast.dart';
// import 'package:novels/utilities/logic/dart_methods.dart';
// import 'package:novels/utilities/routes/screens_route.dart';
// import 'package:novels/utilities/shared/colors/default_app_color.dart';
//
// import 'layout/layout_screen.dart';
//
// void main() async {
//   runApp(
//     const MaterialApp(
//       home: HomePage(),
//       title: "Animated-Login-Page-UI",
//     ),
//   );
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.light,
//     ),
//   );
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   HomePageState createState() => HomePageState();
// }
//
// class HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   late AnimationController controller1;
//   late AnimationController controller2;
//   late Animation<double> animation1;
//   late Animation<double> animation2;
//   late Animation<double> animation3;
//   late Animation<double> animation4;
//
//   var userNameController = TextEditingController();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var state = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller1 = AnimationController(
//       vsync: this,
//       duration: const Duration(
//         seconds: 5,
//       ),
//     );
//     animation1 = Tween<double>(begin: .1, end: .15).animate(
//       CurvedAnimation(
//         parent: controller1,
//         curve: Curves.easeInOut,
//       ),
//     )
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller1.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           controller1.forward();
//         }
//       });
//     animation2 = Tween<double>(begin: .02, end: .04).animate(
//       CurvedAnimation(
//         parent: controller1,
//         curve: Curves.easeInOut,
//       ),
//     )..addListener(() {
//         setState(() {});
//       });
//
//     controller2 = AnimationController(
//       vsync: this,
//       duration: const Duration(
//         seconds: 5,
//       ),
//     );
//     animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
//       parent: controller2,
//       curve: Curves.easeInOut,
//     ))
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller2.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           controller2.forward();
//         }
//       });
//     animation4 = Tween<double>(begin: 170, end: 190).animate(
//       CurvedAnimation(
//         parent: controller2,
//         curve: Curves.easeInOut,
//       ),
//     )..addListener(() {
//         setState(() {});
//       });
//
//     Timer(const Duration(milliseconds: 2500), () {
//       controller1.forward();
//     });
//
//     controller2.forward();
//   }
//
//   @override
//   void dispose() {
//     controller1.dispose();
//     controller2.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color(0xff192028),
//       body: ScrollConfiguration(
//         behavior: MyBehavior(),
//         child: SingleChildScrollView(
//           child: SizedBox(
//             height: size.height,
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: size.height * (animation2.value + .58),
//                   left: size.width * .21,
//                   child: CustomPaint(
//                     painter: MyPainter(50),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * .98,
//                   left: size.width * .1,
//                   child: CustomPaint(
//                     painter: MyPainter(animation4.value - 30),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * .5,
//                   left: size.width * (animation2.value + .8),
//                   child: CustomPaint(
//                     painter: MyPainter(30),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * animation3.value,
//                   left: size.width * (animation1.value + .1),
//                   child: CustomPaint(
//                     painter: MyPainter(60),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * .1,
//                   left: size.width * .8,
//                   child: CustomPaint(
//                     painter: MyPainter(animation4.value),
//                   ),
//                 ),
//                 BlocBuilder<AuthCubit, AuthState>(
//                   buildWhen: (_, current) => current is ChangeAuthStateState,
//                   builder: (context, state) {
//                     var cubit = context.read<AuthCubit>();
//                     return cubit.authIsLoginState
//                         ? SignUpPage(
//                             userNameController: userNameController,
//                             passwordController: passwordController,
//                             emailController: emailController,
//                             size: size.height,
//                           )
//                         : LoginPage(
//                             emailController: emailController,
//                             size: size.height,
//                             passwordController: passwordController,
//                           );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MyPainter extends CustomPainter {
//   final double radius;
//
//   MyPainter(this.radius);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..shader = const LinearGradient(
//               colors: [Color(0xffFD5E3D), Color(0xffC43990)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight)
//           .createShader(Rect.fromCircle(
//         center: const Offset(0, 0),
//         radius: radius,
//       ));
//
//     canvas.drawCircle(Offset.zero, radius, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
//
// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildViewportChrome(
//       BuildContext context, Widget child, AxisDirection axisDirection) {
//     return child;
//   }
// }
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({
//     required this.emailController,
//     required this.size,
//     required this.passwordController,
//     Key? key,
//   }) : super(key: key);
//
//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   final double size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.only(top: size * .1),
//             child: Text(
//               'Novels App',
//               style: TextStyle(
//                 color: Colors.white.withOpacity(.7),
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1,
//                 wordSpacing: 4,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 7,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 AuthFormField(
//                   textEditingController: emailController,
//                   textInputType: TextInputType.emailAddress,
//                   prefixIcon: Icons.email_outlined,
//                   hintText: 'Email...',
//                 ),
//                 BlocBuilder<AuthCubit, AuthState>(
//                   builder: (context, state) {
//                     var cubit = context.read<AuthCubit>();
//                     return AuthFormField(
//                       textEditingController: passwordController,
//                       textInputType: TextInputType.visiblePassword,
//                       prefixIcon: Icons.lock_outline,
//                       hintText: 'Password...',
//                       isPassword: cubit.isPassword,
//                       suffixIcon: IconButton(
//                         onPressed: () => cubit.changePasswordVisibility(),
//                         icon: Icon(
//                           cubit.suffix,
//                           size: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 BlocConsumer<AuthCubit, AuthState>(
//                   listener: (context, state) =>
//                       listenerCondition2(state, context),
//                   builder: (context, state) {
//                     var cubit = context.read<AuthCubit>();
//                     return state is LoginLoadingState
//                         ? Center(
//                             child: CircularProgressIndicator(
//                               color: defaultColor,
//                             ),
//                           )
//                         : Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 flex: 2,
//                                 child: AuthButton(
//                                   onTap: () {
//                                     cubit.userLogin(
//                                       email: emailController.text,
//                                       password: passwordController.text,
//                                     );
//                                   },
//                                   textButton: 'LOGIN',
//                                 ),
//                               ),
//                               SizedBox(width: size / 60),
//                               Expanded(
//                                 child: AuthButton(
//                                   onTap: () {
//                                     Navigator.pushNamed(
//                                         context, ScreenRoute.resetScreenRoute);
//                                   },
//                                   textButton: 'Forgotten Password!',
//                                 ),
//                               ),
//                             ],
//                           );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 6,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 BlocBuilder<AuthCubit, AuthState>(
//                   builder: (context, state) {
//                     var cubit = context.read<AuthCubit>();
//                     return AuthButton(
//                       onTap: () {
//                         emailController.clear();
//                         passwordController.clear();
//                         cubit.changeLoginState();
//                       },
//                       textButton: 'Create a new Account',
//                     );
//                   },
//                 ),
//                 SizedBox(height: size * .05),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class SignUpPage extends StatelessWidget {
//   const SignUpPage({
//     required this.emailController,
//     required this.userNameController,
//     required this.size,
//     required this.passwordController,
//     Key? key,
//   }) : super(key: key);
//
//   final TextEditingController userNameController;
//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   final double size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.only(top: size * .1),
//             child: Text(
//               'Novels App',
//               style: TextStyle(
//                 color: Colors.white.withOpacity(.7),
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1,
//                 wordSpacing: 4,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 7,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 AuthFormField(
//                   textEditingController: userNameController,
//                   textInputType: TextInputType.name,
//                   prefixIcon: Icons.account_circle_outlined,
//                   hintText: 'User Name...',
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 15.0),
//                   child: AuthFormField(
//                     textEditingController: emailController,
//                     textInputType: TextInputType.emailAddress,
//                     prefixIcon: Icons.email_outlined,
//                     hintText: 'Email...',
//                   ),
//                 ),
//                 BlocBuilder<AuthCubit, AuthState>(
//                   builder: (context, state) {
//                     var cubit = context.read<AuthCubit>();
//                     return AuthFormField(
//                       textEditingController: passwordController,
//                       textInputType: TextInputType.visiblePassword,
//                       prefixIcon: Icons.lock_outline,
//                       hintText: 'Password...',
//                       isPassword: cubit.isPassword,
//                       suffixIcon: IconButton(
//                         onPressed: () => cubit.changePasswordVisibility(),
//                         icon: Icon(
//                           cubit.suffix,
//                           size: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 BlocConsumer<AuthCubit, AuthState>(
//                   listener: (context, state) {
//                     listenerCondition(state, context);
//                   },
//                   builder: (context, state) {
//                     var cubit = context.read<AuthCubit>();
//                     return state is CreateLoadingState
//                         ? Center(
//                             child: CircularProgressIndicator(
//                               color: defaultColor,
//                             ),
//                           )
//                         : AuthButton(
//                             onTap: () {
//                               cubit.userRegister(
//                                 name: userNameController.text,
//                                 email: emailController.text,
//                                 password: passwordController.text,
//                               );
//                             },
//                             textButton: 'REGISTER',
//                           );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 6,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 BlocBuilder<AuthCubit, AuthState>(
//                   builder: (context, state) {
//                     var cubit = context.read<AuthCubit>();
//                     return AuthButton(
//                       onTap: () {
//                         userNameController.clear();
//                         emailController.clear();
//                         passwordController.clear();
//                         cubit.changeLoginState();
//                       },
//                       textButton: 'Already have an Account?...',
//                     );
//                   },
//                 ),
//                 SizedBox(height: size * .05),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// void listenerCondition(AuthState state, BuildContext context) {
//   if (state is CreateUserSuccessState) {
//     showToast(text: 'Register Success', color: Colors.green);
//     navigateAndFinish(context, const LayoutScreen());
//   } else if (state is CreateUserErrorState) {
//     showToast(text: getErrorMessage(state.error), color: Colors.red);
//   }
// }
//
// void listenerCondition2(AuthState state, BuildContext context) {
//   if (state is LoginSuccessState) {
//     showToast(text: 'Login Success', color: Colors.green);
//     navigateAndFinish(context, const LayoutScreen());
//   } else if (state is LoginErrorState) {
//     showToast(text: getErrorMessage(state.error), color: Colors.red);
//   }
// }


