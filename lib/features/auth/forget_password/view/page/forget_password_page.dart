import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/view/components/forget_password_component.dart';

class forgetPaswwordScreen extends StatelessWidget {

  const forgetPaswwordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        appBar: AppBar(),
        body: forget_password_component(),
      ),
    );
  }
}