import 'package:bloc/bloc.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/account/model/repo/local_db_data.dart';
import 'package:flutter/material.dart';


class NewAccountCubit extends Cubit<NewAccountState>{
  NewAccountCubit (): super(NewAccountInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addAccount() async{
  await (await DatabaseRepo.instance).insert(name: nameController.text, email: emailController.text, phone:int.parse(phoneController.text),password:  passwordController.text);
  }
 

 void OnPressedConfirmButtom(BuildContext context) {
  if (formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('successfully')),
    );
    addAccount();
    Navigator.pushNamed(context, 'dashBoard');
  }
} 
}

class NewAccountState{}
class NewAccountInitial extends NewAccountState{}