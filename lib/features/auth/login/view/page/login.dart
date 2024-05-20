import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/login/controller/login_controller.dart';
import 'package:hotel_reservation_project/features/auth/login/controller/login_state.dart';
import 'package:hotel_reservation_project/features/auth/login/view/components/login_data_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class loginScreen extends StatelessWidget {
  
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:BlocProvider<LoginController>(
        create:(context) => LoginController(),
    child:BlocBuilder<LoginController, LoginState>(
    builder: (context, state) {
    final LoginController controller=context.read<LoginController>();
    return Scaffold(
    body: login_data_component(controller: controller),
    );
    },
    ),
    ),
    );
  }
}