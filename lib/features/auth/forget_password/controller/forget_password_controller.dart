
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/controller/forget_password_state.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/view/page/verification_code_page.dart';



class ForgetPasswordController extends Cubit<ForgetPasswordState>
{
  ForgetPasswordController() : super(ForgetPasswordInitial());
  TextEditingController EmailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
void OnPressedConfirmButtom(BuildContext context) {
  if (formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('successfully')),
    );
    Navigator.pushNamed(context,'verificationCode');
  }
}
}