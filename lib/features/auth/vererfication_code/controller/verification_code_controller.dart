import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/view/page/confirm_password_page.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/controller/verification_code_state.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/view/page/verification_code_page.dart';


class VerificationCodeController extends Cubit<VerificationCodeState>
{
  VerificationCodeController() : super(VerificationCodeInitial());
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  void OnPressedConfirmButtom(BuildContext context) {
    if (formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('successfully')),
      );
      Navigator.pushNamed(context, 'confirmPassword');
    }
  }
}