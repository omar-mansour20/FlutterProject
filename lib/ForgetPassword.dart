import 'package:flutter/material.dart';



class ForgetPasswordScreen extends StatefulWidget{
  static const String screenRoute = 'forgetPassword_screen';

  const ForgetPasswordScreen({Key? key}) : super(key: key);

    @override
   State<ForgetPasswordScreen>createState() => _ForgetPasswordScreenState();
} 

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>{
  
  final TextEditingController _emailController = TextEditingController();
  final _fromkey = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    RegExp exp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final isemailvalid = exp.hasMatch(email ?? '');
    if (!isemailvalid) {
      return 'Please enter your email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bb.jpeg"),
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
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 20.0),
                    // Reset Password button
                    ElevatedButton(
                      onPressed: () {
                        _fromkey.currentState!.validate();
                        String email = _emailController.text;
                        print('Password reset request for $email');
                      },
                      child: Text('Reset Password'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

