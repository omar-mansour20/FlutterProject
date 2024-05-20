import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/controller/forget_password_controller.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/controller/forget_password_state.dart';

class forget_password_component extends StatelessWidget {
  forget_password_component({super.key, required this.controller});
  final ForgetPasswordController controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocBuilder<ForgetPasswordController,ForgetPasswordState>(
        builder: (context, state)
    {
      ForgetPasswordController controller = context.read<
          ForgetPasswordController>();
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/a.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: controller.EmailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                      ),
                      validator: my_validation().emailValidate,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 20.0),
                    // Reset Password button
                    ElevatedButton(
                      onPressed: () {
                        controller.OnPressedConfirmButtom(context);
                      },
                      child: Text('Reset Password'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
    ),
    );
  }
}