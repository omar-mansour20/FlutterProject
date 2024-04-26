import 'package:flutter/material.dart';
import 'package:project/Signup.dart';
import 'package:project/login.dart';
import 'package:project/forgetpassword.dart';
import 'package:project/Onboarding/Onbording_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  OnboradingView.screenRoute,
      routes: {
        SignUpScreen.screenRoute: (context) => SignUpScreen(),
        LoginScreen.screenRoute: (context) => LoginScreen(),
        ForgetPasswordScreen.screenRoute: (context) => ForgetPasswordScreen(),
         OnboradingView.screenRoute: (context) =>  OnboradingView(),
      },
    );
  }
}
