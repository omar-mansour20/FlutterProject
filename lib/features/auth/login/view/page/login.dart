import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/login/view/components/login_data_component.dart';

class loginScreen extends StatelessWidget {
  
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: login_data_component(),
      ),
    );
  }
}