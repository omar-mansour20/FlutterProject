import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/login/view/page/login.dart';
import 'package:hotel_reservation_project/forgetpassword.dart';
import 'package:hotel_reservation_project/features/auth/signup/view/page/signup_page.dart';

void main(){
  runApp(MyApp());
}
 

class MyApp extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute : loginScreen.screenRoute,
        routes: {
        SignUpScreen.screenRoute: (context)=> SignUpScreen(),
        loginScreen.screenRoute: (context)=> loginScreen(),
        ForgetPasswordScreen.screenRoute: (context)=> ForgetPasswordScreen(),
        },
      );
  }
}
