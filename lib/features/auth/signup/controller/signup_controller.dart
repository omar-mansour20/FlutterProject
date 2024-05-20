import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/signup/controller/signup_state.dart';
import 'package:hotel_reservation_project/features/auth/login/view/page/login.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/local_db_data.dart';


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

  Future<void> addAccount() async{
  await (await DatabaseRepo.instance).insert(name: UsernameController.text, email: EmailController.text, phone:int.parse(phoneNumberController.text),password:  passwordController.text);
  }
  
void OnPressedConfirmButtom(BuildContext context) {
  if (formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('successfully')),
    );
    addAccount();
    Navigator.pushNamed(context, 'login');
  }
}
}