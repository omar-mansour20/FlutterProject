import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/login/controller/login_state.dart';
import 'package:hotel_reservation_project/features/auth/login/view/page/login.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/account_model.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/local_db_data.dart';

class LoginController extends Cubit<LoginState> {
  LoginController() : super(LoginInitial());
  TextEditingController passwordController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  

  Future<void> OnPressedConfirmButtom(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      final email = EmailController.text;
      final password = passwordController.text;
      if(true){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('successfully')),
      );
      Navigator.pushNamed(context, 'dashBoard');
      }
    
    else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('wrong password')),
      );
  }
}
}


  Future<bool> checkCredentials (String email, String password, BuildContext context) async {
    String? pass = await (await DatabaseRepo.instance).getPassword(email: email);
    if (password!=pass){
      return false;
    }
    else
      return true;
}
  
