import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/controller/forget_password_state.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/view/page/verification_code_page.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/local_db_data.dart';

class ForgetPasswordController extends Cubit<ForgetPasswordState> {
  ForgetPasswordController() : super(ForgetPasswordInitial());

  TextEditingController EmailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<bool> checkEmail(String email) async{
    bool check = await(await DatabaseRepo.instance).checkEmail(email: email);
    return check;
  }
  Future<void> OnPressedConfirmButtom(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if(await checkEmail(EmailController.text)){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('successfully')),
      );
      Navigator.pushNamed(context, 'verificationCode',arguments: EmailController.text);
      }
      else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email not existing')),
      );
    }
  }
}
