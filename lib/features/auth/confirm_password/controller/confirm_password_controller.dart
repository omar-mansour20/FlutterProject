import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/controller/confirm_password_state.dart';

class ConfirmPasswordController extends Cubit<ConfirmPasswordState>
{

  ConfirmPasswordController() : super(ConfirmPasswordInitial());
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void OnPressedConfirmButtom(BuildContext context) {
    if (formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('successfully')),
      );
      Navigator.pushNamed(context, 'login');
    }
  }
}