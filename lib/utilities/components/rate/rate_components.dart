import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:novels/utilities/shared/icon_broken/icon_broken.dart';

import '../../../fire_store_controller/controller.dart';
import '../../../models/rate.dart';
import 'cubit/rate_cubit.dart';
import 'cubit/rate_state.dart';


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
    return StreamBuilder<List<RateModel>>(
      stream: FireStoreDataBase().getNovelRateStream(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var rate = snapshot.data;
          if (rate == null || rate.isEmpty) {
            return RatingBarIndicator(
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
          double rateSum = 0;
          for (var element in rate) {
            rateSum += element.rateValue;
          }
          return RatingBarIndicator(
            rating: rateSum / rate.length,
            itemBuilder: (context, index) => const Icon(
              IconBroken.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: size,
            direction: Axis.horizontal,
          );
        }
        return RatingBarIndicator(
          rating: 0,
          itemBuilder: (context, index) => const Icon(
            IconBroken.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: size,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class DefaultSetRatingFromUsr extends StatelessWidget {
  const DefaultSetRatingFromUsr({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RateModel>>(
      stream: FireStoreDataBase().getNovelRateStream(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var rate = snapshot.data;
          if (rate == null || rate.isEmpty) {
            return BlocBuilder<RateCubit, RateState>(
              buildWhen: (_, current) => current is SetRateSuccessState,
              builder: (context, state) {
                var cubit = context.read<RateCubit>();
                return RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  unratedColor: Colors.grey[300],
                  itemBuilder: (context, _) => const Icon(
                    IconBroken.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rateValue) {
                    cubit.setRate(
                      valueRate: RateModel(
                        id: id,
                        rateValue: rateValue,
                      ),
                      novelId: id,
                    );
                  },
                );
              },
            );
          }
          return BlocBuilder<RateCubit, RateState>(
            // buildWhen: (_, current) => current is SetRateSuccessState,
            builder: (context, state) {
              var cubit = context.read<RateCubit>();
              double rateSum = 0;
              for (var element in rate) {
                rateSum += element.rateValue;
              }
              return RatingBar.builder(
                initialRating: rateSum / rate.length,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                unratedColor: Colors.grey[300],
                itemBuilder: (context, _) => const Icon(
                  IconBroken.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rateValue) {
                  cubit.setRate(
                    valueRate: RateModel(
                      id: id,
                      rateValue: rateValue,
                    ),
                    novelId: id,
                  );
                },
              );
            },
          );
        }
        return BlocBuilder<RateCubit, RateState>(
          buildWhen: (_, current) => current is SetRateSuccessState,
          builder: (context, state) {
            var cubit = context.read<RateCubit>();
            return RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30,
              unratedColor: Colors.grey[300],
              itemBuilder: (context, _) => const Icon(
                IconBroken.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rateValue) {
                cubit.setRate(
                  valueRate: RateModel(
                    id: id,
                    rateValue: rateValue,
                  ),
                  novelId: id,
                );
              },
            );
          },
        );
      },
    );
  }
}