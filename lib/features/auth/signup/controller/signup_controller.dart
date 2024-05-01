import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/signup/controller/signup_state.dart';
import 'package:hotel_reservation_project/features/auth/login/view/page/login.dart';


class SignupController extends Cubit<SignupState>
{

  SignupController() : super(SignupInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController UsernameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
void OnPressedConfirmButtom(BuildContext context) {
  if (formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('successfully')),
    );
    Navigator.pushNamed(context, loginScreen.screenRoute);
  }
}
}