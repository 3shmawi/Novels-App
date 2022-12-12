
import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class MyCustomBackground extends StatelessWidget {
  const MyCustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CircularParticle(
        width: w,
        height: h,
        awayRadius: w / 5,
        numberOfParticles: 150,
        speedOfParticles: 1.5,
        maxParticleSize: 7,
        particleColor: Colors.grey.withOpacity(.7),
        awayAnimationDuration: const Duration(milliseconds: 600),
        awayAnimationCurve: Curves.easeInOutBack,
        onTapAnimation: true,
        isRandSize: true,
        isRandomColor: false,
        connectDots: true,
        randColorList: [
        Colors.red.withAlpha(210),
        Colors.white.withAlpha(210),
        Colors.yellow.withAlpha(210),
        Colors.green.withAlpha(210),
        ],
        enableHover: true,
        hoverColor: Colors.black,
        hoverRadius: 90,
      ),
    );
  }
}
//
// class MyCustomBackground extends StatelessWidget {
//   const MyCustomBackground({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: const Color(0xff437BFF),
//       body: CircularParticle(
//         width: w,
//         height: h,
//         particleColor: Colors.white.withOpacity(.6),
//         numberOfParticles: 150,
//         speedOfParticles: 1.5,
//         maxParticleSize: 7,
//         awayRadius: 0,
//         onTapAnimation: false,
//         isRandSize: true,
//         isRandomColor: false,
//         connectDots: false,
//         enableHover: false,
//       ),
//     );
//   }
// }