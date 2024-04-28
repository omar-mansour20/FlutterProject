import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/Onboarding/onbording_item.dart';

class Onpage1 extends StatefulWidget {
  @override
  State<Onpage1> createState() => _Onpage1State();
}

class _Onpage1State extends State<Onpage1> {
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
            Image.asset(controller.items[0].image),
            const SizedBox(height: 10),
            Text(controller.items[0].title,
             style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Text(controller.items[0].descriptions,
            style:const TextStyle(color: Colors.grey,fontSize: 15),  textAlign: TextAlign.center),
           ],
           

        );
      },
    ));
  }
}
