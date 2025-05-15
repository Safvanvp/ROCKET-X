import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xclone/assets/app_animations.dart';
import 'package:xclone/components/my_introduction.dart';

import 'package:xclone/pages/onboarding/onboarding_screen.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  PageController _pagecontroller = PageController();
  bool onLastPage = false;
  bool onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          PageView(
            controller: _pagecontroller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
                onFirstPage = (index == 0);
              });
            },
            children: [
              MyIntroduction(
                  conttent:
                      'This is a app for improving your knowledge in general knowledge...  ',
                  animation: AppAnimations.first),
              MyIntroduction(
                  conttent:
                      'This is a app for improving your knowledge in general knowledge...  ',
                  animation: AppAnimations.second),
              MyIntroduction(
                  conttent:
                      'This is a app for improving your knowledge in general knowledge...  ',
                  animation: AppAnimations.thired),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  onFirstPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnboardingScreen()));
                          },
                          child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              alignment: Alignment.center,
                              child: Text('Skip')),
                        )
                      : GestureDetector(
                          onTap: () {
                            _pagecontroller.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInBack);
                          },
                          child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              alignment: Alignment.center,
                              child: Text('Back')),
                        ),
                  SmoothPageIndicator(
                    controller: _pagecontroller,
                    count: 3,
                  ),
                  !onLastPage
                      ? GestureDetector(
                          onTap: () {
                            _pagecontroller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              alignment: Alignment.center,
                              child: Text('Next')),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnboardingScreen()));
                          },
                          child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              alignment: Alignment.center,
                              child: Text('Done')),
                        )
                ],
              ))
        ],
      ),
    );
  }
}
