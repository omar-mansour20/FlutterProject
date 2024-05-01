import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/controller/verification_code_controller.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/controller/verification_code_state.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/view/components/verification_code_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class VerificationCodeScreen extends StatelessWidget {

  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:BlocProvider<VerificationCodeController>(
        create:(context) => VerificationCodeController(),
    child:BlocBuilder<VerificationCodeController, VerificationCodeState>(
    builder: (context, state) {
    final VerificationCodeController controller=context.read<VerificationCodeController>();
    return Scaffold(
    appBar: AppBar(),
    body: verification_code_component(controller:controller),
    );
    },
    ),
        ),
    );
  }
}