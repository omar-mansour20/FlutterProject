import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/Onboarding/onbording_item.dart';
class Onpage3 extends StatefulWidget {
  @override
  State<Onpage3> createState() => _Onpage3State();
}

class _Onpage3State extends State<Onpage3> {
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
          children:
           [
            Image.asset(controller.items[2].image),
            const SizedBox(height: 10),
            Text(controller.items[2].title,
             style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Text(controller.items[2].descriptions,
            style:const TextStyle(color: Colors.grey,fontSize: 15),  textAlign: TextAlign.center),
           ],
           

        );
      },
    ));
  }
}