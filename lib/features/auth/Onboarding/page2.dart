import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/Onboarding/onbording_item.dart';

class Onpage2 extends StatefulWidget {
  @override
  State<Onpage2> createState() => _Onpage2State();
}

class _Onpage2State extends State<Onpage2> {
  final controller = OnboardingItems();
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemCount: controller.items.length,
      controller: pageController,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(controller.items[1].image),
            const SizedBox(height: 10),
            Text(
              controller.items[1].title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(controller.items[1].descriptions,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
                textAlign: TextAlign.center),
          ],
        );
      },
    ));
  }
}
