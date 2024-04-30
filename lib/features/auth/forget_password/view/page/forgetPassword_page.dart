import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/controller/forget_password_controller.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/controller/forget_password_state.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/view/components/forget_password_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class forgetPaswwordScreen extends StatelessWidget {
  static const String screenRoute = 'forgetPassword_screen';

  const forgetPaswwordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child:BlocProvider<ForgetPasswordController>(
    create:(context) => ForgetPasswordController(),
    child:BlocBuilder<ForgetPasswordController, ForgetPasswordState>(
    builder: (context, state) {
    final ForgetPasswordController controller=context.read<ForgetPasswordController>();
    return Scaffold(
    appBar: AppBar(),
    body: forget_password_component(controller: controller,),
    );
    },
    ),
    ),
    );
  }
}