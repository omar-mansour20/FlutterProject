import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:hotel_reservation_project/features/auth/login/view/page/login.dart';


class verification_code_component extends StatelessWidget {
  const verification_code_component({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _NumController = TextEditingController();

    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Enter the verification code sent to your email',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _NumController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Verification Code',
                    border: OutlineInputBorder(),
                  ),
                  validator: my_validation().codeValidate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String password = _NumController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('successfully')),
                      );
                      Navigator.pushNamed(context, loginScreen.screenRoute);
                    }

                  },
                  child: const Text('Verify'),
                ),
              ],
            ),
          ),
        ),
      );
  }
}