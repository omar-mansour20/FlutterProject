import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/Onboarding/onbordingview.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/view/page/forgetPassword_page.dart';
import 'package:hotel_reservation_project/features/auth/login/view/page/login.dart';
import 'package:hotel_reservation_project/features/auth/signup/view/page/signup_page.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/view/page/confirm_password_page.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/view/page/verification_code_page.dart';

void main(){
  runApp(MyApp());
}
 

class MyApp extends StatelessWidget{
 
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute : OnboradingView.screenRoute,
        routes: {
        SignUpScreen.screenRoute: (context)=> SignUpScreen(),
        loginScreen.screenRoute: (context)=> loginScreen(),
        forgetPaswwordScreen.screenRoute: (context)=> forgetPaswwordScreen(),
        VerificationCodeScreen.screenRoute: (context)=> VerificationCodeScreen(),
        confirmPasswordScreen.screenRoute: (context)=> confirmPasswordScreen(),
         OnboradingView.screenRoute: (context) =>  OnboradingView(),
        },
      );
  }
}
