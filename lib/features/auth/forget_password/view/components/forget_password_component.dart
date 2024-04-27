import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/view/page/confirm_password_page.dart';


class forget_password_component extends StatelessWidget {
  const forget_password_component({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final _fromkey = GlobalKey<FormState>();

    return  Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/a.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _fromkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
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
                        if (_fromkey.currentState!.validate()) {
                          String email = _emailController.text;
                          print('Password reset request for $email');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('successfully')),
                          );
                          Navigator.pushNamed(context, confirmPasswordScreen.screenRoute);
                        }


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
  }
}