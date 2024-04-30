import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:hotel_reservation_project/features/auth/login/view/page/login.dart';


class confirm_password_component extends StatelessWidget {
  const confirm_password_component({super.key});
  

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _passwordController = TextEditingController();
    
    return Stack(
        children: [
        Container(
        decoration: BoxDecoration(
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
                TextFormField(
                  controller: _passwordController,
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
                    if (_formKey.currentState!.validate()) {
                      String password = _passwordController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('successfully')),
                      );
                      Navigator.pushNamed(context, loginScreen.screenRoute);
                    }
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
    
  }
}