import 'package:flutter/material.dart';
import 'package:project/Onboarding/onbording_item.dart';
import 'package:project/Onboarding/page1.dart';
import 'package:project/Onboarding/page2.dart';
import 'package:project/Onboarding/page3.dart';
import 'package:project/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboradingView extends StatefulWidget {
  static const String screenRoute = 'onbordingscreen';

  const OnboradingView({Key? key}) : super(key: key);

  @override
  State<OnboradingView> createState() => _OnboradingViewState();
}

class _OnboradingViewState extends State<OnboradingView> {
  PageController _controller = PageController();
  final controller = OnboardingItems();
  bool onLastPage = false;
  @override
  Widget build(BuildContext) {
    return Scaffold(
        body: Stack(children: [
      PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            Onpage1(),
            Onpage2(),
            Onpage3(),
          ]),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        alignment: Alignment(0, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  _controller.jumpToPage(2);
                },
                child: const Text("Skip")),
            SmoothPageIndicator(controller: _controller, count: 3),
            onLastPage
                ? TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.screenRoute);
                    },
                    child: const Text("done"))
                : TextButton(
                    onPressed: () {
                      _controller.nextPage(
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: const Text("Next")),
          ],
        ),
      ),
    ]));
  }
}
