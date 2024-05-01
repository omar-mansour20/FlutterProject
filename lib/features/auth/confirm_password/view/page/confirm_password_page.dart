import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/controller/confirm_password_controller.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/controller/confirm_password_state.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/view/components/confirm_password_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class confirmPasswordScreen extends StatelessWidget {

  const confirmPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:BlocProvider<ConfirmPasswordController>(
        create:(context) => ConfirmPasswordController(),
    child:BlocBuilder<ConfirmPasswordController,ConfirmPasswordState>(
    builder: (context, state) {
    final ConfirmPasswordController controller=context.read<ConfirmPasswordController>();
    return Scaffold(
    appBar: AppBar(),
    body: confirm_password_component(controller:controller),
    );
    },
    ),
        ),
    );  
  }
}