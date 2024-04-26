import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/signup/view/components/enterd_data_component.dart';

class SignUpScreen extends StatelessWidget {
  static const String screenRoute = 'signUp_screen';

  const SignUpScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        appBar: AppBar(),
        body: enterd_data_component(),
      ),
    );
  }
} 