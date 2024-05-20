import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/signup/controller/signup_controller.dart';
import 'package:hotel_reservation_project/features/auth/signup/controller/signup_state.dart';
import 'package:hotel_reservation_project/features/auth/signup/view/components/enterd_data_component.dart';

class SignUpScreen extends StatelessWidget {

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:BlocProvider<SignupController>(
        create:(context) => SignupController(),
        child:BlocBuilder<SignupController, SignupState>(
        builder: (context, state) {
          final SignupController controller=context.read<SignupController>();
          return Scaffold(
            appBar: AppBar(),
            body: enterd_data_component(controller: controller),
          );

        },
        ),
    ),
    );
  }
}