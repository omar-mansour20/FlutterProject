import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/view/components/verification_code_component.dart';

class VerificationCodeScreen extends StatelessWidget {

  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        appBar: AppBar(),
        body: verification_code_component(),
      ),
    );
  }
}