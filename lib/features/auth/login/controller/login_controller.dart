
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/login/controller/login_state.dart';
import 'package:hotel_reservation_project/features/auth/login/view/page/login.dart';


class LoginController extends Cubit<LoginState>
{

  LoginController() : super(LoginInitial());
  TextEditingController passwordController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void OnPressedConfirmButtom(BuildContext context) {
    if (formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('successfully')),
      );
      Navigator.pushNamed(context, loginScreen.screenRoute);
    }
  }
}