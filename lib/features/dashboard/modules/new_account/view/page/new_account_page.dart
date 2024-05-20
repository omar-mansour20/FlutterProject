import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:hotel_reservation_project/features/dashboard/modules/new_account/controller/new_account_cubit.dart';

class NewAccountPage extends StatelessWidget {
  const NewAccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<NewAccountCubit>(
            create: (context) => NewAccountCubit(),
            child: BlocBuilder<NewAccountCubit, NewAccountState>(
                builder: (context, state) {
              final NewAccountCubit controller =
                  context.read<NewAccountCubit>();

              return Scaffold(
                appBar: AppBar(
                  title: const Text('Add a new Account'),
                ),
                body: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      //username
                      TextFormField(
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        validator: my_validation().nameValidate,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[A-Za-z]')),
                        ],
                        expands: false,
                        decoration: InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      const SizedBox(height: 30),
                      //Email
                      TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: my_validation().emailValidate,
                        expands: false,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: 'xxx@gmail.com',
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      const SizedBox(height: 30),
                      //phone number
                      TextFormField(
                        controller: controller.phoneController,
                        keyboardType: TextInputType.name,
                        validator: my_validation().phoneValidate,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        expands: false,
                        decoration: InputDecoration(
                          labelText: "phone number",
                          hintText: '11 digit',
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      const SizedBox(height: 30),
                      // password
                      TextFormField(
                        controller: controller.passwordController,
                        keyboardType: TextInputType.name,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: my_validation().passwordValidate,
                        expands: false,
                        decoration: InputDecoration(
                          labelText: "password",
                          hintText: 'at least 6 characters',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      const SizedBox(height: 30),
                      //button
                      SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.OnPressedConfirmButtom(context);
                                //controller.addAccount();
                              },
                              child: const Text("Create account"))),
                    ],
                  ),
                ),
              );
            })));
  }
}
