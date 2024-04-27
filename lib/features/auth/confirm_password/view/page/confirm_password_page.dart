import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/view/components/confirm_password_component.dart';
 

class confirmPasswordScreen extends StatelessWidget {
  static const String screenRoute = 'confirm_password_screen';

  const confirmPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        appBar: AppBar(),
        body: confirm_password_component(),
      ),
    );  
  }
}