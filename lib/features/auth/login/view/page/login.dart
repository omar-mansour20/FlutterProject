import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/login/view/components/login_data_component.dart';

class loginScreen extends StatelessWidget {
  static const String screenRoute = 'login_screen';
  
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: login_data_component(),
      ),
    );
  }
}