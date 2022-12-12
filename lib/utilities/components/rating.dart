
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';


// class DefaultRating extends StatelessWidget {
//   const DefaultRating({
//     Key? key,
//     required this.id,
//     this.size = 25,
//     this.isShow= false,
//   }) : super(key: key);
//   final double size;
//   final String id;
//   final bool isShow;
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<RateModel>>(
//       stream: FireStoreDataBase().getRateProductStream(id),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           var rate = snapshot.data;
//           if (rate == null || rate.isEmpty) {
//             return RatingBarIndicator(
//               rating: 0,
//               itemBuilder: (context, index) => const Icon(
//                 Icons.star_border,
//                 color: Colors.amber,
//               ),
//               itemCount: 5,
//               itemSize: size,
//               direction: Axis.horizontal,
//             );
//           }
//           double rateSum = 0;
//           for (var element in rate) {
//             rateSum += element.rateValue;
//           }
//           return Row(
//             children: [
//               RatingBarIndicator(
//                 rating: rateSum / rate.length,
//                 itemBuilder: (context, index) => const Icon(
//                   Icons.star_border,
//                   color: Colors.amber,
//                 ),
//                 itemCount: 5,
//                 itemSize: size,
//                 direction: Axis.horizontal,
//               ),
//               if(isShow)
//                 const Spacer(),
//               if(isShow)
//                 Text(
//                   ' (${getTwoDecimalDouble((rateSum / rate.length).toString())})',
//                   style: Theme.of(context).textTheme.caption,
//                 ),
//               Text(
//                 ' (${rate.length})',
//                 style: Theme.of(context).textTheme.caption,
//               ),
//             ],
//           );
//         }
//         return RatingBarIndicator(
//           rating: 0,
//           itemBuilder: (context, index) => const Icon(
//             Icons.star_border,
//             color: Colors.amber,
//           ),
//           itemCount: 5,
//           itemSize: size,
//           direction: Axis.horizontal,
//         );
//       },
//     );
//   }
// }
class DefaultRating extends StatelessWidget {
  const DefaultRating({
    Key? key,
    required this.id,
    this.size = 25,
    this.isShow= false,
  }) : super(key: key);
  final double size;
  final String id;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    return   RatingBarIndicator(
      rating: 0,
      itemBuilder: (context, index) => const Icon(
        IconBroken.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: size,
      direction: Axis.horizontal,
    );
  }
}

// class DefaultRatingFromUsr extends StatelessWidget {
//   const DefaultRatingFromUsr({
//     Key? key,
//     required this.id,
//   }) : super(key: key);
//   final String id;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<RateModel>>(
//       stream: FireStoreDataBase().getRateProductStream(id),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           var rate = snapshot.data;
//           if (rate == null || rate.isEmpty) {
//             return BlocBuilder<UserCubit, UserState>(
//               buildWhen: (_, current) => current is SetRateSuccessState,
//               builder: (context, state) {
//                 var cubit = context.read<UserCubit>();
//                 return RatingBar.builder(
//                   initialRating: 0,
//                   minRating: 0,
//                   direction: Axis.horizontal,
//                   allowHalfRating: true,
//                   itemCount: 5,
//                   itemSize: 30,
//                   unratedColor: Colors.grey[300],
//                   itemBuilder: (context, _) => const Icon(
//                     Icons.star_border,
//                     color: Colors.amber,
//                   ),
//                   onRatingUpdate: (rateValue) {
//                     cubit.setRate(
//                       valueRate: RateModel(
//                         id: id,
//                         rateValue: rateValue,
//                       ),
//                       productId: id,
//                     );
//                   },
//                 );
//               },
//             );
//           }
//           return BlocBuilder<UserCubit, UserState>(
//             // buildWhen: (_, current) => current is SetRateSuccessState,
//             builder: (context, state) {
//               var cubit = context.read<UserCubit>();
//               double rateSum = 0;
//               for (var element in rate) {
//                 rateSum += element.rateValue;
//               }
//               return RatingBar.builder(
//                 initialRating: rateSum / rate.length,
//                 minRating: 0,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemSize: 30,
//                 unratedColor: Colors.grey[300],
//                 itemBuilder: (context, _) => const Icon(
//                   Icons.star_border,
//                   color: Colors.amber,
//                 ),
//                 onRatingUpdate: (rateValue) {
//                   cubit.setRate(
//                     valueRate: RateModel(
//                       id: id,
//                       rateValue: rateValue,
//                     ),
//                     productId: id,
//                   );
//                 },
//               );
//             },
//           );
//         }
//         return BlocBuilder<UserCubit, UserState>(
//           buildWhen: (_, current) => current is SetRateSuccessState,
//           builder: (context, state) {
//             var cubit = context.read<UserCubit>();
//             return RatingBar.builder(
//               initialRating: 0,
//               minRating: 0,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 30,
//               unratedColor: Colors.grey[300],
//               itemBuilder: (context, _) => const Icon(
//                 Icons.star_border,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rateValue) {
//                 cubit.setRate(
//                   valueRate: RateModel(
//                     id: id,
//                     rateValue: rateValue,
//                   ),
//                   productId: id,
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
