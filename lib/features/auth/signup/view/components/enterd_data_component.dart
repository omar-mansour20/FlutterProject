import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_reservation_project/core/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_project/features/auth/signup/controller/signup_controller.dart';
import 'package:hotel_reservation_project/features/auth/signup/controller/signup_state.dart';

class enterd_data_component extends StatelessWidget {
  enterd_data_component({super.key, required this.controller});

  final SignupController controller;
  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<SignupController, SignupState>(
        builder: (context, state) {
          SignupController controller=context.read<SignupController>();
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "Create an account",
                  style: TextStyle(
                    color: Color.fromARGB(255, 20, 0, 99),
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),

                //the form
                 Form(
                   key: controller.formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            // first name
                              child: TextFormField(
                                controller: controller.firstNameController,
                                keyboardType: TextInputType.name,
                                validator: my_validation().nameValidate,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                                ],
                                expands: false,
                                decoration: InputDecoration(
                                  labelText: "First Name",
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              )
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            // last name
                              child: TextFormField(
                                controller: controller.lastNameController,
                                keyboardType: TextInputType.name,
                                validator: my_validation().nameValidate,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                                ],
                                expands: false,
                                decoration: InputDecoration(
                                  labelText: "Last Name",

                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              )
                          )
                        ],
                      ),
                      //first row finished

                      const SizedBox(height: 16),

                      //username
                      TextFormField(
                        controller: controller.UsernameController,
                        keyboardType: TextInputType.name,
                        validator: my_validation().nameValidate,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                        ],

                        expands: false,
                        decoration: InputDecoration(
                          labelText: "Username",

                          border: OutlineInputBorder(borderSide: const BorderSide(
                              color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      const SizedBox(height: 16),
                      //Email
                      TextFormField(
                        controller: controller.EmailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: my_validation().emailValidate,
                        expands: false,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: 'xxx@gmail.com',
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(borderSide: const BorderSide(
                              color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      const SizedBox(height: 16),
                      //phone number
                      TextFormField(
                        controller: controller.phoneNumberController,
                        keyboardType: TextInputType.name,
                        validator: my_validation().phoneValidate,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        expands: false,
                        decoration: InputDecoration(
                          labelText: "phone number",
                          hintText: '11 digit',
                          border: OutlineInputBorder(borderSide: const BorderSide(
                              color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      const SizedBox(height: 16),
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
                          border: OutlineInputBorder(borderSide: const BorderSide(
                              color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      //button
                      SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () {
                              controller.OnPressedConfirmButtom(context);
                                },
                              child: const Text("Create account")
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
