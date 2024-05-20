import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/controller/confirm_password_controller.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/controller/confirm_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class confirm_password_component extends StatelessWidget {
  confirm_password_component({super.key, required this.controller});
  final ConfirmPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocBuilder<ConfirmPasswordController,ConfirmPasswordState>(
        builder: (context, state)
    {
      ConfirmPasswordController controller = context.read<
          ConfirmPasswordController>();
      return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/a.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: controller.formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: controller.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                        ),
                        validator: my_validation().passwordValidate,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          controller.OnPressedConfirmButtom(context);
                        },
                        child: Text('Confirm'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
      );
    },
    ),
    );
  }
}