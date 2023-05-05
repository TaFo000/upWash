import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:up_wash/pages/onboardingScreenCarousel.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';
import '../upWashColors.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  double _currentPagePosition = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPagePosition = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final UpWashColors upwashColors = Theme.of(context).extension<UpWashColors>()!;

    return Scaffold(
      backgroundColor: upwashColors.backgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                color: upwashColors.backgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(23)
              ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 32,
                        color: Color(0xffD9D9D9)
                    )
                  ]
              )
            ),
          ),
          SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(
                height: 28,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    OnboardingScreenCarousel(
                        title: AppLocalizations.of(context).onboardingTitleFisrt,
                        text: AppLocalizations.of(context).onboradingFirst,
                        imagePath: A.assetsOnboardingFirst),
                    OnboardingScreenCarousel(
                        title: AppLocalizations.of(context).onboardingTitleSecond,
                        text:  AppLocalizations.of(context).onboardingSecond,
                        imagePath: A.assetsOnboardingSecond),
                    OnboardingScreenCarousel(
                        title: AppLocalizations.of(context).onboardingTitleThird,
                        text: AppLocalizations.of(context).onboardingThird,
                        imagePath: A.assetsOnboardingThird)
                  ],
                ),
              ),
              DotsIndicator(
                dotsCount: 3,
                position: _currentPagePosition,
                decorator: DotsDecorator(
                  color: Color(0xffFF6600).withOpacity(0.3),
                  activeColor: upwashColors.primaryOrange,
                  spacing: const EdgeInsets.all(6.0),
                  size: const Size.square(10.0),
                  activeSize: const Size(32.0, 10.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),

              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: PrimaryButton(
                  title: AppLocalizations.of(context).oboardingStartButton,
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                ),
              ),
              const SizedBox(
                height: 18,
              )
            ],
          ),
        ),]
      ),
    );
  }
}