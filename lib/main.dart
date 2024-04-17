import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/forgetpassword.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute:'login',
    routes: {
      'login' : (context)=> MyLogin(),
    },
  ));

}
