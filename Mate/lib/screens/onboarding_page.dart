import 'package:bankingapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bankingapp/app_styles.dart';
import 'package:bankingapp/size_configs.dart';
import 'package:bankingapp/screens/login/HomeScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:bankingapp/main.dart';
import 'package:bankingapp/models/onboarding_data.dart';

import '../widgets/widgets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      duration: const Duration(milliseconds: 400),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? kPurpleColor : kDarkWhiteColor,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
    );
  }

  Future setSeenOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboarding page for the first time.
  }

  @override
  void initState() {
    super.initState();
    // calll setSeenOnboarding() here
    setSeenOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(
                    () {
                      currentPage = value;
                    },
                  );
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: sizeVertical * 1,
                    ),
                    SizedBox(
                      height: sizeVertical * 50,
                      child: onboardingContents[index].image,
                    ),
                    SizedBox(
                      height: sizeVertical * 2,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          onboardingContents[index].title,
                          style: kTitleOnboarding,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 1,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          onboardingContents[index].subtitle,
                          style: kSubtitleOnboarding,
                          maxLines: 6,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 5,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // to make dynamic view based on page position
                    currentPage == onboardingContents.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                  onboardingContents.length,
                                  (index) => AnimatedContainer(
                                    margin: const EdgeInsets.only(
                                      right: 8,
                                    ),
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: kYellowColor,
                                      borderRadius: BorderRadius.circular(8),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              ),
                              OnboardingNavButton(
                                name: 'Empezar',
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    curve: Curves.easeInOut,
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                                buttonColor: kYellowColor,
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                  onboardingContents.length,
                                  (index) => dotIndicator(index),
                                ),
                              ),
                              OnboardingNavButton(
                                name: 'Siguiente',
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                buttonColor: kPurpleColor,
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
