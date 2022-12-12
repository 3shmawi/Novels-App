import 'package:flutter/material.dart';
import 'package:novels/utilities/enums/shared_pref.dart';
import 'package:novels/utilities/routes/screens_route.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/boarding.dart';
import '../../../services/cache_helper_services.dart';
import '../../../utilities/components/icon_button.dart';
import '../../../utilities/shared/colors/default_app_color.dart';
import '../../../utilities/shared/icon_broken/icon_broken.dart';
import 'component/component.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/boarding1.png',
      title: 'Read your favourite books',
      body:
          'All your favourites book in one place, read any book, staying at home, on travelling, or anywhere else',
    ),
    BoardingModel(
      image: 'assets/images/boarding2.png',
      title: 'Read your favourite books',
      body:
          'All your favourites book in one place, read any book, staying at home, on travelling, or anywhere else',
    ),
    BoardingModel(
      image: 'assets/images/boarding1.png',
      title: 'Read your favourite books',
      body:
          'All your favourites book in one place, read any book, staying at home, on travelling, or anywhere else',
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: SharedPrefKeys.onBoarding,
      value: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    String id = CacheHelper.getData(key: SharedPrefKeys.id) ?? '';
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 0, right: 10),
              height: 40,
              width: 40,
              child: DefaultIconButton(
                iconData: IconBroken.arrowRightSquare,
                onTap: () {
                  id == ''
                      ? Navigator.pushNamedAndRemoveUntil(context,
                          ScreenRoute.authScreenRoute, (route) => false)
                      : Navigator.pushNamedAndRemoveUntil(context,
                          ScreenRoute.landingScreenRoute, (route) => false);
                  submit();
                },
                color: defaultColor,
                size: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: boardController,
                      onPageChanged: (int index) {
                        if (index == boarding.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                      itemBuilder: (context, index) =>
                          DefaultBoardingItem(boardingModel: boarding[index]),
                      itemCount: boarding.length,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: boardController,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: defaultColor,
                          dotHeight: 10,
                          expansionFactor: 4,
                          dotWidth: 10,
                          spacing: 5.0,
                        ),
                        count: boarding.length,
                      ),
                      const Spacer(),
                      FloatingActionButton(
                        backgroundColor: defaultColor,
                        onPressed: () {
                          if (isLast) {
                            submit();
                            id == ''
                                ? Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    ScreenRoute.authScreenRoute,
                                    (route) => false)
                                : Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    ScreenRoute.landingScreenRoute,
                                    (route) => false);
                          } else {
                            boardController.nextPage(
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          }
                        },
                        child: const Icon(
                          IconBroken.arrowRight2,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
