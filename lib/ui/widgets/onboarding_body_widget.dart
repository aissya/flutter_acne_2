import 'package:flutter/material.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';

class OnBoardingBodyWidget extends StatelessWidget {
  const OnBoardingBodyWidget(
      {Key? key, required this.heroImage, required this.pageController})
      : super(key: key);
  final PageController pageController;
  final String heroImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(23),
      ),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              pageController.animateToPage(
                3,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Skip',
              style: aclonicaTextStyle.copyWith(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: weightBold,
                color: pinkColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: getProportionateScreenHeight(0),
                left: getProportionateScreenWidth(32),
                right: getProportionateScreenWidth(32)),
            child: Image.asset(heroImage),
          ),
        ],
      ),
    );
  }
}
