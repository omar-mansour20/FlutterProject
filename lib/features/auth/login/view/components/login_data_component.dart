import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/core/login_validation.dart';
import 'package:hotel_reservation_project/features/auth/login/controller/login_controller.dart';
import 'package:hotel_reservation_project/features/auth/login/controller/login_state.dart';
import 'package:hotel_reservation_project/features/auth/signup/view/page/signup_page.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/view/page/forgetPassword_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class login_data_component extends StatelessWidget {
  login_data_component({super.key, required this.controller});
  final LoginController controller;
  @override
  Widget build(BuildContext context) {


    return BlocProvider.value(
          value: controller,
          child: BlocBuilder<LoginController,LoginState>(
          builder: (context, state) {
        LoginController controller=context.read<LoginController>();
      return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/loginpage.png'), fit: BoxFit.cover),),
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.black54,
           title: const Text('Login', style: TextStyle(
             color: Colors.blueGrey,
             fontSize: 33),),),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
     Container(
       padding: const EdgeInsets.only(left: 35, top:90),
           child: const Text('Welcome', style: TextStyle(
               color: Colors.white,
               fontSize: 33),),
         ),
          Container(
            padding: EdgeInsets.only( top:MediaQuery.of(context).size.height * 0.3, right: 35, left: 35),
            child: Form(
              key: controller.formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.EmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: "Email",
                    hintText: 'xxx@gmail.com',
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),),
                   validator: login_validation().validateEmail,   ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Password",
                      hintText: 'at least 8 characters',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  validator: login_validation().validatePassword,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Sign In',style: TextStyle(
                  color: Colors.white54,
                    fontSize: 27,fontWeight: FontWeight.w700),
                  ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueAccent,
                   child:IconButton(
                     onPressed: (){
                        controller.OnPressedConfirmButtom(context);
                  },
                    icon: Icon(Icons.arrow_forward),
                  ),
        ),],
                ),
      SizedBox(
        height: 20,
      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // signup button

                    TextButton(onPressed:(){
                        Navigator.pushNamed(context, 'signup');
                    },
                     child: Text('Sign Up', style: TextStyle
                      (
                      decoration: TextDecoration.underline,
                     fontSize: 18,
                     color: Colors.white54,    ),
                    ),
                    
                    ),

                    // forgetpassword button

                    TextButton(onPressed:(){
                      Navigator.pushNamed(context, 'forgetPassword');
                    }, child: Text('Forget Password', style: TextStyle
                      (
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Colors.white54,    ),
                    ),),
                  ],
                )
              ],
            ),
          ),
          )
        ],
      ),
    ),
    );
  },
  ),
  );
}
}